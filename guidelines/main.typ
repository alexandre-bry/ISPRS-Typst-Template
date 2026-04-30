#import "@local/magic-isprs:0.1.0": isprs

#show: isprs.with(
  title: [Guidelines for Authors preparing a Full Paper to be submitted to ISPRS Events],
  abstract: [
    These guidelines are provided for the preparation of *full papers submitted to ISPRS events* (Congress, Geospatial Week, Symposia, smaller events such as workshops). Full papers undergo a double-blind review process. Therefore, the submissions have to be anonymised. If this process leads to acceptance, subsequently a camera-ready manuscript must be submitted following these guidelines (but, of course, incl. author names and affiliation). Depending on the recommendations of the reviewers and the decision of the local programme chair this camera-ready manuscript will be published either in the ISPRS Annals of the Photogrammetry, Remote Sensing and Spatial Information Sciences or The International Archives of the Photogrammetry, Remote Sensing and Spatial Information Sciences, provided it arrives by the due date and corresponds to the guidelines.#linebreak()
    These guidelines are issued to ensure a uniform style for all submitted papers and throughout these two series. To assure timely and
    efficient production of the Annals and Archives with a consistent and easy to read format, authors must submit their manuscripts in
    strict conformance with these guidelines. The Society may omit any paper that does not conform to the specified requirements.
  ],
  authors: (
    (
      name: "Orhan Altan",
      organization: [ITU, Civil Engineering Faculty],
      location: [80626 Maslak Istanbul, Turkey],
      email: "oaltan@itu.edu.tr",
    ),
    (
      name: "Ian Dowman",
      organization: [Dept. of Geomatic Engineering, University College London],
      location: [Gower Street, London, WC1E 6BT UK],
      email: "idowman@ge.ucl.ac.uk",
    ),
    (
      name: "Florent Lafarge",
      organization: [Université Côte d’Azur, INRIA],
      location: [Sophia-Antipolis, France],
      email: "florent.lafarge@inria.fr",
    ),
    (
      name: "Clément Mallet",
      organization: [Univ. Gustave Eiffel, IGN-ENSG, LaSTIG],
      location: [Saint-Mandé, France],
      email: "clement.mallet@ign.fr",
    ),
    (
      name: "Christian Heipke",
      organization: [Institute of Photogrammetry and GeoInformation, Leibniz Universität],
      location: [Hannover, Germany],
      email: "heipke@ipi.uni-hannover.de",
    ),
  ),
  keywords: (
    "Manuscripts",
    "Proceedings",
    "ISPRS Archives",
    "ISPRS Annals",
    "Guidelines for Authors",
    "Style guide",
  ),
  acknowledgements: include "acknowledgements.typ",
  bibliography: bibliography("biblio.yaml"),
  appendix: include "appendix.typ",
  anonymous: true,
)

= Manuscript

== General Instructions

The paper should have the following structure:
+ Title
+ Author(s) and affiliation, *anonymized* for the double-blind review process
+ Keywords (max. 6)
+ Abstract (100--250 words)
+ Introduction
+ Main body
+ Conclusions
+ Acknowledgements (if applicable), *anonymized* for the double-blind review process
+ References
+ Appendix (if applicable)

Full papers *submitted for double-blind review* must not contain any information which makes it possible to identify the author(s). In particular, name(s) and affiliation(s) must be removed from the manuscript submitted for review. Also sentences such as "As we have shown in previous work (Author_x, 20xx)" are to be avoided. Instead use a formulation such as "Author_x (20xx) has shown ...". Note that submissions which have not been appropriately anonymised may be subject to immediate rejection.

In case, the contribution has been accepted for publication, a camera-ready manuscript must be submitted at the due date. In this camera-ready manuscript the name(s) and affiliation(s) of the authors(s) must be identified, and acknowledgements can be personalized. An example of a camera-ready manuscript can be found under #link("www.isprs.org/documents/orangebook/app5.aspx").

== Page Layout and Length

The paper must be compiled in one column for the title, author information, keywords and abstract and in two columns for all subsequent text. Left and right justified typing is mandatory. All manuscripts, except Invited Papers are limited to a length of approximately 8 single-spaced pages (A4 size), including abstracts, figures, tables and references. ISPRS Invited Papers are limited to approximately 12 pages. In any case, the minimum length of any paper is 6 pages. The font type Times New Roman with a size of 9 pts. is to be used.

#figure(
  table(
    columns: 3,
    align: (left, center, center),
    stroke: (x, y) => {
      let stroke-width = 0.5pt
      let stroke = (x: stroke-width, top: 0pt, bottom: stroke-width)
      if y < 2 {
        stroke.top = stroke-width
      }
      return stroke
    },
    inset: (x: 6pt, y: 2pt),
    [Setting], table.cell(colspan: 2, [A4 size page]),
    [], [mm], [inches],
    [Top], [25], [1.0],
    [Bottom], [25], [1.0],
    [Left], [20], [0.8],
    [Right], [20], [0.8],
    [Column Width], [82], [3.2],
    [Column Spacing], [6], [0.25],
  ),
  caption: [Margin settings for A4 size page.],
) <tab-margin-settings>

== Style Guides

To assist authors in preparing their contributions, style guides are provided in Word and LaTeX on the ISPRS web site, see #link("www.isprs.org/documents/orangebook/app5.aspx"). Use of these style guides ensures that the paper is correctly formatted and is therefore strongly suggested.

= Title and Abstract Block

== Title

The title must appear centred in bold at the top of the first page with a size of 12 pts. Any author information must be masked out in the full paper submitted for double-blind peer review.

Author(s) name(s), affiliation and mailing address only appear in the camera-ready manuscript, which is to be submitted after the paper is accepted for publication. For this camera-ready manuscript, type the full author(s) name(s), affiliation and mailing address (including e-mail), centred under the title. In the case of multi-authorship, indicate which author belongs to which organisation.

== Keywords

Leave two lines blank, then type *"Keywords:"* in bold, followed by a maximum of 6 keywords. Note that ISPRS does not provide a set list of keywords. Therefore, include those keywords which you would use to find a paper with content you are preparing.

== Abstract

Leave two blank lines under the keywords. Type *"Abstract"* flush left in bold Capitals followed by one blank line. Note that the abstract should be concise (100 - 250 words), present briefly the content and very importantly, the scientific contribution and results of the paper in words understandable also to non-specialists.

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
  image("../resources/latex/full_paper/figures/test_sites/fig1-eps-converted-to.pdf", width: 100%),
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

