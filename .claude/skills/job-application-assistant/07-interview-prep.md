---
framework_version: 1.0.0
---

# Interview Preparation Guide

<!-- SETUP: STAR examples are personalized by running /setup based on your actual experience -->

## STAR Format

Structure answers as: **Situation** (context), **Task** (your responsibility), **Action** (what you did), **Result** (outcome).

Keep answers to 1-2 minutes. Be specific. End with what you learned or would do differently.

## Ready-Made STAR Examples

### 1. DLR Automated Driving Validation & Hazard Integration (System Verification / Safety / Simulation)
**S:** Evaluating the runtime safety of Automated Driving Systems (ADS) requires integrating dynamic external hazards and multi-sensor data streams into automated testing pipelines under tight execution deadlines.
**T:** Develop research software evaluation pipelines and simulation scenarios in CARLA to validate ADS decision-making against external environmental hazards.
**A:** Designed modular evaluation pipelines using ROS2, CARLA simulator, and Ankaios for workload orchestration. Implemented safety validation metrics and integrated multi-sensor hazard data streams.
**R:** Co-authored and published a first-author paper accepted at the IEEE Intelligent Vehicles Symposium (IV 2026). Commended by DLR leadership for exceptional analytical problem-solving and cross-consortium collaboration.
**Use for:** "Tell me about a complex technical problem you solved", "Describe a time you worked with simulation or autonomous systems", "How do you translate scientific/ambiguous requirements into working software".

### 2. Favendo RTLS Positioning Accuracy & Embedded Firmware (Embedded / Signal Processing / Calibration)
**S:** Indoor and outdoor RTLS beacon tracking suffered from multipath fading and environmental noise, creating positioning drift on embedded sensor nodes.
**T:** Improve positioning accuracy, develop robust embedded firmware for positioning sensors, and characterize hardware reliability.
**A:** Designed advanced filtering algorithms (Kalman/particle filtering) and implemented a systematic multi-sensor calibration framework on ARM microcontrollers; conducted unit, integration, and system testing.
**R:** Substantially improved localization accuracy and stability across challenging test environments. The results formed the core of my Master's Thesis (Grade 3.2) and were deployed into Favendo's commercial RTLS product ecosystem.
**Use for:** "Describe a time you optimized performance or accuracy", "Give an example of low-level embedded debugging", "How do you approach hardware/software integration".

### 3. Workload Orchestration on Embedded Automotive Platforms (Systems Engineering / Edge Computing)
**S:** Next-generation vehicle architectures required containerized, dynamic workload orchestration on resource-constrained embedded platforms.
**T:** Implement and benchmark middleware (Eclipse Ankaios, ROS2, Embedded Linux) on embedded hardware targets.
**A:** Deployed Ankaios on ARM/Jetson hardware, automated container deployment via Bash/Ansible, and profiled resource utilization (CPU, memory, latency) during simulated driving function execution.
**R:** Successfully demonstrated lightweight workload orchestration on embedded platforms, providing reference architectures for ongoing research projects.
**Use for:** "Tell me about adopting an emerging technology", "How do you design for resource-constrained systems".

### 4. JolPi Electronics RTOS Firmware & Test-Driven Development (Firmware / Bare-Metal / TDD)
**S:** Designing consumer electronic devices required deterministic real-time firmware execution and rapid hardware iteration cycles.
**T:** Develop and debug firmware using FreeRTOS and bare-metal C programming adhering strictly to TDD methodologies.
**A:** Wrote modular peripheral drivers (I2C, SPI, UART) and RTOS tasks on microcontrollers; developed unit tests with hardware abstraction mocks to catch boundary conditions early.
**R:** Delivered stable, production-ready firmware with zero critical defects during production qualification, significantly reducing hardware turn-around time.
**Use for:** "Describe your approach to software quality and testing", "How do you write reliable low-level firmware".

### 5. Smarket Full-Stack Mobility Sharing & Hyperledger Fabric (Distributed Systems / DevOps / Agile Leadership)
**S:** University of Bamberg required a secure, decentralized mobility-sharing platform (Smarket) for student peer-to-peer bike rentals with strict privacy, verifiable contracts, and short delivery cycles.
**T:** Architect the microservices backend (Node.js, Express, MongoDB Atlas, OpenAPI 3.0), containerize with Docker, establish automated GitLab CI/CD pipelines to Heroku, and prototype permissioned blockchain chaincodes with Hyperledger Fabric across 6 Scrum sprints.
**A:** Built 4 decoupled REST microservices (`/users`, `/vehicles`, `/offers`, `/rentals`), configured SwaggerUI documentation, established automated GitLab runners for multi-environment deployment, and implemented chaincode smart contracts for immutable rental leases. Rotated as Scrum Master facilitating sprint retrospectives and pair-programming sessions.
**R:** Delivered a fully functioning, containerized platform prototype integrated with a Flutter mobile frontend and continuous cloud delivery within one semester.
**Use for:** "Tell me about building an end-to-end full-stack or microservices system", "Describe a time you led or practiced Agile/Scrum", "How do you automate CI/CD and deployment".

### 6. Edge Intelligence & IoT Gateway Optimization (Edge vs Cloud / Wireless Networks / Energy Optimization)
**S:** Precision agriculture and livestock monitoring required continuous high-frequency telemetry across large remote farms, but central cloud streaming caused severe bandwidth bottlenecks, cloud hosting costs, and battery depletion in sensor nodes.
**T:** Design and evaluate an energy-efficient, heterogeneous IoT gateway architecture incorporating Edge Intelligence (Global Edge Computing Architecture - GECA) and mobile ad-hoc network (MANET) routing.
**A:** Evaluated modular PCIe multi-protocol transceiver cards (UWB, ZigBee, RS485, RFID) and edge pre-processing on Raspberry Pi nodes; modeled and simulated AODV routing protocols across 20 mobile nodes in MATLAB to compute optimal energy paths.
**R:** Demonstrated that edge data filtering reduces cloud downlink by 64.1% and uplink by 38.86%, cuts database packet loss by 53.71%, and reduces transmission energy via shortest-path AODV routing.
**Use for:** "How do you optimize resource and energy constraints in IoT", "Describe a time you evaluated architecture trade-offs between Cloud and Edge".

## Common Tough Questions

### "Why did you leave [previous company]?"
> "My research engineer position at DLR is a fixed-term contract ending April 2026. Having established validation pipelines and published our findings in IEEE IV 2026, I am excited to bring my combined research and industrial embedded systems experience into a long-term, high-impact role in industry."

### "You don't have [specific skill/experience]."
> "Throughout my career—from bare-metal RTOS at JolPi, to RTLS filtering at Favendo, to ADS validation at DLR—I have repeatedly mastered complex, unfamiliar stacks quickly (such as CARLA, ROS2, and Ankaios). My strong core in C/C++, systems engineering, and Linux allows me to ramp up on domain-specific tools with high speed and autonomy."

### "Where do you see yourself in 5 years?"
> "Leading technical architecture and development for embedded, autonomous, or cyber-physical systems—bridging algorithmic design, low-level firmware, and robust systems verification."

### "What's your biggest weakness?"
> "My German language proficiency is currently at CEFR A2. While I am fully proficient and fluent working in English (CEFR C1) for all technical, engineering, and collaborative tasks, I am actively continuing German courses to expand my language skills in day-to-day workplace communication."

### "Why this company specifically?"
> Customize per company. Must reference: specific projects, company values, market position, or team structure. Never give a generic answer.

## Questions You Should Ask Interviewers

### About the Role
- "What does a typical week look like in this role?"
- "What would success look like in the first 6 months?"
- "What's the biggest challenge the team is facing right now?"

### About the Team
- "How big is the team, and how do you divide work?"
- "What does the development/project lifecycle look like, from idea to production?"
- "How do you onboard new team members?"

### About Tech & Growth
- "What's your current tech stack for [relevant area]?"
- "Is there room to grow into more architectural or strategic decisions?"
- "How does the team stay current with new tools and methods?"

### About Culture (use these to prevent disappointment)
- "How would you describe the team culture?"
- "What does professional development look like here?"
- "Is there flexibility for remote/hybrid work?"
- "What's the balance between development/new projects and maintenance work?"
- "How would you describe the leadership style in this team?"
- "What do people who thrive here have in common?"

## Phone/Video Interview Tips
- Have STAR examples written out (use this file)
- Keep a glass of water nearby
- Smile when speaking (it changes your tone)
- Ask for clarification if a question is vague
- It's OK to take 5 seconds to think before answering
- End with: "Is there anything else you'd like to know about my background?"

## After the Application (Best Practice)

### Follow-Up Etiquette
- **Don't call to "stand out"** or to learn more about the role post-submission - this risks a negative impression
- If the employer specified a timeline, respect it and wait
- If no timeline was given and significant time has passed (2+ weeks), a brief call to ask about status is acceptable
- If you have genuinely new, relevant information to share, a short follow-up is fine

### Thank-You Notes
- When you receive any update (interview invitation, rejection, or status update), send a brief thank-you message
- Express appreciation for their time and the process
- Keep it short (2-3 sentences)

## Roleplay Guidelines
When the user asks for interview practice:
1. Ask which role/company to simulate
2. Start with easy warm-up questions ("Tell me about yourself")
3. Progress to role-specific technical questions
4. Include 1-2 behavioral questions using the competencies from the job posting
5. End with a tough question or curveball
6. After each answer, give brief feedback: what worked, what to sharpen
7. Suggest which STAR example would work best for each question
