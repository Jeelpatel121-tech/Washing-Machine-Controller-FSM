# 🧺 Washing Machine Controller (FSM)

This project implements an **Automatic Washing Machine Controller using Verilog HDL**.  
The system is designed using a **Finite State Machine (FSM)** to simulate the working stages of a washing machine such as filling water, washing, drain, and spinning.

The design is suitable for **FPGA implementation and digital system learning**.

---

## 📌 Project Features

- Finite State Machine (FSM) based design
- Automatic washing cycle control
- Multiple washing stages simulation
- Verilog HDL implementation
- Testbench for functional verification
- Suitable for FPGA / Digital Design learning

---

## ⚙️ Washing Machine Operation Stages

The controller operates through the following states:

1. **Door Lock**
   - Waiting for the start signal

2. **Water Fill**
   - Water is filled into the drum

3. **Wash Cycle**
   - Drum rotates to wash clothes

4. **Drain Water**
   - Clean water rinses the clothes

5. **Spin Cycle**
   - High speed rotation removes water

6. **Finish**
   - Washing process completed

---

## 🧠 FSM State Diagram

The washing machine controller is implemented using a **Finite State Machine** that transitions between different washing stages based on timing and control signals.

States used in this design:
IDLE → FILL → WASH → RINSE → SPIN → DONE


---

## 🛠 Tools Used

- **Verilog HDL**
- **Vivado** (for simulation)
- **GTKWave** (for waveform analysis)

---

## 📂 Project Structure

Washing-Machine-Controller/
│
├── src
│   └── washing_machine_1.v
│
├── testbench
│   └── washing_machine_tb.v
│
├── docs
│   └── waveform.vcd
│
└── README.md

---

## ▶️ Simulation

1. Compile the Verilog files
2. Run the testbench
3. Observe the waveform to verify state transitions


---

## 📊 Applications

- Digital System Design Learning
- FSM based controller design
- FPGA based home appliance control
- Embedded system automation

---


## 👨‍💻 Author

**Jeel Patel**

Electronics & Communication Engineering  
Interested in **Digital Design | Verilog | FPGA**
