# Project & Publication Dossier: On-Device Smart Assistant using Mozilla DeepSpeech

## Metadata
- **Title:** *Case Study: Smart Speaker / Assistant*
- **Institution:** Institute of Information Systems (iisys) / University of Applied Sciences Hof
- **Supervisor / Course:** Prof. Dr. René Peinl
- **Author:** Kamrul Hasan
- **Date:** December 2019

---

## 1. Problem Statement & Motivation
- **Privacy Bottleneck in Voice AI:** Mainstream commercial smart speakers (Amazon Alexa, Google Assistant, Apple Siri) transmit all voice telemetry to cloud servers, conflicting with GDPR and data privacy standards in Europe.
- **Technical Challenge:** Running Speech-to-Text (STT) and Natural Language Understanding (NLU) fully locally on embedded hardware (Raspberry Pi 3) causes severe latency (Real-Time Factor $\text{RTF} \approx 3.5$, where a 3-second audio command takes $>10\text{ seconds}$ to evaluate) and high Word Error Rate ($\text{WER} \approx 30\%$).

---

## 2. Technical Solutions & Engineering Measures

### A. Software Optimization
1. **Streaming Audio Decoding:** Replaced batch post-recording processing with streaming acoustic chunk inference (PyAudio buffer feeds acoustic model concurrently while user speaks), eliminating buffering latency.
2. **Acoustic Model Quantization:** Converted Mozilla DeepSpeech TensorFlow acoustic models to TensorFlow Lite 8-bit integer quantization (int8), reducing memory footprint by ~75% and accelerating CPU matrix multiplication on ARM Cortex-A53.
3. **Domain-Constrained Language Model (KenLM):** Replaced general English language model with custom-trained KenLM n-gram models restricted to smart home command vocabulary, correcting phoneme spelling ambiguities ("real time" vs "realtime") and dropping WER to $<10\%$.
4. **NLU Pipeline Modernization:** Replaced brittle regular expressions with lightweight slot-filling and intent classification models (Rasa NLU / Snips NLU).

### B. Hardware Acceleration Trade-offs
- Evaluated embedded acceleration modules:
  - **Google Coral Edge TPU (USB Accelerator):** Dedicated ASIC for 8-bit quantized TensorFlow models; sub-100ms inference with minimal power draw.
  - **Intel Neural Compute Stick 2 (Myriad X VPU):** OpenVINO inference acceleration on ARM Linux.
  - **NVIDIA Jetson Nano / Orin:** GPU acceleration via TensorRT for concurrent STT and multi-intent NLU.

### C. System Architecture
- Modular, extensible **OSGi framework** decoupling Audio Ingestion, STT Inference Engine, NLU Dispatcher, and Smart Home Device Actuators over local MQTT/REST protocols.

---

## 3. Key Competencies Demonstrated
- **Embedded AI & Speech Processing:** Mozilla DeepSpeech, TensorFlow Lite, KenLM Language Models, Streaming DSP, Acoustic Decoding.
- **Hardware Acceleration:** Edge TPU, OpenVINO, ARM Cortex optimization, Edge vs Cloud Trade-off Analysis.
- **System Architecture:** Modular OSGi, Real-Time Audio Streaming, Privacy-Preserving IoT.
