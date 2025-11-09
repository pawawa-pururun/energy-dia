# Energy-Dia

[日本語版](README.ja.md)

Energy-Dia is a Typst library for creating energy diagrams such as atomic orbital diagrams, molecular orbital diagrams, and band structure diagrams. It utilizes the CeTZ library to easily draw diagrams for chemistry and physics.

## Features

- **Atomic Orbital Diagrams (AO)**: Visualize energy levels and electron configurations of atoms.
- **Molecular Orbital Diagrams (MO)**: Display molecular orbital formation and electron configurations.
- **Band Structure Diagrams**: Plot band structures. You can write orbital levels just by providing energies, so although the functionality is limited, it's easy to write. It's optimal for band structures where many orbitals need to be written.

## Installation

To use this library, import as follows:
```typst
#import "@preview/energy-dia:0.1.0": *
```

## Dependencies

This library depends on the following:

- **CeTZ**: A library for drawing diagrams. License: GNU LESSER GENERAL PUBLIC LICENSE version 3

## Usage

### Atomic Orbital Diagram (AO)

Plots energy levels and electrons for atomic orbitals.

```typst
#ao(
  width: 10,
  height: 10,
  (energy: -10, electrons: 2, caption: "1s"),
  (energy: -3, electrons: 2, caption: "2s"),
  (energy: -1, electrons: 4, degeneracy: 3, up: 3, caption: "2p"),
)
```

Parameters:
- `width`, `height`: Size of the diagram
- `energy`: Energy level
- `electrons`: Number of electrons
- `degeneracy`: Degeneracy (default: 1)
- `caption`: Label
- `up`: Number of up-spin electrons (optional); if not specified, alpha and beta spins are drawn alternately

### Molecular Orbital Diagram (MO)

Creates diagrams showing molecular orbital formation.

```typst
#mo(
  width: 15,
  height: 10,
  atom1: ((energy: -14, electrons: 2, label: 1, caption: "2s"), (energy: -5, electrons: 4, degeneracy: 3, up: 3, label: 2, caption: "2p"), ),
  molecule: ((energy: -16, electrons: 2, label: 3, caption: [$1sigma$]), (energy: -12, electrons: 2, label: 4, caption: [$1sigma^*$]), (energy: -8, electrons: 2, label: 5, caption: [$2sigma$]), (energy: -2, electrons: 0, label: 6, caption: [$2sigma^*$]), (energy: -6, electrons: 4, degeneracy: 2, label: 7, caption: [$pi$]), (energy: -4, electrons: 2, degeneracy: 2, up: 2, label: 8, caption: [$pi^*$]) ),
  atom2: ((energy: -14, electrons: 2, label: 9, caption: "2s"), (energy: -5, electrons: 4, degeneracy: 3, up: 3, label: 10, caption: "2p"),),
  (1, 3), (1, 4), (2, 5), (2, 7), (2, 8), (2, 6), (9, 3), (9, 4), (10, 5), (10, 7), (10, 8), (10, 6)
)
```

Parameters:
- `atom1`, `atom2`, `molecule`: Orbital data. Same as AO but as arrays. `label` is used to connect orbitals with dashed lines.
- Connections: Specify connections between orbitals. Connects orbitals specified by labels with dashed lines.

### Band Structure Diagram

Plots band structures.

```typst
#band(
  include_energy_labels: false,
  -5, -4, -3, 0, 1, 2
)
```

Or load data from a CSV file:

```typst
#let data = csv("test.csv")
#let energies = data.map(row => float(row.at(0))).flatten()
#band(
  include_energy_labels: false,
  ..energies
)
```

## Examples

### Atomic Orbital

![Atomic Orbital](img/atomic_orbital.png)

### Molecular Orbital

![Molecular Orbital](img/molecular_orbital.png)

### Band structure Orbital

![Band structure Orbital](img/band.png)

See the [demo.typ](demo/demo.typ) file for complete usage examples.

## Details

For detailed usage instructions, please refer to [manual.pdf](docs/manual.pdf).


## LICENSE

This project is licensed under the GNU General Public License Version 3. Please check [LICENSE](LICENSE).