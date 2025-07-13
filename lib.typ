#import "@preview/glossarium:0.5.4": make-glossary, register-glossary, print-glossary, gls, glspl

#import "content/titlepage.typ": titlepage
#import "content/declaration-of-authorship.typ": declaration-of-authorship

#let hdm-thesis(
    metadata, date, content,

    logo: image("./assets/hdm_logo.svg"),
    bib: none,
    bib-style: "chicago-notes",
    glossary: none, acronyms: none, abstract_de: none, abstract_en: none
) = {
    assert(metadata != none, message: "Metadata missing")
    let data = metadata.data
    let layout = metadata.layout
    let resources = yaml("resources.yaml").at(metadata.lang).headings

    show: make-glossary

    set par(leading: 0.6em, spacing: 1.2em)
    set text(lang: metadata.lang, font: layout.fonts.body, size: 12pt)
    show heading: set text(font: layout.fonts.heading)
    show heading: set block(below: 1.3em)

    set document(
        title: data.title,
        author: data.authors.map(a => a.Name).join(", "),
        description: data.title + ": " + data.subtitle,
        date: date)
    set page(
        paper: "a4",
        margin: (
            top: 3.5cm,
            bottom: 2.5cm,
            x: 2.5cm,
        ),
        header: context {
            let pageCounter = counter(page)
            let current = here().page()
            let firstPage = current < 3
            let headingArray = query(selector(heading).after(here()));

            if not firstPage {
                set image(height: 2.5em)
                if not headingArray.len() == 0 and headingArray.first().numbering != none {
                    stack(dir: ltr,
                        text(headingArray.first(), size: 0.8em, weight: "regular"),
                        align(right, logo))
                } else {
                    align(right, logo)
                }
                line(length: 100%)
            }
        },
        footer: context {
            let pageCounter = counter(page)
            let current = here().page()
            let firstPage = current < 3

            if not firstPage {
                line(length: 100%)
                if page.numbering != none {
                    align(center, counter(page).display())
                }
            }
        }
    )
    set page(numbering: none)
    set heading(numbering: none, outlined: false)
    register-glossary(acronyms)
    register-glossary(glossary)

    titlepage(metadata, logo, date)

    set par(justify: true)

    declaration-of-authorship(
        data.authors.map(a => a.Name),
        data.title + ": " + data.subtitle,
        layout.Location, date)
    pagebreak()

    // Abstracts
    let all_resources = yaml("resources.yaml")
    if abstract_de != none {
        heading(all_resources.at("de").headings.Abstract, bookmarked: true)
        show: abstract_de
    }
    if abstract_en != none {
        pagebreak(weak: true)
        heading(all_resources.at("en").headings.Abstract, bookmarked: true)
        show: abstract_en
    }

    set par(justify: false)

    pagebreak(weak: true)
    show outline: set heading(bookmarked: true)
    outline()

    set page(numbering: "I")
    set heading(outlined: true)
    show outline: set heading(outlined: true)
    counter(page).update(1)
    pagebreak(weak: true)

    // Acronyms
    heading(resources.Acronyms)
    print-glossary(acronyms)
    pagebreak(weak: true)

    // Glossary
    heading(resources.Glossary)
    print-glossary(glossary)
    pagebreak(weak: true)

    // Figures
    outline(
        title: resources.Figures,
        target: figure.where(kind: image))
    pagebreak(weak: true)

    // Figures
    outline(
        title: resources.Tables,
        target: figure.where(kind: table))
    pagebreak(weak: true)

    set heading(numbering: "1.1.")
    set page(numbering: "1 / 1")
    counter(page).update(1)
    pagebreak()

    content

    pagebreak(weak: true)
    counter(page).update(1)
    set page(numbering: "a")

    if bib != none {
        set bibliography(style: bib-style)
        bib
    }
}