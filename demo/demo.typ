#import "@preview/energy-dia:0.1.0": *

= Energy Diagram Library Demo

This demo showcases all features of the energy diagram library, including atomic orbitals (ao), molecular orbitals (mo), and band structures (band).

All diagrams support 'width' and 'height' parameters to control the size of the diagram.

== Atomic Orbital Diagrams (ao)

=== Basic Example

This shows a basic atomic orbital diagram with energy levels and electron counts.

#ao(
  width: 10,
  height: 10,
  (energy: -10, electrons: 2),
  (energy: -3, electrons: 2),
)

=== With Captions, Degeneracy, and Spin Up

This demonstrates captions for orbitals, degeneracy (multiplicity of states), and spin-up electrons. By default, spin-up electrons are placed alternately, but you can specify the number of spin-up electrons with the 'up' parameter.

#ao(
  width: 10,
  height: 10,
  (energy: -10, electrons: 2, caption: "1s"),
  (energy: -3, electrons: 2, caption: "2s"),
  (energy: -1, electrons: 4, degeneracy: 3, up: 3, caption: "2p"),
)

== Molecular Orbital Diagrams (mo)

=== Basic Example

This shows a basic molecular orbital diagram with atomic and molecular energy levels.

#mo(
  width: 15,
  height: 10,
  atom1: ((energy: -5, electrons: 1),),
  molecule: ((energy: -8, electrons: 2), (energy: -2, electrons: 0)),
  atom2: ((energy: -5, electrons: 1),),
)

=== With Degeneracy, Spin Up, Labels, Captions, and Connections

This illustrates degeneracy, spin-up (by default placed alternately, but customizable with 'up' parameter), labeled orbitals, captions, and connections between orbitals. Connections are specified as tuples (label1, label2) to draw lines between labeled orbitals.

#mo(
  width: 15,
  height: 10,
  atom1: ((energy: -14, electrons: 2, label: 1, caption: "2s"), (energy: -5, electrons: 4, degeneracy: 3, up: 3, label: 2, caption: "2p"), ),
  molecule: ((energy: -16, electrons: 2, label: 3, caption: [$1sigma$]), (energy: -12, electrons: 2, label: 4, caption: [$1sigma^*$]), (energy: -8, electrons: 2, label: 5, caption: [$2sigma$]), (energy: -2, electrons: 0, label: 6, caption: [$2sigma^*$]), (energy: -6, electrons: 4, degeneracy: 2, label: 7, caption: [$pi$]), (energy: -4, electrons: 2, degeneracy: 2, up: 2, label: 8, caption: [$pi^*$]) ),
  atom2: ((energy: -14, electrons: 2, label: 9, caption: "2s"), (energy: -5, electrons: 4, degeneracy: 3, up: 3, label: 10, caption: "2p"),),
  (1, 3), (1, 4), (2, 5), (2, 7), (2, 8), (2, 6), (9, 3), (9, 4), (10, 5), (10, 7), (10, 8), (10, 6)
)

== Band Structure Diagrams (band)

=== Basic Band with Manual Data

This displays a band structure diagram with manually entered energy levels.

#band(
  include_energy_labels: false,
  -5, -4, -3, 0, 1, 2
)

=== Band with Energy Labels

This shows the same band structure with energy labels displayed.

#band(
  include_energy_labels: true,
  -5, -4, -3, 0, 1, 2
)

=== Band from CSV Data

This loads energy levels from a CSV file and displays the band structure.

#let data = csv("test.csv")
#let energies = data.map(row => float(row.at(0))).flatten()
#band(
  include_energy_labels: false,
  ..energies
)
