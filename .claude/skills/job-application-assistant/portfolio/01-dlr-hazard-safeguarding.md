# Project & Publication Dossier: Leveraging External Hazard Data to Safeguard Automated Driving Systems

## Metadata
- **Publication Title:** *Leveraging External Hazard Data to Safeguard Automated Driving System*
- **Conference:** IEEE Intelligent Vehicles Symposium (IV 2026)
- **Authors:** Kamrul Hasan, Ali Shakeri, Bernd Westphal
- **Affiliation:** German Aerospace Center (DLR) – Institute of Systems Engineering for Future Mobility, Oldenburg, Germany
- **Research Project:** GAIA-X 4 AGEDA (Federal Ministry for Economic Affairs and Climate Action - BMWK, grant 19S22004N)
- **Status:** Published / Accepted
- **DOI / Link:** [IEEE Xplore Document 11624101](https://ieeexplore.ieee.org/document/11624101)

---

## 1. Problem Statement & Motivation
- **Onboard Sensor Limitations:** State-of-the-art perception sensors (radar, camera, LiDAR) on autonomous vehicles are bounded by physical line-of-sight, finite range, and field-of-view restrictions, leading to Safety of the Intended Functionality (SOTIF / ISO 21448) hazards at occluded intersections, blind curves, and crests.
- **Unreliable External V2X Data:** While V2X Collective Perception (ETSI CAM/CPM) provides early hazard alerts from infrastructure or connected vehicles, external data is inherently unreliable (uncertainty, packet drops, transmission latency, false alarms).
- **Core Question:** *How can an Automated Driving System (ADS) safely utilize potentially unreliable external hazard data to improve safety and comfort without compromising baseline safety guarantees?*

---

## 2. System Architecture & Methodology

### A. Early Hazard Processing System (EHPS)
- Subscribes to Gaia-X compliant V2X infrastructure `TrafficData`.
- Computes hazard distance $d_{\text{ext}} = d_{\text{hazard}} \pm d_{\epsilon}$ incorporating an uncertainty margin $d_{\epsilon}$.
- Emits the `HazardSignal` interface (`status: bool`, `distance_to_hazard: float`) to the vehicle's ADS.

### B. Three-State Behavioral Model (State Machine)
1. **Default State:** Normal Dynamic Driving Task (DDT) operation compliant with UNECE R157 (ALKS). Cruising speed up to $v_{\text{max}} = 90-130\text{ km/h}$.
2. **Cautious State (Core Innovation):** Preparatory state triggered when external hazard is reported ($H_{\text{ext}} = 1, H_{\text{int}} = 0$) within the transition boundary:
   $$d_{\text{int}} < d_{\text{ext}} \le d_{\text{tr}} + d_{\text{int}}$$
   where $d_{\text{tr}} = \frac{v_{\text{max}}^2 - v_c^2}{2a_{\text{tr}}}$ is the transition distance with comfortable deceleration $a_{\text{tr}} \le 3.0\text{ m/s}^2$. Proactively reduces vehicle speed to cautious cruising speed $v_c = 60-72\text{ km/h}$.
3. **Fallback State:** Emergency Maneuver (EM), Minimum Risk Maneuver (MRM), or Transition Demand (TD). **Decisive safety actions are triggered exclusively upon internal sensor confirmation ($H_{\text{int}} = 1$).**

### C. Mathematical Safety Argumentation (5-Case Split Analysis)
Proved formally that extended ADS is at least as safe as baseline under all conditions:
- **Case 1 (Reliable hazard data):** Speed reduced early; Time-to-Collision (TTC) increases, required stopping deceleration drops significantly.
- **Case 2 (False alarm / ghost hazard):** Vehicle slows comfortably to $v_c$, verifies absence with internal sensors at $d_{\text{int}}$, and smoothly transitions back to Default State (no rear-end collision risk, $a_{\text{tr}} \le 3.0\text{ m/s}^2$).
- **Case 3 (Missed external report):** Operates identically to baseline ADS with full internal sensor safety guarantees.
- **Case 4 (Hazard closer than reported):** Partial deceleration still yields lower entry speed at internal detection than $v_{\text{max}}$.
- **Case 5 (Hazard farther than reported):** System safely transitions back to Default upon reaching nominal range.

---

## 3. Experimental Evaluation & Results
- **Simulation Environment:** CARLA Autonomous Driving Simulator with reproducible test scenarios generated via ScenarioRunner.
- **System Under Test (SUT):** Automated Lane Keeping System (ALKS, UNECE R157) in single-lane blocked highway driving scenarios.
- **Benchmark Findings ($n = 10$ runs):**
  - **TTC (Time-to-Collision):** Increased by **+45.0%** ($3.102\text{s} \rightarrow 4.497\text{s}$) under reliable data; increased by **+20.3%** ($3.730\text{s}$) under severe unreliability ($d_{\epsilon} = 50\text{m}$).
  - **Required Deceleration ($a_{\text{req}}$):** Reduced by **-61.7%** (from $3.306\text{ m/s}^2 \rightarrow 1.267\text{ m/s}^2$) under reliable data; reduced by **-40.8%** ($1.957\text{ m/s}^2$) under unreliable data.
  - **Passenger Comfort:** Baseline required hard emergency braking ($>3.3\text{ m/s}^2$); EHPS-enabled ALKS stayed strictly within the human comfort boundary ($\le 2.0-2.9\text{ m/s}^2$).

---

## 4. Key Competencies Demonstrated
- **Autonomous Driving & Standards:** UNECE R157 (ALKS), ISO 21448 (SOTIF), SAE J3016 automation levels, V2X collective perception (ETSI CAM/CPM).
- **Tooling & Stacks:** CARLA Simulator, ScenarioRunner, ROS2, Eclipse Ankaios, Eclipse Kuksa, Python, C++, Linux, Git.
- **Mathematical & Systems Modeling:** State machine formalization, kinematic deceleration models, safety case argumentation, statistical simulation analysis.
