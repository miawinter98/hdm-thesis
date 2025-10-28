#import "@preview/glossarium:0.5.9": gls, glspl

= Functions
== Citations

Citing a thing here @iso18004

== Referencing Glossary Items

// only available if you provide a glossary/acronyms to pretty-hdm-thesis that contains this key
Like this: #gls("kuleuven")

== Figures

#figure(
    caption: [
        Image Example (#link("https://www.freepik.com/author/freepik/icons/kawaii-lineal_46#from_element=resource_detail")[Icon by Freepik])
    ],
    image(width: 4cm, "/assets/example.png"))

== Tables

#figure(
    caption: "Table Example",
    table(
    columns: (1fr, 50%, auto),
    inset: 10pt,
    align: horizon,
    table.header(
      [],
      [*Area*],
      [*Parameters*],
    ),

    text("cylinder.svg"),
    $ pi h (D^2 - d^2) / 4 $,
    [
      $h$: height \
      $D$: outer radius \
      $d$: inner radius
    ],

    text("tetrahedron.svg"), $ sqrt(2) / 12 a^3 $, [$a$: edge length],
  )
)

#pagebreak(weak: true)
