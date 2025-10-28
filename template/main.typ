#import "@preview/pretty-hdm-thesis:0.1.2": pretty-hdm-thesis
#import "@preview/glossarium:0.5.9": gls, glspl

#import "abstract.typ": abstract-de, abstract-en
#import "acronyms.typ": acronyms
#import "glossary.typ": glossary

#let metadata = yaml("metadata.yaml")

#let acknowledgements = [
    I'd like to thank caffeine for getting me through many many MANY nights writing all of this
]

#show: pretty-hdm-thesis.with(
    metadata, // see metadata.yaml
    datetime.today(), // or `datetime(year: 2025, month: 8, day: 4),` if you have a specific submission date already
    bib: bibliography("sources.bib"),
    // optional citation style (default is "chicago-notes"): `bib-style: "turabian-fullnote-8",`

    // the following features are all optional or can be disabled
    glossary: glossary, acronyms: acronyms,
    abstract-de: abstract-de, abstract-en: abstract-en, acknowledgements: acknowledgements,
    declaration-of-authorship: true, table-outline: true, figure-outline: true,

    // you can get the HdM Logo or another visual on various pages using the `logo` parameter
    // see the readme for more information

    // optional appendix, can be before or after bilbiography
    // APA *recommends* the appendix to be the last section, while books
    // generally choose refernces/bibliography to be after everything else
    appendix: read("/appendix.typ"), appendix-last: false,
    )


#include "/content/introduction.typ"

#include "/content/topic.typ"
#include "/content/chapter-3.typ"
#include "/content/functions.typ"
