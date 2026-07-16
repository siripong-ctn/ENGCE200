# ENGCE200
## Digital Systems and Design

### Laboratory: VHDL Design and Simulation Using GHDL

---

## Overview

รายวิชา ENGCE200 มุ่งเน้นการออกแบบและวิเคราะห์ระบบดิจิทัล (Digital Systems) โดยใช้ภาษา VHDL ในการอธิบายลอจิกและพฤติกรรมของวงจรดิจิทัล

การทดลองนี้ครอบคลุมหัวข้อดังต่อไปนี้

- Multiplexer (MUX) 16:1
- Demultiplexer (DMUX) 1:16
- การเชื่อมต่อวงจร MUX 16:1 เข้ากับ DMUX 1:16
- การจำลองการทำงานด้วย GHDL
- การวิเคราะห์ Timing Diagram ด้วย GTKWave

---

# Development Environment

### Software

- GHDL
- GTKWave
- Visual Studio Code (VS Code)
- PowerShell / Command Prompt

### Language

- VHDL (VHSIC Hardware Description Language)

---

# Basic GHDL Workflow

## 1. Analyze Source Files

ใช้เพื่อตรวจสอบ Syntax และ Compile Source VHDL

```powershell
ghdl -a MUX16to1.vhd
```

หรือ

```powershell
ghdl -a DMUX1to16.vhd
```

และ

```powershell
ghdl -a tb_MUX16to1.vhd
```

---

## 2. Elaborate Design

สร้าง Simulation Model

```powershell
ghdl -e tb_MUX16to1
```

หรือ

```powershell
ghdl -e tb_DMUX1to16
```

---

## 3. Run Simulation

สร้างไฟล์ VCD สำหรับการวิเคราะห์คลื่นลอจิก

```powershell
ghdl -r tb_MUX16to1 --vcd=mux.vcd
```

```powershell
ghdl -r tb_DMUX1to16 --vcd=dmux.vcd
```

```powershell
ghdl -r tb_mux_dmux16 --vcd=mux_dmux16.vcd
```

---

## 4. Open GTKWave

เปิดดู Timing Diagram

```powershell
gtkwave mux.vcd
```

```powershell
gtkwave dmux.vcd
```

```powershell
gtkwave mux_dmux16.vcd
```

---

# Experiment 1 : Multiplexer 16:1

## Objective

ศึกษาการเลือกอินพุตจำนวน 16 ช่องโดยใช้สัญญาณเลือก 4 บิต

### Inputs

```text
D0 - D15
S3 S2 S1 S0
```

### Output

```text
Y
```

### Truth Table

```text
S3 S2 S1 S0    Output

0000           D0
0001           D1
0010           D2
0011           D3
0100           D4
0101           D5
0110           D6
0111           D7
1000           D8
1001           D9
1010           D10
1011           D11
1100           D12
1101           D13
1110           D14
1111           D15
```

### Expected GTKWave Result

```text
D0 → Y
D1 → Y
D2 → Y
...
D15 → Y
```

---

# Experiment 2 : Demultiplexer 1:16

## Objective

ศึกษาการกระจายสัญญาณอินพุตเดียวไปยังเอาต์พุต 16 ช่อง

### Input

```text
D
```

### Select

```text
S3 S2 S1 S0
```

### Outputs

```text
Y0 - Y15
```

### Truth Table

```text
S3 S2 S1 S0    Output

0000           Y0
0001           Y1
0010           Y2
0011           Y3
0100           Y4
0101           Y5
0110           Y6
0111           Y7
1000           Y8
1001           Y9
1010           Y10
1011           Y11
1100           Y12
1101           Y13
1110           Y14
1111           Y15
```

### Expected GTKWave Result

```text
D → Y0
D → Y1
D → Y2
...
D → Y15
```

---

# Experiment 3 : MUX 16:1 Connected to DMUX 1:16

## Objective

ศึกษาการส่งข้อมูลผ่าน MUX และ DMUX ที่เชื่อมต่อเข้าด้วยกัน

### System Diagram

```text
D0-D15
   │
   ▼
MUX 16:1
   │
   ▼
   M
   │
   ▼
DMUX 1:16
   │
   ▼
Y0-Y15
```

---

## Inputs

```text
D0-D15
```

### MUX Select

```text
S_MUX[3:0]
```

### DMUX Select

```text
S_DMUX[3:0]
```

### Outputs

```text
Y0-Y15
```

---

## Example Operation

### Case 1

```text
D5 = 1

S_MUX  = 0101
S_DMUX = 1100
```

Operation

```text
MUX selects D5
↓
M = 1
↓
DMUX selects Y12
↓
Y12 = 1
```

Result

```text
D5 → Y12
```

---

### Case 2

```text
D2 = 1

S_MUX  = 0010
S_DMUX = 0111
```

Result

```text
D2 → Y7
```

---

### Case 3

```text
D15 = 1

S_MUX  = 1111
S_DMUX = 0000
```

Result

```text
D15 → Y0
```

---

# Timing Diagram Analysis

แนะนำให้แสดงสัญญาณดังนี้

```text
D0
D1
...
D15

S_MUX

M

S_DMUX

Y0
Y1
...
Y15
```

เพื่อให้สามารถมองเห็นการไหลของข้อมูลได้ชัดเจน

```text
D7
 ↓
MUX
 ↓
M
 ↓
DMUX
 ↓
Y7
```

---

# Common GHDL Errors

## Cannot Open File

```text
error: cannot open MUX16to1.vhd
```

### Solution

ตรวจสอบว่าไฟล์อยู่ใน Directory ปัจจุบัน

```powershell
dir *.vhd
```

---

## Cannot Find Enti*y

```text
error: cannot find enti*y
```

### Solution

ตรวจสอบชื่อ E*tity

```vhdl
entity MUX16to1 is
`*`

และใช้ชื่อเดียวกันในคำ*ั่ง

```powershell
ghdl -e MUX16to**```

---

## Bad Character in Iden*ifier

```text
error: bad characte* in identifier
```

### Incorrect
*```vhdl
entity MUX16-1 is
```

###*Correct

```vhdl
entity MUX16_1 is*```

---

# Conclusion

จากการทดลอ*พบว่า

- Multiplexer 16:1 สามารถเล*อกข้อมูลจากอินพุต 16 ช่องได้ถูกต้อ*
- Demultiplexer 1:16 สามารถ*ระจายข้อมูลไปยังเอาต์พุต 16 ช่องได*ถูกต้อง
- วงจร MUX →*DMUX ทำงานสอดคล้องกับ Truth*Table ทุกกรณี
- การจำลอง*้วย*GHDL และการว*เคราะห์ด้วย GTKWave ช่วยให้สามารถต*วจสอบพฤติกรรมของวงจรดิจิทัลได้อย่า*ชัดเจน
- การแสดงผล*บบ*D0-D15 และ Y0-Y15 เห*าะสำหรับการวิเคราะห์เชิงการศึกษา*ละการจัดทำรายงานในรายวิชา Digital *ystems and Design

---
**Course*** ENGCE200 - Digital Systems and *esign  
**Tools:** V*DL, GHDL, GTKWave  
**Topic:** Multiplexer, Demultiplex*r, Digital Logic Design
````*
