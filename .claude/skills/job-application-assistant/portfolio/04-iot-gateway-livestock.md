# Project & Publication Dossier: Analysis of Design Approaches of an Efficient IoT Gateway for Livestock Monitoring

## Metadata
- **Title:** *Analysis of design approaches of an efficient IoT gateway for livestock monitoring system*
- **Type:** Master Seminar Paper (Mobile Software Systems)
- **Institution:** Otto-Friedrich-Universität Bamberg (MOBI Chair)
- **Author:** Kamrul Hasan
- **Date:** Summer Semester 2022
- **Publication Link:** [ResearchGate Document 400899541](https://www.researchgate.net/publication/400899541_Applications_of_Internet_of_Things_Towards_Smart_Home_Automation)

---

## 1. Problem Statement & Motivation
- **Smart Agriculture / Precision Livestock:** Precision livestock farming requires monitoring animal biometrics (temperature, respiratory rate, movement, stress, rumination) and environmental variables across large, remote agricultural facilities.
- **Gateway Bottlenecks:** Commercial IoT gateways face major obstacles:
  1. *Heterogeneity & Lack of Open Standards:* Proliferation of incompatible radio protocols (BLE, LoRaWAN, ZigBee, RFID, UWB, Cellular).
  2. *Cloud Over-Reliance & Latency:* Transmitting high-frequency raw telemetry to central cloud servers creates severe bandwidth congestion, high cloud hosting costs, and service downtime risks.
  3. *Energy Depletion in Remote Nodes:* Battery-powered sensor nodes and remote gateways require ultra-low power consumption and energy-aware routing.

---

## 2. Technical Survey, Taxonomy & Methodologies

### A. Heterogeneity & Configurable Hardware Architectures
- Evaluated modular gateway architectures leveraging standard **PCIe user card interfaces** supporting interchangeable transceiver cards (UWB positioning, ZigBee, 2.4GHz/915MHz RFID, RS485, and sensor acquisition).
- Software protocol conversion with programmable EEPROM card identification and browser-server configuration.

### B. Edge Intelligence & Reference Architectures (GECA)
- Analyzed the **Global Edge Computing Architecture (GECA)** and the **SmartDairyTracer** agro-industry platform deployed across dairy farms in Spain:
  - *Layer 1 (IoT Layer):* Heterogeneous sensors communicating via LoRaWAN, BLE, Wi-Fi, ZigBee.
  - *Layer 2 (Edge Layer):* Raspberry Pi edge nodes executing local filtering, outlier detection, data aggregation, and cryptographic preprocessing.
  - *Layer 3 (Cloud Business Layer):* Google Cloud Platform App Engine PaaS for long-term analytics and distributed ledger traceability.
- **Empirical Benchmarks:**
  - Introducing the Edge Layer reduced **downlink data transfer by 64.1%** and **uplink data transfer by 38.86%** to the cloud.
  - Decreased overall database packet loss by **53.71%** (from 756 lost points down to 350 points over 30 days).

### C. Energy-Efficient Ad-Hoc Routing (MANET & AODV)
- Evaluated Mobile Ad-Hoc Networks (MANET) for livestock tracking where animals act as mobile sensor nodes.
- **Simulation in MATLAB:** Modeled 20 mobile nodes across farm topologies utilizing the **Ad-hoc On-Demand Distance Vector (AODV)** routing protocol.
- Demonstrated that shortest-path multi-hop routing significantly reduces transmission power ($87.78\text{ dBm}$ optimal route vs $94.85\text{ dBm}$ worst-case route), extending network lifetime under constrained battery budgets.

---

## 3. Key Competencies Demonstrated
- **IoT & Wireless Networking:** LoRaWAN, BLE, ZigBee, UWB, RFID, RS485, MANET, AODV Protocol.
- **Edge Computing & Cloud Architecture:** Global Edge Computing Architecture (GECA), Google Cloud Platform (PaaS), Edge filtering, Data rate optimization.
- **Simulation & Modeling:** MATLAB network simulation, transmission power modeling, architectural taxonomy.
