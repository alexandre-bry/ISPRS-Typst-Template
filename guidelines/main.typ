#import "@local/magic-isprs:0.1.0": isprs, isprs-heading
#show: isprs-heading

#let anonymous = sys.inputs.at("anonymous", default: "false") == "true"

#show: isprs.with(
  title: [Guidelines for Authors preparing a Full Paper#linebreak()to be submitted to ISPRS Events],
  abstract: [
    These guidelines are provided for the preparation of *full papers submitted to ISPRS events* (Congress, Geospatial Week, Symposia, smaller events such as workshops). Full papers undergo a double-blind review process. Therefore, the submissions have to be anonymised. If this process leads to acceptance, subsequently a camera-ready manuscript must be submitted following these guidelines (but, of course, incl. author names and affiliation). Depending on the recommendations of the reviewers and the decision of the local programme chair this camera-ready manuscript will be published either in the ISPRS Annals of the Photogrammetry, Remote Sensing and Spatial Information Sciences or The International Archives of the Photogrammetry, Remote Sensing and Spatial Information Sciences, provided it arrives by the due date and corresponds to the guidelines.#linebreak()
    These guidelines are issued to ensure a uniform style for all submitted papers and throughout these two series. To assure timely and
    efficient production of the Annals and Archives with a consistent and easy to read format, authors must submit their manuscripts in
    strict conformance with these guidelines. The Society may omit any paper that does not conform to the specified requirements.
  ],
  authors: (
    (
      name: "Orhan Altan",
      email: "oaltan@itu.edu.tr",
      institutions: "itu",
    ),
    (
      name: "Ian Dowman",
      email: "idowman@ge.ucl.ac.uk",
      institutions: "ucl",
    ),
    (
      name: "Florent Lafarge",
      email: "florent.lafarge@inria.fr",
      institutions: "inria",
    ),
    (
      name: "Clément Mallet",
      email: "clement.mallet@ign.fr",
      institutions: "lastig",
    ),
    (
      name: "Christian Heipke",
      email: "heipke@ipi.uni-hannover.de",
      institutions: "leibniz",
    ),
  ),
  institutions: (
    itu: (
      name: [ITU, Civil Engineering Faculty],
      location: [80626 Maslak Istanbul, Turkey],
      email-suffix: "@itu.edu.tr",
    ),
    ucl: (
      name: [Dept. of Geomatic Engineering, University College London],
      location: [Gower Street, London, WC1E 6BT UK],
      email-suffix: "@ge.ucl.ac.uk",
    ),
    inria: (
      name: [Université Côte d'Azur, INRIA],
      location: [Sophia-Antipolis, France],
      email-suffix: "@inria.fr",
    ),
    lastig: (
      name: [Univ. Gustave Eiffel, IGN-ENSG, LaSTIG],
      location: [Saint-Mandé, France],
      email-suffix: "@ign.fr",
    ),
    leibniz: (
      name: [Institute of Photogrammetry and GeoInformation, Leibniz Universität],
      location: [Hannover, Germany],
      email-suffix: "@ipi.uni-hannover.de",
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
  acknowledgements: include "content/acknowledgements.typ",
  bibliography: bibliography("biblio.yaml"),
  appendix: include "content/appendix.typ",
  anonymous: anonymous,
)

#include "content/manuscript.typ"

#include "content/title_abstract.typ"

#include "content/main_body.typ"
