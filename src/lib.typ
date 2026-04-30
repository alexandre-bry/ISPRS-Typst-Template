// This function gets your whole document as its `body` and formats
// it as an article in the style of the ISPRS.
#let isprs(
  // The paper's title.
  title: [Paper Title],
  // An array of authors. For each author you can specify a name,
  // organization, location, and email. Everything but
  // but the name is optional.
  authors: (),
  // The paper's abstract. Can be omitted if you don't have one.
  abstract: none,
  // A list of keywords to display after the abstract.
  keywords: (),
  // The file containing the acknowledgements, if any. Can be omitted.
  acknowledgements: none,
  // The result of a call to the `bibliography` function or `none`.
  bibliography: none,
  // The file containing the appendix, if any. Can be omitted.
  appendix: none,
  // Whether to render it as anonymous, hiding authors and acknowledgements.
  anonymous: false,
  // The paper's content.
  body,
) = {
  // Set document metadata.
  let authors-string = if anonymous {
    "Anonymous"
  } else {
    authors.map(author => author.name).join(", ")
  }
  set document(title: title, author: authors-string)

  // Set the body font.
  set text(font: "Times New Roman", size: 9pt, lang: "en")

  // Enums numbering
  set enum(numbering: "1.")

  // Default line spacing and paragraph spacing.
  let line-space = 4.4mm
  let add-line-space() = v(line-space, weak: true)

  // Show URLs in blue.
  show link: set text(fill: blue)

  // Tables & figures
  show figure.caption: set align(center)
  show figure.caption.where(kind: image): it => {
    v(3mm, weak: true)
    it
  }

  // Configure the page and multi-column properties.
  set columns(gutter: 6mm)
  set page(
    columns: 2,
    paper: "a4",
    margin: (
      x: 20mm,
      y: 25mm,
    ),
  )

  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)")
  show math.equation: it => {
    if (it.block) [
      #add-line-space()
      #it
      #add-line-space()
    ] else {
      it
    }
  }

  // Configure appearance of equation references
  show ref: it => {
    if it.element != none and it.element.func() == math.equation {
      // Override equation references.
      link(it.element.location(), numbering(
        it.element.numbering,
        ..counter(math.equation).at(it.element.location()),
      ))
    } else {
      // Other references as usual.
      it
    }
  }

  // Configure lists.
  set enum(indent: 13.8pt, body-indent: 11.5pt)
  set list(indent: 13.8pt, body-indent: 11.5pt)
  show enum: it => {
    it
  }
  show list: it => {
    it
  }

  // Configure headings.
  show heading: set text(weight: "bold", size: 9pt)
  show heading.where(level: 1): set heading(numbering: "1.")
  show heading.where(level: 2): set heading(numbering: "1.1")
  show heading.where(level: 3): set heading(numbering: "1.1.1")
  show heading: it => {
    // Find out the final number of the heading counter.
    let levels = counter(heading).get()

    let number = if (it.numbering == none) { none } else { numbering(it.numbering, ..levels) }

    if (it.level == 1) {
      set align(center)
      [#add-line-space()#number#h(3mm)#it.body#add-line-space()]
    } else if (it.level == 2) {
      [#add-line-space()#number#h(2mm)#it.body#add-line-space()]
    } else if (it.level == 3) {
      [#add-line-space()#number#h(4mm)#it.body:]
    } else {
      it
    }
  }

  // Style bibliography.
  set std.bibliography(title: none, style: "custom-isprs.csl")

  // Display the paper's title and authors at the top of the page,
  // spanning all columns (hence floating at the scope of the
  // columns' parent, which is the page).
  place(
    top + center,
    float: true,
    scope: "parent",
    {
      show std.title: set align(center)
      show std.title: set text(size: 12pt, weight: "bold")
      show std.title: set block(below: 8mm)
      std.title()

      // Display the authors list.
      let names = ()
      if anonymous {
        names = ("*********** (Anonymized)",)
      } else {
        for i in range(authors.len()) {
          let info = authors.at(i)
          if "name" in info {
            names.push([#info.name#super(str(i + 1))])
          } else {
            panic("Each author must have a name.")
          }
        }
      }
      names.join(", ")

      // Display the authors' affiliations below.
      let affiliations = ()
      if anonymous {
        affiliations = ("*********** (Anonymized)",)
      } else {
        for i in range(authors.len()) {
          let info = authors.at(i)
          let affiliation = ()
          if "organization" in info { affiliation.push(info.organization) }
          if "location" in info { affiliation.push(info.location) }
          if "email" in info { affiliation.push(link("mailto:" + info.email, info.email)) }
          if affiliation.len() > 0 {
            affiliations.push([#super(str(i + 1)) #affiliation.join([ -- ])])
          }
        }
      }
      if affiliations.len() > 0 {
        add-line-space()
        [#affiliations.join(linebreak())]
      }
    },
  )

  set par(justify: true, spacing: line-space, leading: 0.5em)

  place(
    top + left,
    float: true,
    scope: "parent",
    clearance: 3em,
    {
      // Keywords
      linebreak()
      linebreak()
      [*Keywords:* #keywords.join[, ].]

      if abstract != none {
        linebreak()
        linebreak()
        linebreak()
        [*Abstract*]
        linebreak()
        linebreak()
        abstract
      }
    },
  )

  show: doc => {
    let i = 0
    let elements = doc.children
    while i < elements.len() {
      if elements.at(i).func() == heading {
        elements.at(i)
        let j = i + 1
        // For whatever reason the depth of the heading is not accessible there but accessible in the while loop
        let depth = none
        while (
          j < elements.len() and elements.at(j).func() in (linebreak, parbreak, [ ].func())
        ) {
          depth = elements.at(i).depth
          // Only work with heading of depth 3
          if (depth != 3) { break }
          j += 1
        }
        if j >= elements.len() { break }
        if (depth == 3) {
          [ ]
        }
        i = j
      }
      if (elements.at(i).func() != heading) {
        elements.at(i)
        i += 1
      }
    }
  }

  // Display the paper's contents.
  body

  // Display the acknowledgements, if any and if not anonymous.
  if (acknowledgements != none) {
    heading("Acknowledgements", level: 1, numbering: none)
    if (anonymous) {
      [Anonymized.]
    } else {
      acknowledgements
    }
  }

  // Display bibliography.
  heading("References", level: 1, numbering: none)
  bibliography

  // Display appendix, if any.
  if (appendix != none) {
    heading("Appendix", level: 1, numbering: none)
    show heading: it => {
      it.body
    }
    appendix
  }
}
