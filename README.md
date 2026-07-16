# ENGCE200
## Digital Systems and Design

---

# Introduction

Digital Systems and Design is a field of electronics and computer engineering that focuses on the analysis, design, implementation, and optimization of digital circuits and digital systems. A digital system processes information using discrete values, typically represented by binary digits (0 and 1).

Examples of digital systems include:

- Computers
- Microprocessors
- Digital communication systems
- Embedded systems
- FPGA-based systems
- Logic controllers

Digital systems are built using logic gates, combinational circuits, sequential circuits, memory devices, and programmable hardware.

---

# Number Systems

Digital electronics heavily relies on different number systems.

## Binary (Base-2)

Uses two symbols:

```text
0, 1
```

Example:

```text
101101₂
```

Conversion:

```text
101101₂ = 45₁₀
```

---

## Decimal (Base-10)

Uses ten symbols:

```text
0,1,2,3,4,5,6,7,8,9
```

Example:

```text
45₁₀
```

---

## Octal (Base-8)

Uses eight symbols:

```text
0,1,2,3,4,5,6,7
```

Example:

```text
55₈
```

Equivalent:

```text
55₈ = 45₁₀
```

---

## Hexadecimal (Base-16)

Uses sixteen symbols:

```text
0-9
A-F
```

Example:

```text
2D₁₆
```

Equivalent:

```text
2D₁₆ = 45₁₀
```

---

# Boolean Algebra

Boolean Algebra is a mathematical system used for analyzing and designing digital logic circuits.

Boolean variables can only have two values:

```text
0 (False)
1 (True)
```

---

## Basic Boolean Operations

### AND

Symbol:

```text
A · B
```

Truth Table:

```text
A B | Y
---------
0 0 | 0
0 1 | 0
1 0 | 0
1 1 | 1
```

---

### OR

Symbol:

```text
A + B
```

Truth Table:

```text
A B | Y
---------
0 0 | 0
0 1 | 1
1 0 | 1
1 1 | 1
```

---

### NOT

Symbol:

```text
A'
```

Truth Table:

```text
A | Y
-------
0 | 1
1 | 0
```

---

# Logic Gates

Logic gates are the fundamental building blocks of digital circuits.

---

## AND Gate

Produces logic 1 only when all inputs are logic 1.

```text
Y = A · B
```

---

## OR Gate

Produces logic 1 if at least one input is logic 1.

```text
Y = A + B
```

---

## NOT Gate

Inverts the input signal.

```text
Y = A'
```

---

## NAND Gate

Combination of AND and NOT.

```text
Y = (A · B)'
```

---

## NOR Gate

Combination of OR and NOT.

```text
Y = (A + B)'
```

---

## XOR Gate

Produces logic 1 when inputs are different.

```text
Y = A ⊕ B
```

---

## XNOR Gate

Produces logic 1 when inputs are equal.

```text
Y = (A ⊕ B)'
```

---

# Karnaugh Map (K-Map)

A Karnaugh Map is a graphical method used to simplify Boolean expressions.

Advantages:

- Reduces logic gate count
- Simplifies circuit design
- Minimizes hardware cost
- Improves system efficiency

---

## Example

Boolean Expression:

```text
F(A,B) = Σ(1,2,3)
```

K-Map:

```text
      B
      0   1
A 0   0   1
  1   1   1
```

Simplified Result:

```text
F = A + B
```

---

# Combinational Logic

Combinational circuits are digital circuits whose outputs depend only on the current inputs.

Examples:

- Multiplexer (MUX)
- Demultiplexer (DMUX)
- Decoder
- Encoder
- Adder
- Subtractor
- Comparator

---

# Sequential Logic

Sequential circuits store past information.

Outputs depend on:

- Current inputs
- Previous states

Examples:

- Flip-Flops
- Registers
- Counters
- Memory Elements

---

# VHDL

## What is VHDL?

VHDL stands for:

```text
VHSIC Hardware Description Language
```

VHSIC stands for:

```text
Very High Speed Integrated Circuit
```

VHDL is used to describe, model, simulate, and synthesize digital hardware systems.

Applications:

- FPGA Design
- ASIC Design
- Digital Circuit Simulation
- Hardware Verification

---

# Basic Structure of VHDL

A VHDL design consists of:

## Entity

Defines inputs and outputs.

Example:

```vhdl
entity AND_GATE is
    Port(
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end AND_GATE;
```

---

## Architecture

Defines circuit behavior.

Example:

```vhdl
architecture Behavioral of AND_GATE is
begin

    Y <= A and B;

end Behavioral;
```

---

# VHDL Design Flow

```text
Design
  ↓
Coding
  ↓
Simulation
  ↓
Verification
  ↓
Synthesis
  ↓
Implementation
```

---

# GHDL

## What is GHDL?

GHDL is an open-source VHDL simulator.

Features:

- VHDL-87
- VHDL-93
- VHDL-2002
- VHDL-2008

Supported Platforms:

- Windows
- Linux
- macOS

Applications:

- VHDL simulation
- Verification
- Educational laboratories
- FPGA development

---

# Installing GHDL

## Windows Installation

Download GHDL from:

```text
https://ghdl.github.io
```

or

```text
https://github.com/ghdl/ghdl/releases
```

---

## Verify Installation

Open PowerShell:

```powershell
ghdl --version
```

Expected output:

```text
GHDL 4.x.x
```

---

# Using GHDL

## Step 1: Analyze

Compile VHDL source files.

```powershell
ghdl -a design.vhd
```

Example:

```powershell
ghdl -a MUX16to1.vhd
```

---

## Step 2: Analyze Testbench

```powershell
ghdl -a tb_MUX16to1.vhd
```

---

## Step 3: Elaborate

Create simulation executable.

```powershell
ghdl -e tb_MUX16to1
```

---

## Step 4: Run Simulation

Generate waveform file.

```powershell
ghdl -r tb_MUX16to1 --vcd=result.vcd
```

---

# GTKWave

## What is GTKWave?

GTKWave is a waveform viewer.

Used to:

- View logic signals
- Inspect timing diagrams
- Verify circuit operation

Open waveform:

```powershell
gtkwave result.vcd
```

---

# Visual Studio Code Setup

Visual Studio Code can be used as a complete VHDL development environment.

---

## Recommended Extensions

### VHDL Language Support

Provides:

- Syntax highlighting
- Code completion
- Error checking

---

### Surfer

Surfer is a waveform visualization extension.

Features:

- Logic waveform viewing
- Fast navigation
- Signal analysis
- Modern UI

Used as an alternative to GTKWave for viewing VCD files.

---

### Error Lens

Highlights compiler errors directly in the editor.

---

### Material Icon Theme

Improves project navigation.

---

# LogicSim

## What is LogicSim?

LogicSim is a digital logic simulation tool used for designing and testing digital circuits visually.

Applications:

- Logic Gate Design
- Multiplexer Design
- Demultiplexer Design
- Decoder Design
- Sequential Logic Design

---

## Advantages

- Drag-and-drop circuit building
- Real-time simulation
- Educational visualization
- Truth table verification

---

# Typical Workflow

A common workflow in ENGCE200 is:

```text
Logic Design
     ↓
LogicSim
     ↓
Truth Table Verification
     ↓
VHDL Coding
     ↓
GHDL Simulation
     ↓
Waveform Analysis
     ↓
Verification
```

---

# Learning Outcomes

After completing this course, students should be able to:

- Understand digital system fundamentals
- Use number systems correctly
- Analyze Boolean expressions
- Simplify logic using Karnaugh Maps
- Design combinational circuits
- Design sequential circuits
- Write VHDL code
- Simulate circuits using GHDL
- Analyze timing diagrams
- Verify hardware behavior using waveform viewers
- Implement digital systems using modern design methodologies

---

# References

1. M. Morris Mano, *Digital Design*, Pearson.
2. Ronald J. Tocci, *Digital Systems: Principles and Applications*.
3. IEEE Standard VHDL Language Reference Manual.
4. GHDL Documentation.
5. GTKWave Documentation.
6. FPGA and Digital Design Fundamentals.
