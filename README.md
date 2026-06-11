# 32-bit 5-Stage Pipelined RISC Processor

## Overview

This project implements a 32-bit 5-Stage Pipelined RISC Processor using Verilog HDL. The processor is designed with a classic pipeline architecture consisting of Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), Memory Access (MEM), and Write Back (WB) stages. The design incorporates hazard detection, data forwarding, and branch handling mechanisms to improve instruction throughput and pipeline efficiency.

The project demonstrates key concepts of Computer Architecture, RTL Design, Digital Design, and Functional Verification, making it suitable for ASIC Design, RTL Design, FPGA Design, and Design Verification roles.

---

## Features

* 32-bit RISC Processor Architecture
* 5-Stage Pipeline Design

  * Instruction Fetch (IF)
  * Instruction Decode (ID)
  * Execute (EX)
  * Memory Access (MEM)
  * Write Back (WB)
* Hazard Detection Unit
* Data Forwarding Unit
* Branch Flush Logic
* Instruction Memory
* Data Memory
* Register File
* Arithmetic Logic Unit (ALU)
* Immediate Generator
* Functional Verification using Testbenches
* Waveform Analysis using GTKWave

---

## Processor Architecture

```text
             ┌─────────────┐
             │     PC      │
             └──────┬──────┘
                    │
                    ▼
       ┌────────────────────┐
       │ Instruction Memory │
       └─────────┬──────────┘
                 │
                 ▼
              IF/ID
                 │
                 ▼
       ┌──────────────────┐
       │  Register File   │
       │  Control Unit    │
       │ Immediate Gen    │
       └────────┬─────────┘
                │
                ▼
              ID/EX
                │
                ▼
       ┌──────────────────┐
       │       ALU        │
       │ Forwarding Unit  │
       └────────┬─────────┘
                │
                ▼
             EX/MEM
                │
                ▼
       ┌──────────────────┐
       │   Data Memory    │
       └────────┬─────────┘
                │
                ▼
             MEM/WB
                │
                ▼
       ┌──────────────────┐
       │    Write Back    │
       └──────────────────┘
```

---

## Project Structure

```text
32-bit-Pipelined-RISC-Processor
│
├── rtl
│   ├── pc.v
│   ├── instruction_memory.v
│   ├── register_file.v
│   ├── alu.v
│   ├── control_unit.v
│   ├── immediate_generator.v
│   ├── data_memory.v
│   ├── writeback_mux.v
│   ├── if_id.v
│   ├── id_ex.v
│   ├── ex_mem.v
│   ├── mem_wb.v
│   ├── hazard_detection.v
│   ├── forwarding_unit.v
│   ├── flush_unit.v
│   ├── branch_unit.v
│   └── pipeline_processor.v
│
├── tb
│
├── docs
│   ├── pipeline_waveform.png
│   ├── forwarding_waveform.png
│   ├── hazard_waveform.png
│   ├── branch_flush_waveform.png
│   └── alu_waveform.png
│
└── README.md
```

---

## Pipeline Stages

### Instruction Fetch (IF)

Fetches instructions from Instruction Memory using the Program Counter.

### Instruction Decode (ID)

Decodes instructions and reads operands from the Register File.

### Execute (EX)

Performs arithmetic and logical operations using the ALU.

### Memory Access (MEM)

Handles load and store operations through Data Memory.

### Write Back (WB)

Writes execution or memory results back to the Register File.

---

## Hazard Handling

### Hazard Detection Unit

Detects data hazards and generates stall signals when required.

Example:

```assembly
ADD x1,x2,x3
SUB x4,x1,x5
```

### Data Forwarding Unit

Forwards results from later pipeline stages to reduce pipeline stalls.

Forwarding Paths:

```text
EX/MEM → EX
MEM/WB → EX
```

### Branch Flush Logic

Flushes incorrect instructions when a branch is taken to maintain correct program execution.

---

## Verification

All modules were verified using dedicated Verilog testbenches.

Verification includes:

* ALU Functional Testing
* Pipeline Register Verification
* Hazard Detection Verification
* Forwarding Logic Verification
* Branch Flush Verification
* Integrated Pipeline Verification

Waveforms were analyzed using GTKWave.

---

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* Visual Studio Code

---

## Skills Demonstrated

* RTL Design
* Digital Design
* Computer Architecture
* Processor Design
* Pipeline Architecture
* Hazard Detection
* Data Forwarding
* Functional Verification
* ASIC Design Fundamentals
* FPGA Design Fundamentals

---

## Results

Successfully designed and verified a 32-bit 5-Stage Pipelined RISC Processor featuring hazard detection, forwarding logic, branch handling, and pipeline execution. The processor was functionally verified through simulation and waveform analysis, demonstrating correct instruction flow across all pipeline stages.

---

## Author

Rongali Chandra Kiran
