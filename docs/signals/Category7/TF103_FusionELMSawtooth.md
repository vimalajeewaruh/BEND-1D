# FusionELMSawtooth

## Overview

The **FusionELMSawtooth** signal places repeated sawtooth ramps and seven narrow ELM-like bursts on a rising plasma-like baseline.

## Mathematical Definition

Let $p=0.105$, $r(x)=(x\bmod p)/p$, $g(x;c,w)=e^{-((x-c)/w)^2/2}$, and

$$
\mathcal C=(0.18,0.30,0.42,0.54,0.66,0.78,0.90).
$$

Then

$$
f(x)=0.30+0.20x+0.18r(x)+0.28\sum_{c\in\mathcal C}g(x;c,0.005).
$$

[FusionELMSawtooth signal](../../assets/images/TF103_FusionELMSawtooth.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Repetitive ramps with narrow energetic bursts |
| Sawtooth period | 0.105 |
| Burst width | 0.005 |
| Main challenge | Preserving narrow events without distorting repeated ramps |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $p$ | Sawtooth period | 0.105 |
| $0.18$ | Sawtooth amplitude | 0.18 |
| $0.28$ | ELM-like burst amplitude | 0.28 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF103_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF103_python.md)



## Recommended Uses

- Fusion-diagnostic denoising
- Sawtooth preservation
- Narrow-burst recovery

## Provenance

**Status:** Fusion-plasma-morphology-inspired deterministic surrogate.

---

[← Previous: QuantumLeakageBurst](TF102_QuantumLeakageBurst.md) | [Category 7 Catalog](index.md) | [Next: TokamakDisruption →](TF104_TokamakDisruption.md)
