#import "@local/magic-isprs:0.1.0": isprs-heading
#show: isprs-heading

= Main Body of Text

Type text single-spaced, *with* one blank line between paragraphs and following headings. Start paragraphs flush with left margin.

== Headings

Major headings are to be numbered, centred in bold, preceded and followed by a blank line.

Subheadings are to be numbered, typed in bold flush with the left margin, preceded and followed by a blank line.

Subsubheadings are to be numbered, typed in bold after one blank line flush with the left margin, with text following on the same line. Subsubheadings may be followed by a period or colon, they may also be the first word of the paragraph's sentence.

Use decimal numbering for headings, subheadings and subsubheadings.

== Footnotes

Mark footnotes in the text with a number (1); use consecutive numbers for following footnotes. Place footnotes at the bottom of the page, separated from the text above it by a horizontal line.

== Figures and Tables

=== Placement

Figures must be placed in the appropriate location in the document, as close as practical to the reference of the figure in the text. While figures and tables are usually aligned horizontally on the page, large figures and tables can be rotated by 90 degrees. If so, make sure that the top is always on the left-hand side of the page.

=== Captions

All captions should be centred directly beneath the illustration. Use single spacing if they use more than one line. All captions are to be numbered consecutively, e.g. Figure 1, Figure 2, Figure 3, .. and Table 1, Table 2, Table 3, ...

#figure(
  image("../figures/fig1-eps-converted-to.pdf", width: 100%),
  caption: [Figure placement and numbering.],
) <fig-figure-placement>

=== Copyright

If your article contains any copyrighted illustrations or imagery, include a statement of copyright such as: © SPOT Image Copyright 20xx (fill in year), CNES. It is the author's responsibility to obtain any necessary copyright permission. After publication, your article is distributed under #underline([the Creative Commons Unported License]) and you retain the copyright.

== Equations, Symbols and Units

=== Equations

Equations should be numbered consecutively throughout the contribution. The equation number is enclosed in parentheses and placed flush right. Leave one blank lines before and after equations:

$
  x = x_0 - c (X - X_0) / (Z - Z_0); y = y_0 - c (Y - Y_0) / (Z - Z_0),
$ <equ-1>

#grid(
  columns: (auto, 1fr),
  align: (left, left),
  column-gutter: 0.6cm,
  [where],
  [
    $c$ = principle distance#linebreak()
    $x, y$ = image coordinates#linebreak()
    $X_0, Y_0, Z_0$ = coordinates of projection centre#linebreak()
    $X, Y, Z$ = object coordinates#linebreak()
  ],
)


=== Symbols and Units

Use the SI (Systeme International) Units and Symbols. Unusual characters or symbols should be explained in a list of nomenclature.

== References

References must be cited in the text, thus #cite(<smith1987rep>), and listed in alphabetical order in the reference section. While references are optional, maximum 8 references are permitted for abstract-based submissions. The following arrangements must be used:

=== References from Journals

Journals must be cited like #cite(<smith1987>) or #cite(<michalis2008>). Names of journals can be abbreviated according to the "International List of Periodical Title Word Abbreviations". In case of doubt, write names in full.

=== References from Books

Books must be cited like #cite(<foerstner2016>).

=== References from other Literature

Other literature must be cited like #cite(<smith1987rep>) and #cite(<smith2000>).

=== References from Websites

References from the internet must be cited like #cite(<chan2017>) and #cite(<maas2017>). Use of persistent identifiers such as the Digital Object Identifier (DOI) rather than URLs is strongly advised. In this case last date of visiting the website can be omitted, as the identifier will not change.

=== References from Research Data

References from research data must be cited like #cite(<dubayah2013>).

=== References from Software Projects

References to a software project as a high level container including multiple versions of the software must be cited like #cite(<grass2017>).

=== References from Software Versions

References to a specific software version must be cited like #cite(<grass2015>).

=== References from Software Project Add-ons

References to a specific software add-on to a software project must be cited like #cite(<lennert2017>).

=== References from Software Repository

References from software repositories must be cited like #cite(<gago2016>).

