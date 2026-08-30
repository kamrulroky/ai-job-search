# Project & Publication Dossier: Smarket – Decentralized Mobility Sharing Platform

## Metadata
- **Project Title:** *Mobility Sharing Platform: Smarket* (MOBI-Proj-M)
- **Institution:** Otto-Friedrich-Universität Bamberg – Chair of Mobile Software Systems / Mobility (MOBI)
- **Supervisors:** Prof. Dr. Daniela Nicklas, Michael Sünkel
- **Authors/Team:** Kamrul Hasan, Christopher Maximilian Nagy, Niklas Diller, Osama Bin Ehsan, Nihar Satish Sawant
- **Context:** Smart City Bamberg Initiative / University Mobility Ecosystem
- **Date:** Summer Semester 2022

---

## 1. Project Vision & Architecture
- **Objective:** Design and engineer a free, secure, peer-to-peer urban mobility (bicycle, e-bike, cargo bike) rental platform for closed university communities.
- **Architectural Principles:**
  - Microservices architecture following Fowler's *"Componentization via Services"* and *"Smart Endpoints and Dumb Pipes"*.
  - Strict decoupling of cross-platform mobile frontend (Flutter) and backend platform (REST API + Blockchain).
  - Open and extensible REST interface documented with OpenAPI 3.0.0 and SwaggerUI.

---

## 2. Technology Stack & Implementation Details

### A. Frontend (Smarket Mobile App)
- **Framework:** Flutter (Google Dart) targeting Android and iOS.
- **State Management & UI:** Stateful widgets, composed widget hierarchies (`ColumnCard`, carousel photo viewers), unified theme data, reactive state updates.
- **Geolocation & Mapping:** Native map application linking (Google Maps / Apple Maps intents) with obfuscated region-level privacy protection for lenders.

### B. Backend Platform (Microservices REST API)
- **Runtime & Framework:** Node.js, Express.js.
- **Microservice Domain Separation:**
  - `User Service (/users)`: User authentication, student verification, profiles, rating metrics.
  - `Vehicle Service (/vehicles)`: Vehicle entity registration (type, manufacturer, condition Likert scale, photo upload).
  - `Offer Service (/offers)`: Availability windows, geolocation, search, and sorting.
  - `Rental Service (/rentals)`: State machine managing rental lifecycle (`requested`, `accepted`, `declined`, `active`, `completed`).
- **Database & Data Modeling:** MongoDB with Mongoose ODM connected to MongoDB Atlas. Schema design with custom JSON transformation and UUID transaction indexing.
- **API Documentation:** OpenAPI 3.0 standard with `swagger-ui-express` providing interactive API explorer at `/api-docs`.

### C. DevOps & Infrastructure Automation
- **Containerization:** Multi-stage `Dockerfile` containerizing microservices for consistent deployment across local, staging, and production environments.
- **CI/CD Pipeline:** GitLab CI/CD with automated build, test execution, and deployment hooks into Heroku PaaS instances.
- **Testing & Quality Assurance:** Postman API test suites, regression test scripts, linting.

### D. Blockchain & Distributed Ledger Integration (PoC)
- **Technology:** Hyperledger Fabric permissioned blockchain network.
- **Smart Contracts (Chaincode):** Developed asset transfer smart contracts recording rental leases as immutable transaction hashes on the distributed ledger between lender and borrower.

### E. Agile Engineering Methodology
- **Scrum Framework:** 6 sprint iterations with rotating Scrum Master roles, bi-weekly standups, sprint planning, backlog grooming, and retrospectives.
- **Design Artifacts:** Interactive Figma mockups, UML class and sequence diagrams (Diagrams.net), user stories with MoSCoW prioritization.

---

## 3. Key Competencies Demonstrated
- **Full-Stack Engineering:** Flutter (Dart), Node.js, Express.js, MongoDB/Mongoose, REST API Design.
- **DevOps & Cloud:** Docker, GitLab CI/CD, Heroku PaaS, Swagger / OpenAPI 3.0.
- **Distributed Systems:** Hyperledger Fabric, Smart Contracts, Microservices Architecture.
- **Agile Leadership:** Scrum Master experience, sprint retrospectives, pair programming, cross-functional collaboration.
