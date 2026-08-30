# Project & Publication Dossier: Enhancing RSSI-Based Positioning Accuracy using Advanced Filtering Techniques

## Metadata
- **Title:** *Enhancing RSSI-based Positioning Accuracy using Advanced Filtering Techniques*
- **Type:** Master of Science Thesis (International Software Systems Science)
- **Institution:** Otto-Friedrich-Universität Bamberg (MOBI Chair) & Favendo GmbH
- **Author:** Kamrul Hasan (Matr. No. 2029063)
- **Supervisors:** Prof. Dr. Daniela Nicklas, Simon Steuer
- **Date:** July 26, 2023 | Grade: 3.2 (M.Sc. Overall Grade: 2.5 Good)
- **Publication Link:** [ResearchGate Document 400899464](https://www.researchgate.net/publication/400899464_Enhanching_RSSI-based_Positioning_Accuracy_using_Advanced_Filtering_Techniques)

---

## 1. Problem Statement & Motivation
- **Indoor Positioning Challenges:** GPS signals attenuate drastically indoors. Bluetooth Low Energy (BLE) Received Signal Strength Indicator (RSSI) provides an affordable, hardware-agnostic proximity metric for Real-Time Location Systems (RTLS), asset tracking, and indoor navigation.
- **Signal Degradation:** Raw RSSI suffers from severe multipath propagation, environmental reflection (walls, metal equipment), and human body attenuation (water content absorption), resulting in erratic distance errors exceeding several meters.
- **Research Question:** *What filtration method can effectively reduce BLE beacon signal noise and improve localization accuracy in highly reflecting and noisy environments?*

---

## 2. System Design & Architectural Pipeline
Implemented a hybrid **pipe-and-filter** and **broker-based** distributed architecture:

### A. Data Collection & Hardware Setup
- **Beacons:** Kontakt.io Anchor Beacon 2 (BLE 5.0, iBeacon protocol, 500ms advertising interval, -12dBm transmission power).
- **Scanners / Trackers:** Dell Precision 3571 laptop & Raspberry Pi 4 running Linux OS with Node.js and `@abandonware/noble` BLE scanning library.
- **Message Broker & Storage:** Redis pub/sub server for decoupled real-time streaming; Elasticsearch for indexing; Kibana for live spatial telemetry dashboards.
- **Ground Truth Benchmark:** Integrated Quuppa High-Precision Positioning System delivering millimeter/centimeter-level 3D spatial ground truth ($x, y, z$).

### B. Two-Stage Advanced Filtering Algorithm
1. **Stage 1 – 1D Kalman Filtering for RSSI Smoothing:**
   - Transition Model: $x_t = A_t x_{t-1} + B_t u_t + \epsilon_t$
   - Observation Model: $z_t = C_t x_t + \delta_t$
   - Prediction & Update Steps with Kalman Gain: $K_t = \bar{\Sigma}_t (\bar{\Sigma}_t + Q_t)^{-1}$
   - Tuned process noise covariance ($Q$) and measurement noise covariance ($R$) for exponential BLE attenuation patterns.
2. **Log-Distance Path Loss Model Calibration:**
   - Model formulation:
     $$d = 10^{\frac{\text{RSSI}_{d0} - \text{RSSI}}{10\cdot\gamma}} \times d_0$$
   - Utilized SciPy optimization (`scipy.optimize.minimize`) on empirical calibration data to compute best-fit reference power $\text{RSSI}_{d0}$ and path loss exponent $\gamma$ per beacon anchor.
3. **Stage 2 – 2D Particle Filter (Sequential Monte Carlo - SMC) Localization:**
   - **Initialization:** $N$ particles randomly uniformly distributed within boundary constraints (`roomWidth`, `roomLength`).
   - **Prediction:** Gaussian displacement model based on motion uncertainty.
   - **Weight Calculation:** Likelihood update based on Euclidean distance residuals against calibrated beacon radii.
   - **Resampling:** Importance resampling with particle jitter to prevent sample impoverishment.
   - **Target State Estimation:** Weighted average calculation yielding the 2D estimated coordinate $(\hat{x}, \hat{y})$.

---

## 3. Experimental Results & Performance Gains
- **Signal-to-Noise Ratio (SNR):** Kalman filtering increased SNR from $1.94 \rightarrow 3.48$, an improvement of **+79.27%** (1.79x).
- **Distance Estimation Error (RMSE):** Reduced distance RMSE from **$0.84\text{m}$ (raw RSSI) down to $0.46\text{m}$ (filtered RSSI)**.
- **2D Localization Accuracy:** Convergence over time demonstrated Euclidean error dropping to **sub-1.5 meter accuracy** across dynamic test trajectories, benchmarked against Quuppa ground truth.

---

## 4. Key Competencies Demonstrated
- **Algorithms & Mathematics:** Discrete Kalman Filter, Extended Kalman Filter (EKF), Particle Filter (Sequential Monte Carlo), Bayesian Estimation, Log-Distance Path Loss.
- **Languages & Stacks:** Python, SciPy, NumPy, Matplotlib, Node.js, Noble BLE, Redis, Elasticsearch, Kibana, Linux, Raspberry Pi 4.
- **Industrial Transfer:** Direct integration into Favendo GmbH's commercial RTLS sensor calibration pipelines.
