#import "@local/magic-isprs:0.1.0": isprs-heading
#show: isprs-heading

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

