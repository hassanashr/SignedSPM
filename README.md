# 8x8 Signed Serial-Parallel Multiplier (SPM)

## Overview

This project implements an **8x8 Signed Serial-Parallel Multiplier (SPM)** using **Verilog HDL**, **Logisim Evolution**, and is deployed on a **Basys 3 FPGA board**. The multiplier handles two 8-bit signed 2's complement binary numbers—one received in parallel and the other serially—producing a 16-bit signed product.

Developed as a course project for **CSCE2301/230 – Digital Design I – Spring 2025**.

---

## Features

- **Signed 8-bit Inputs**:
  - `SW0–SW7`: Multiplicand (parallel)
  - `SW8–SW15`: Multiplier (serial)

- **16-bit Signed Output**:
  - Displayed on 4-digit 7-segment displays
  - Leftmost digit shows sign (`+` or `−`)
  - Remaining three digits show the magnitude in decimal
  - Scrollable display for large outputs

- **User Controls**:
  - `BTNC`: Start multiplication
  - `BTNL` / `BTNR`: Scroll digits left/right
  - `LD7`: LED indicates multiplication completion
  - `BTNU`: Clear the Result of the Multiplication
- **System Modules**:
  - Serial-Parallel Multiplier (`SPM.v`)
  - BCD converter and digit selector for output display
  - Push-button debouncer and rising-edge detectors
  - Clock divider for FPGA timing control

---

## How to Use

1. **Set Inputs** using the Basys 3 toggle switches:
   - `SW15–SW8`: Multiplier (signed 2’s complement)
   - `SW7–SW0`: Multiplicand (signed 2’s complement)

2. **Start Multiplication** by pressing `BTNC`.

3. **Read the Output**:
   - The sign appears on the leftmost digit (`+` or `−`)
   - The magnitude appears across the remaining three digits
   - Scroll through results using `BTNL` (left) and `BTNR` (right)

4. **Completion** is indicated by `LD7` turning ON.

---

## Architecture

### Top Module: `top.v`

Manages system integration, user inputs, display control, and SPM execution.

### Core Components

- `SPM.v`: Core signed serial-parallel multiplier using shift-and-add with carry-save logic.
- `Sign_Producer.v`: Extracts sign and computes absolute product value.
- `BinarytoBCD.v`: Converts 16-bit binary product to BCD for display.
- `Digit_Selector.v`: Controls scrollable digit display logic.
- `DigitDisplayDriver.v`, `Seven_Segment_Display.v`: 7-segment display control.

### Utility Modules

- `CSA.v`, `HA.v`, `TCMP.v`: Arithmetic components for bit-level operations.
- `Clock_Dvider.v`: Clock divider for 200Hz operation.
- `PushButton.v`: Debouncing and edge-detection for user inputs.
- `Counter.v`: Used in the SPM for multiplier and product shift registers; stops counting once max value is reached.
- `debouncer.v`, `synchronizer.v`, `RisingEdge_Detector.v`: Button control logic.
- `Binary_Counter.v` : Drives digit toggling logic for 7-segment display multiplexing.
---

## Simulation

### Testbench: `SPM_Tb.v`

 - Tests the core `SPM` module
 - Provides clock, reset, input stimulus, and monitors output
 - Verifies signed multiplication correctness using `$display`

 - This testbench multiplies two signed 8-bit numbers (X and Y)

   -> Range of each input:   -128 to +127
   -> Range of the product: -16,384 to +16,129

   -> Currently tests: 128 * 128 (interpreted as -128 * -128 = 16,384)
      These values can be modified to test any signed 8-bit input


---

## Tools Used

| Tool               | Description                        |
|--------------------|------------------------------------|
| **Vivado 2023.2**  | Synthesis, simulation, FPGA config |
| **Logisim Evolution** | Logic simulation and display circuits |
| **Basys 3 FPGA**   | Target deployment board (Artix-7)  |
| **Verilog HDL**    | RTL implementation                 |

---

## FPGA Constraints

The project uses a custom `.xdc` constraints file that maps:

- **Switches** (`SW[15:0]`)
- **Buttons** (`BTNC`, `BTNL`, `BTNR`,`BTNU`)
- **7-Segment Display** (`segments[6:0]`, `enable[3:0]`)
- **LED Output** (`done`)
- **Clock** (`clk`)

---

### 👥 Contributors

| Name                 | Contributions |
|----------------------|---------------|
| **Yousef Elmenshawy** | - Developed most **Logisim circuit modules**, which mirror their Verilog counterparts<br>- Designed the **block diagram**<br>- Developed: `SPM.v`, `Counter.v`, `SPM_Tb.v`, `Sign_Producer.v`<br>- Co-developed: `Digit_Selector.v`, `DigitDisplayDriver.v`, `Seven_Segment_Display.v`, `top.v` |
| **Hassan Ashraf**     | - Developed: `BinarytoBCD.v`, `Clock_Dvider.v`, `PushButton.v`, `debouncer.v`, `synchronizer.v`, `RisingEdge_Detector.v`<br>- Co-developed: `Digit_Selector.v`, `DigitDisplayDriver.v`, `Seven_Segment_Display.v`, `top.v` |
| **Ahmed Amgad**       | - Developed: `CSA.v`, `HA.v`, `TCMP.v`, `Binary_Counter.v`<br>- Built **serialization of the multiplier** and **deserialization of the product** in **Logisim**<br>- Co-developed: `Digit_Selector.v`, `DigitDisplayDriver.v`, `Seven_Segment_Display.v`, `top.v` |


---

### 📬 Contact

If you have any questions or feedback regarding this project, feel free to reach out to any of the contributors:

- **Yousef Elmenshawy** – yousefelmenshawi@aucegypt.edu  
- **Hassan Ashraf** – hassan.ashraf@aucegypt.edu  
- **Ahmed Amgad** – ahmed_amgad@aucegypt.edu
