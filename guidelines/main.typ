#import "@local/magic-isprs:0.1.0": isprs, isprs-heading
#show: isprs-heading

#let anonymous = sys.inputs.at("anonymous", default: "false") == "true"

#show: isprs.with(
  title: [Guidelines for Authors preparing a Full Paper#linebreak()to be submitted to ISPRS Events],
  abstract: include "content/abstract.typ",
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
