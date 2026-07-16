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
