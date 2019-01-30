# Pandoc-letter

This repository contains M akefile to generate a pdf letter from a Markdown file with using Pandoc and Texlive.
It's using my Docker image [janbaer/texlive-pandoc](https://cloud.docker.com/u/janbaer/repository/docker/janbaer/texlive-pandochttps://cloud.docker.com/u/janbaer/repository/docker/janbaer/texlive-pandoc).

To create a pdf you have to execute make with the name of the Markdown file that should be transformed.

The Latex template is using the Komascript class **scrlttr2** which is producing a letter that satisfies the German DIN 5008 norm for letters.

The template is builtin my Docker image but you can use your own template. For this you've to change the Makefile and set your own template file.

```bash
make FILE=letter.md
```

To view the create pdf just use

```bash
make view FILE=letter.pdf
```

To watch the Markdown file and rebuild it, whenever some changes were made, use

```bash
make watch FILE=letter.md
```

## Example

```markdown
---
author: Max Mustermann
phone: +49 1234 56789
email: max.mustermann@beispiel.de
date: \today
place: Musterstadt
subject: Titel vom Brief
return-address:
 - Musterstraße
 - 12345 Berlin
address:
 - Musterfirma GmbH
 - Max Mustermann
 - Musterstraße
 - 12345 Musterstadt
opening: Sehr geehrte Damen und Herren,
closing: Mit freundlichen Grüßen
encludes: Muster, Muster, Muster
...
```

## Configuration

The following yaml variables are supported by the letter template:

- `opening`
- `closing`
- `encludes`
- `author`
- `phone`
- `email`
- `place`
- `subject`
- `return-address`
- `address`

