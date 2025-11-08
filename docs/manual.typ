#import "@preview/tidy:0.4.3"
#import "../src/lib.typ": *

#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2cm),
  header: align(center)[Energy-Dia Manual],
  footer: context align(center)[#counter(page).display("1")],
)
#set text(font: "Times New Roman", size: 11pt, lang: "en")
#set heading(numbering: "1.1.1")

= Introduction

Energy-Dia is a Typst library for creating energy diagrams such as atomic orbital diagrams, molecular orbital diagrams, and band structure diagrams. It utilizes the CeTZ library to easily draw diagrams for chemistry and physics.

== Features

- *Atomic Orbital Diagrams (AO)*: Visualize energy levels and electron configurations of atoms.
- *Molecular Orbital Diagrams (MO)*: Display molecular orbital formation and electron configurations.
- *Band Structure Diagrams*: Plot band structures.

== Installation

To use this library, import as follows:
```typst
#import "@preview/energy-dia:0.1.0": *
```

// API Documentation
= API Documentation

The following sections document the functions provided by the Energy-Dia library.

#let docs = tidy.parse-module(read("../src/lib.typ"))
#tidy.show-module(docs, style: tidy.styles.default)

= Examples

Please refer to demo/demo.typ for examples.