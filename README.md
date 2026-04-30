# Unofficial ISPRS Paper Typst Template

> [!IMPORTANT]
> This is an unofficial template that tries to follow the guidelines of the official ISPRS templates in Word and LaTeX.
> These official documents are available in the [appendix 5 of the Orange book](https://www.isprs.org/documents/orangebook/app5.aspx).

## Configuration

The template exports the isprs function with the following arguments:

- `title`: The title of the paper.
- `authors`: An array of authors, each author is a dictionary with the following keys:
    - `name`: The name of the author.
    - `organization`: The affiliation of the author.
    - `location`: The location of the affiliation.
    - `email`: The email of the author.
- `abstract`: The abstract of the paper.
- `keywords`: An array of keywords.
- `acknowledgements`: The acknowledgements, if any.
- `bibliography`: The result of the bibliography function, if any.
- `appendix`: The content of the appendix, if any.
- `anonymous`: A boolean indicating whether the paper should be anonymized for review. If true, the authors and acknowledgements will be hidden.

## Issues

- Bibliography:
    - A [custom bibliography style](./src/custom-isprs.csl) was implemented in the Citation Style Language (CSL) format to try to reproduce the one used in the official templates.
      However, it may contain some errors.
    - At the time of writing this, there is a [bug in Typst](https://github.com/typst/hayagriva/issues/463) that loses the `volume` field in the BibTeX entries if it is not an integer.
      There is no workaround for this, so I recommend using the [Hayagriva bibliography management format](https://github.com/typst/hayagriva) instead of BibTeX.
      It is very easy to translate a .bib file into a .yaml file with their CLI tool, and you can then add the `volume` field as a string in the .yaml file, which will prevent the bug from happening.
    - The `howpublished` field in BibTeX is not supported by the bibliography implementation in Typst, so it is recommended to use the other fields instead: `url`, `urldate`, `publisher`, `location`, etc.

## TODO

- Check whether the formatting of the bibliography entries is coherent with the LaTeX template.
- Publish the template on Typst Universe once it is finished.
