# Health Agent: Product Strategy (v1)

## Direction
**Target: adults over 60 who live independently** (adult child as optional secondary viewer; assumption to test).
Build a voice-first, bounded-proactive Health Agent that turns talk and photos into a simple nutrition, hydration and walking plan, re-plans after a bad day, and sends a weekly plain-language summary. It does not diagnose, handle emergencies or give medical advice.

**Likely pain points (assumptions to validate):** typing and forms are hard; forgetting to eat or drink; unsure what is safe with their conditions; fear of over-exertion and falls; distrust of apps holding health data; long answers overwhelm.

## Feature triage (for adults 60+)
| # | Feature | Decision | Reason |
|---|---|---|---|
| F01 | Food photo to calories | Baseline | Photo beats typing; give ranges and confirm. |
| F02 | Profile and goals | Baseline | Voice conversation replaces forms; cut reference images. |
| F03 | Activity tracking | Baseline | Phone-based walking only. |
| F04 | Diet plan with water target | Baseline | Reframe as nutrition and hydration; deficit is risky for older adults (assumption). |
| F05 | Progress, fasting, supplements | Baseline (tracker only) | Weekly narrative; cut fasting and supplements. |
| F06 | Sleep tracking | Later | Not a stated need. |
| F07 | Challenges, motivational videos | Later | Simple weekly walking goal instead; real-person videos raise D09. |
| F08 | AI health coach | Baseline (voice) | This is the agent. Text chat Next; video avatar Cut. |
| F09 | Catch-up rebalancing | Baseline | Core agentic behaviour. |
| F10 | Reports | Next release | Weekly summary for user or family. |
| F11 | Wearables | Later | Cost and integration; phone steps suffice. |
| F12 | Tiers | Next release | One free + one paid plan; three tiers Cut. |
| F13 | Free consultation | Later | Needs clinicians; cost and liability. |
| F14 | Local groups | Later | Helps loneliness but needs partners. |
| F15 | Hospital connection | Cut | Medical and legal liability; replaced by NEW-3. |
| F16 | Caretaker or nurse | Later | Service partnership, not software. |
| F17 | Guardian access | Next release | Consent-based; may drive payment. |
| F18 | Friends competition | Cut | Poor fit; exposes private data. |
| NEW-1 | Large-text, voice-first mode | Baseline | Accessibility. |
| NEW-2 | Red-flag handoff to a doctor | Baseline | Sets the safety boundary. |
| NEW-3 | One-tap call to emergency contact | Next release | Safe substitute for F15. |

## Concerns D01-D11
| Concern | Effect | Note |
|---|---|---|
| D01 Prioritisation | Reduces | One user gives a ranking basis. |
| D02 Too many features | Reduces | 18 down to about 6 in Baseline. |
| D03 No target age | Removes | |
| D04 Cost | Reduces | Fewer features; voice and vision inference remain the main cost (estimate). |
| D05 Wearables | Removes for v1 | Deferred. |
| D06 Accuracy | Unchanged | Stakes may be higher; use ranges. |
| D07 Privacy | Unchanged | Collect less. |
| D08 Connectivity | Unchanged | Possibly worse; queue logs offline. |
| D09 Likeness | Removes | If avatars and real-person videos are cut. |
| D10 Scalability | Reduces | Defer until retention is proven. |
| D11 Regional food | Unchanged | Possibly worse; confirmation step and regional test set. |

## Research plan (H1-H4)
| Hypothesis | Confirmed if | Refuted if | Method |
|---|---|---|---|
| H1 Too complex | Reviews cite confusion; onboarding drop-off; 60+ testers can't log a meal unaided | Users finish setup and leave for other reasons | Review mining, 5-task usability test |
| H2 Too expensive | Reviews cite price or paywalls; interviewees say not worth it | Price rarely mentioned; paying users churn anyway | Review mining, willingness-to-pay questions |
| H3 Too many ads | Ads common in 1-2 star reviews; named as a reason to quit | Rarely cited; ad-free tiers churn equally | Review mining, interviews |
| H4 AI too wordy | Testers prefer or understand the short version | They prefer the long version | A/B of short vs long answers on own prototype |

**Plan (about 3 weeks, small samples, estimate):**
1. Week 1: tag about 200-300 reviews across 3-5 competing apps by theme and star rating.
2. Weeks 1-2: interview 8-10 people over 60 and 4-5 adult children.
3. Weeks 2-3: concierge pilot with 5 users for 2 weeks (a team member plays the agent); measure day-7 and day-14 use.

## Proactive or chatbot?
- **60+:** proactive within limits. Acts alone on low-stakes things (reminders, daily check-in, re-planning, weekly summary); asks first for anything involving other people, money or health claims; caps nudges (for example 2-3 a day, assumption) and respects quiet hours.
- **Under-25s:** on-demand chatbot with opt-in nudges (notification fatigue, wants control; assumption).

## Where AI does the work
Unstructured input to structured logs and profiles; building and re-planning; narrative summaries; deciding when to nudge. Not diagnosis, medication or emergencies.

- **F01:** Recognise dish, estimate portion range, log automatically; ask one yes/no only when unsure; voice corrections; show fluid, protein, fibre and a calorie range.
- **F02:** 5-minute voice conversation extracts a structured profile, reads it back, flags items for a doctor; voice recording not stored (design choice).
- **F05:** Weekly narrative with one focus and an adjusted target; no chart dashboard; no fasting or supplements.
- **F09:** On a missed log or bad day, re-plan the rest of today or the next two days, tell the user in one sentence, ask only for big changes, never compound a miss (assumption: clinician-set safety floor).

## Risk flags
| Feature | Raises | Decision |
|---|---|---|
| F01 | D06, D07, D11 | Keep with ranges, confirmation, regional test set. |
| F02 | D07 | Keep with minimal data; cut reference images. |
| F04 / F05 | D06 | Keep; cut supplements and fasting. |
| F07 / F08 | D09, D06 | Cut video avatars and real-person videos; keep voice. |
| F09 | D06 | Keep with safety caps. |
| F10 | D07 | Keep summary; defer blood-report upload pending legal and clinical review. |
| F11 | D06, D07 | Defer. |
| F15 / F16 | D07 | Cut F15; defer F16. |
| F17 | D07 | Next release, consent-based. |
| F18 | D07 | Cut. |

## Open questions for the next session
1. Who is the buyer (the person over 60 or their adult child), and which region and cuisine do we test against?
2. What is the safety boundary: wellness or medical? Do we have a dietitian or doctor to review plans, and which conditions do we gate?
3. Can we recruit 8-10 people over 60 and 4-5 family members in two weeks, and what single measurable result in the pilot shows the agent works?

---

# Update: team answers (buyer 15-60, wellness with dietitian, 10 pilot users)

The 60+ recommendation above no longer applies. The buyer base is teenagers to age 60. Assumptions are marked.

## Direction
- **Launch wedge: adults 30-60** (assumption: they can pay and churn less than teens). Teens 15-17 are a second segment, added with parent consent and a guardian view.
- 15-60 is still broad (faculty flagged "no defined target"). Confirm the wedge before building.
- **Wellness only, not medical.** A dietitian reviews the guardrails and plan templates.

## Triage changes
| # | Was | Now | Reason |
|---|---|---|---|
| F04 | Baseline | Baseline, 18+ only for any deficit | Under-18s get balanced-eating plans, no calorie deficit (eating-disorder and growth risk). Dietitian signs off the rules. |
| F07 | Later | Next release | Habit challenges (steps, water, meals) suit younger users; no real-person videos. |
| F08 | Baseline (voice) | Baseline (text chat + photo); voice Next | Voice-first was an older-user need. |
| F11 | Later | Next release | Via Apple Health / Google Fit only; no custom integrations. |
| F13 | Later | Next release | Dietitian now available; the cost cap is dietitian hours. |
| F17 | Next | Baseline for under-18 accounts | Parental consent and visibility required. |
| F18 | Cut | Later (teens, opt-in) | Compete on habits and steps, never weight or calories. |
| NEW-1 | Baseline | Later | Large-text mode is no longer central. |
| NEW-4 | n/a | Baseline | Dietitian-reviewed guardrails and red-flag rules (replaces ad hoc safety rules). |

Unchanged: F01-F03, F05 (fasting and supplements still Cut), F09, F10, F12 (one free + one paid plan; parent pays for teens, assumption), F14, F15 Cut, F16 Later.

## Concern changes
- D03: mostly returns (range is wide); fixed only by choosing the wedge.
- D04: cost rises (more segments; dietitian time).
- D05: returns as Next release.
- D07: higher (minors' data, parental consent, local law to check).
- D09, D06, D11: unchanged.

## Proactive or chatbot?
- **Adults 30-60:** chatbot-first with opt-in, light proactive nudges (meal and water reminders, re-planning after a missed day).
- **Teens:** on-demand chatbot; no weight-focused nudges; guardian can see progress.

## Pilot (10 users, yes)
Estimate split: 6 adults 30-60, 4 teens 15-17 with parent consent. Same concierge format as before (a team member plays the agent for 2 weeks).

## Open questions
1. Which wedge do we launch with: adults 30-60, or teens first? Who pays for teens?
2. Region and cuisine for the food-recognition test set (D11).
3. How many dietitian hours are available, and what rules do they sign off (e.g. no deficit under 18, calorie floors)?
