# RAD Method Mapping

Reviewed: 2026-10-07

This file maps the existing Statistics-R learning assets to the Risk-Adaptive Delegation research program. Existing course scripts remain course assets until a RAD-specific analysis is executed and recorded.

## Study 1: Core causal experiment

Candidate design:
- Action Risk × Time Criticality × Authority Policy
- Authority Policy: Autonomous / Notify / Approve / RAD
- optional boundary condition: Reversibility or Blast Radius

Candidate outcomes:
- response / decision latency
- unsafe action rate
- correct intervention / rejection
- rollback rate
- joint decision or operational performance

## Statistical mapping

| Research need | Candidate method |
|---|---|
| group mean differences | t-test / ANOVA |
| factorial treatment effects | two-way / factorial ANOVA or regression |
| binary unsafe action / intervention | logistic regression |
| count outcomes | Poisson / suitable count model after dispersion checks |
| repeated decisions | repeated-measures / mixed-effects extension when dependence exists |
| mediation / moderation | regression / SEM only after construct and measurement validation |
| robustness | bootstrap / permutation / sensitivity analysis |

## Required before analysis

- preregister or freeze hypotheses and primary outcomes;
- define treatment coding and exclusion rules;
- distinguish manipulation checks from outcomes;
- perform power/sample-size planning;
- record seed, environment, dataset hash, Git commit, and result path;
- do not interpret statistical significance as practical or causal importance without design support.

## Important measurement cautions

- Isolation Forest anomaly score is not calibrated predictive uncertainty.
- MTTR/system accuracy is not evidence of trust.
- Appropriate reliance requires behavior relative to AI correctness/quality, not trust score alone.
- Synthetic testbed results support simulation/PoC claims, not direct real-world effectiveness claims.
