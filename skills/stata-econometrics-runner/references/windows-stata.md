# Windows Stata Notes

Use this reference when working on Windows Stata projects.

## Discovery Order

1. Check `Get-Command stata,Stata,StataMP,StataSE,StataBE`.
2. Check registry uninstall keys for `DisplayName` matching `Stata`.
3. Check common install paths:
   - `C:\Program Files\Stata18\`
   - `C:\Program Files\Stata17\`
   - `C:\Program Files\Stata16\`
   - `C:\Program Files (x86)\Stata18\`
   - `C:\Program Files (x86)\Stata17\`
   - `C:\Program Files (x86)\Stata16\`
4. Ask the user for the executable path if discovery finds only an install record but no executable.

## Current Machine Note

Registry discovery may show:

```text
DisplayName: Stata17
InstallLocation: C:\Program Files\Stata17\
```

At the time this skill was created, common executable names were not found inside that directory. If the user can open Stata from the Start menu, locate the shortcut target and use that path as the Stata executable.

## Common Executable Names

```text
StataMP-64.exe
StataSE-64.exe
StataBE-64.exe
Stata-64.exe
StataMP.exe
StataSE.exe
StataBE.exe
Stata.exe
```

## Batch Execution Shape

Use the project root as the working directory and capture logs:

```powershell
& $stataExe /e do "run_all.do"
```

If that flag fails, inspect Stata's installed help or try the edition-specific executable. Do not keep retrying blindly.

## Data Handling

Stata `.dta` files are binary. Avoid loading large files into the AI context. Prefer:

- Stata `describe`, `codebook`, `summarize`;
- Stata `export delimited` for small samples;
- Python `pyreadstat` for metadata or controlled extracts;
- existing log files when available.
