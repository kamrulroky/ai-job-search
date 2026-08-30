# Search Queries for Job Scraper

## Installed portal CLIs (primary for `/scrape`)

`/scrape` discovers every portal skill under `.agents/skills/*/SKILL.md` and runs its CLI first. Shipped country-agnostic CLIs include `linkedin-search` and `freehire-search` (enabled by default); Danish demos remain disabled for the German market. You do **not** need a matching `site:` line below for those CLIs to run.

The `site:` query templates in this file are the **WebSearch fallback** — for German job portals without a dedicated CLI, company career pages, or when a CLI fails.

**Language scope:** Queries are provided in both English and German to capture both international and domestic job postings in Germany.

## Search Sites

Primary:
- **stepstone.de** - Germany's largest engineering & tech job portal
- **linkedin.com/jobs** - LinkedIn job listings (Germany / Remote); also covered by `linkedin-search` CLI
- **arbeitsagentur.de** - Official German Federal Employment Agency portal (Jobsuche)
- **xing.com/jobs** - DACH region professional network job board

Secondary:
- Direct searches on target company career pages (e.g., Bosch, Continental, DLR, Cariad, BMW, Mercedes-Benz, ZF, Infineon, NXP, Siemens, TTTech Auto, Vector Informatik, IAV, Fraunhofer, research institutes)

## Query Categories

Queries are grouped by priority and organized by functional area.

### Priority 1: Embedded Software & Firmware Engineering

Matches core expertise in low-level C/C++, FreeRTOS, Embedded Linux, and sensor nodes.

```
site:stepstone.de "Embedded Software Engineer" Germany
site:stepstone.de "Firmware Developer" OR "Firmwareentwickler" Germany
site:stepstone.de "Embedded Linux" C++ Germany
site:stepstone.de "FreeRTOS" C++ Deutschland
site:linkedin.com/jobs "Embedded Software Engineer" Germany
site:linkedin.com/jobs "Firmware Engineer" Germany
site:arbeitsagentur.de "Embedded Software" Deutschland
```

### Priority 2: Autonomous Driving & Research Systems (ADS / V&V)

Matches specialized research experience at DLR in simulation (CARLA), ROS2, safety verification, and hazard integration.

```
site:stepstone.de "Research Engineer" "Autonomous Driving" OR "ADS" Germany
site:stepstone.de "Wissenschaftlicher Mitarbeiter" "Autonomes Fahren" Deutschland
site:stepstone.de "Simulation Engineer" "CARLA" OR "ROS2" Germany
site:linkedin.com/jobs "Autonomous Driving" "Verification" OR "Validation" Germany
site:linkedin.com/jobs "Research Engineer" "Automated Driving" Germany
```

### Priority 3: Systems Engineering & Field Application Engineering (FAE)

Matches systems-level modeling, edge container orchestration (Ankaios), and partner-facing application engineering.

```
site:stepstone.de "Systems Engineer" "Embedded" Germany
site:stepstone.de "Systemingenieur" "Automotive" OR "Embedded" Deutschland
site:stepstone.de "Field Application Engineer" "Embedded" OR "Semiconductor" Germany
site:linkedin.com/jobs "Field Application Engineer" Germany
site:linkedin.com/jobs "Systems Engineer" ROS2 OR "Embedded Linux" Germany
```

### Priority 4: PhD Positions & Applied Research

Targeting doctoral research and academic/industrial PhD fellowships in cyber-physical, autonomous, or embedded systems.

```
site:stepstone.de "PhD Candidate" OR "Doktorand" "Computer Science" OR "Informatik" Germany
site:stepstone.de "Doktorand" "Autonome Systeme" OR "Embedded Systems" Deutschland
site:linkedin.com/jobs "PhD Student" "Autonomous Systems" OR "Robotics" Germany
site:arbeitsagentur.de "Wissenschaftlicher Mitarbeiter" Promotion Deutschland
```

## Location Filter

Targeting all regions within Germany, with full flexibility for on-site, hybrid, and remote roles:
- **Ideal / Current hubs:** Oldenburg, Bremen, Hamburg, Hannover, Bamberg, Nuremberg, Erlangen, Munich, Berlin, Stuttgart, Frankfurt
- **Acceptable:** Any metropolitan or industrial region across Germany
- **Remote / Hybrid:** Fully supported throughout Germany
- **International / Relocation abroad:** Requires discussion/sponsorship

## Language Filter

- Primary working language: English (CEFR C1 - Full professional proficiency)
- German language proficiency: CEFR A2 (Elementary / ongoing learning)
- When evaluating postings, apply `04-job-evaluation.md`'s Language Gate:
  - Roles accepting English as working language $\rightarrow$ **PASS**
  - Roles requiring fluent German (C1/C2) as a mandatory job condition $\rightarrow$ **FLAG** for user review
  - Roles requiring languages not spoken (e.g. French, Japanese) as mandatory $\rightarrow$ **FAIL**

## Date Filter

Only include jobs posted within the last 14 days, or with an application deadline that has not yet passed. Flag older postings with unknown dates.

## Adapting Queries

When searching for a specific focus area, pass the category tag to `/scrape` or combine keywords:
- `/scrape embedded` $\rightarrow$ Priority 1 queries + specific MCU/protocol terms
- `/scrape research` $\rightarrow$ Priority 2 & 4 queries + simulator/validation terms
- `/scrape fae` $\rightarrow$ Priority 3 queries + customer/application terms
