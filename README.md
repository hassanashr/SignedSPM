# 8x8 Signed Serial-Parallel Multiplier (SPM)

## Overview

This project implements an **8x8 Signed Serial-Parallel Multiplier (SPM)** using Verilog, Logisim Evolution, and the Basys 3 FPGA board. It multiplies two signed 8-bit binary numbers—one entered serially and the other in parallel.

Developed for **CSCE2301/230 – Digital Design I – Spring 2025**.

---

## Features

- **8-bit signed inputs**:
  - `SW7–SW0`: Multiplier
  - `SW15–SW8`: Multiplicand
- **Output on 7-segment displays**:
  - Leftmost digit: Sign of the product
  - Right three digits: Product in decimal (scrollable)
- **Push-button controls**:
  - `BTNC`: Start multiplication
  - `BTNL` / `BTNR`: Scroll result digits
- **LED Feedback**:
  - `LD0`: Indicates end of multiplication

---

## How to Use

1. **Power On & Set Inputs**  
   Use the 16 toggle switches on the Basys 3:
   - `SW7–SW0`: Multiplier (signed 2’s complement)
   - `SW15–SW8`: Multiplicand (signed 2’s complement)

2. **Start Multiplication**  
   Press `BTNC`. The multiplier begins calculating.

3. **Read the Output**  
   - Sign appears on the leftmost 7-segment digit.
   - Remaining three digits show the product in decimal.
   - Use `BTNL` and `BTNR` to scroll large results.

4. **Completion Indicator**  
   When the multiplication finishes, `LD0` turns on.

---


## Demo & Tools Used

- **Logisim Evolution**:  
  - 7-Segment Display Driver  
  - Serial-Parallel Multiplier simulation  

- **Verilog**:  
  - RTL-compliant modules implemented and tested in Vivado  

- **Hardware**:  
  - Deployed on **Basys 3 FPGA Board** (Artix-7)

---

## Contributors

| Name            |  
|-----------------|
| **Yousef Elmenshawy**|  
| **Hassan Ashraf**|   
| **Ahmed Amgad**| 

---

