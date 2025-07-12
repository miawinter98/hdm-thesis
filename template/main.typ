#import "@preview/hdm-thesis:0.1.0": hdm-thesis
#import "@preview/glossarium:0.5.4": gls, glspl

#import "acronyms.typ": acronyms
#import "glossary.typ": glossary

#let metadata = yaml("metadata.yaml")

#show: hdm-thesis.with(
    metadata, datetime.today(),
    bib: bibliography("sources.bib"),
    glossary: glossary, acronyms: acronyms)


= Introduction

== Topic A

#lorem(75);

#lorem(50);

== Topic B

#lorem(150)

= Another Heading

#lorem(300)

== Sub Heading

#lorem(100)

= Functions

== Citations

Citing a thing here @iso18004

== Referencing Glossary Items

Like this: #gls("kuleuven")

== Figures

#figure(caption: "Image Example", image(width: 4cm, "assets/example.png", height: 5em))

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