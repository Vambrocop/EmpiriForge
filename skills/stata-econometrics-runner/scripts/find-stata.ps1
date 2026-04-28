$commands = @('stata', 'Stata', 'StataMP', 'StataSE', 'StataBE')
$found = @()

foreach ($command in $commands) {
    $cmd = Get-Command $command -ErrorAction SilentlyContinue
    if ($cmd) {
        $found += [pscustomobject]@{
            Source = 'PATH'
            Name = $cmd.Name
            Path = $cmd.Source
        }
    }
}

$registryPaths = @(
    'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*',
    'HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
)

foreach ($regPath in $registryPaths) {
    Get-ItemProperty $regPath -ErrorAction SilentlyContinue |
        Where-Object { $_.DisplayName -match 'Stata' } |
        ForEach-Object {
            $found += [pscustomobject]@{
                Source = 'Registry'
                Name = $_.DisplayName
                Path = $_.InstallLocation
            }
        }
}

$commonDirs = @(
    'C:\Program Files\Stata18',
    'C:\Program Files\Stata17',
    'C:\Program Files\Stata16',
    'C:\Program Files (x86)\Stata18',
    'C:\Program Files (x86)\Stata17',
    'C:\Program Files (x86)\Stata16'
)

$exeNames = @(
    'StataMP-64.exe',
    'StataSE-64.exe',
    'StataBE-64.exe',
    'Stata-64.exe',
    'StataMP.exe',
    'StataSE.exe',
    'StataBE.exe',
    'Stata.exe'
)

foreach ($dir in $commonDirs) {
    foreach ($exe in $exeNames) {
        $path = Join-Path $dir $exe
        if (Test-Path -LiteralPath $path) {
            $found += [pscustomobject]@{
                Source = 'CommonPath'
                Name = $exe
                Path = $path
            }
        }
    }
}

$found | Sort-Object Source, Name, Path -Unique | ConvertTo-Json -Depth 3
