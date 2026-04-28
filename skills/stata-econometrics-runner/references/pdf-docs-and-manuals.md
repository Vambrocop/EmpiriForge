# PDF Docs and Stata Manuals

Use this reference when Stata documentation, codebooks, or manuals are in large PDF form.

## Core Rule

Do not load an entire Stata PDF manual into context. Search or convert only the relevant section.

## Preferred Workflow

1. Identify the command, topic, or error.
2. Search available PDFs or extracted text for the exact term.
3. Extract a small relevant section.
4. Convert recurring references to Markdown or text.
5. Summarize the rule in the run report or code comment only when it affects the task.

## Useful Tools

Use tools only when installed and appropriate:

- `pdfgrep`: search inside PDFs without loading full manuals.
- `pandoc`: convert documents to Markdown when conversion is clean enough.
- `pdfplumber`: inspect PDF structure, tables, and page text with Python.
- OCR tools: use when the PDF is scanned rather than born-digital.

## What To Extract

Prefer compact evidence:

- command syntax;
- option definitions;
- returned results;
- stored estimation results;
- examples that match the user's task;
- warnings or limitations.

Avoid copying long manual sections into generated output.

## Stata-Specific Notes

Stata command behavior often depends on:

- official command vs user-written package;
- Stata version;
- estimation sample;
- panel declaration with `xtset`;
- time-series declaration with `tsset`;
- factor-variable notation;
- weights;
- clustering and small-sample corrections.

When a result differs from expectations, inspect logs and stored outputs before assuming the command is wrong.

## Documentation Cache

For repeated project use, maintain a small project documentation folder:

```text
docs/stata-notes/
  regress.md
  reghdfe.md
  ivreg2.md
  csdid.md
  rdrobust.md
  estout.md
```

Each note should be short: purpose, syntax used in this project, critical options, expected outputs, and known pitfalls.
