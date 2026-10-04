# FusionELMSawtooth

## Overview

The **FusionELMSawtooth** signal places repeated sawtooth ramps and seven narrow ELM-like bursts on a rising plasma-like baseline.

## Mathematical Definition

Define the sawtooth period and ramp function

```math
r(x)=\frac{x\bmod p}{p}.
```

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Let the ELM-like burst centers be

```math
\mathcal{C}
=
(0.18,\,0.30,\,0.42,\,0.54,\,0.66,\,0.78,\,0.90).
```

Define the rising baseline

```math
B(x)=b_0+mx.
```

Define the repeated sawtooth component

```math
R(x)=A_Rr(x).
```

Define the ELM-like burst component

```math
E(x)=
A_E
\sum_{c\in\mathcal{C}}
g(x;c,w_E).
```

The signal is

```math
f(x)=B(x)+R(x)+E(x).
```

[View FusionELMSawtooth signal](../../assets/images/TF103_FusionELMSawtooth.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Repetitive ramps with narrow energetic bursts |
| Baseline | Linearly increasing with slope $m$ |
| Sawtooth | Repeated ramps with period $p$ and amplitude $A_R$ |
| ELM-like bursts | Seven narrow events centered at $\mathcal{C}$ |
| Main challenge | Preserving narrow events without distorting repeated ramps |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.30 |
| $m$ | Baseline slope | 0.20 |
| $p$ | Sawtooth period | 0.105 |
| $A_R$ | Sawtooth amplitude | 0.18 |
| $\mathcal{C}$ | ELM-like burst centers | $(0.18,\,0.30,\,0.42,\,0.54,\,0.66,\,0.78,\,0.90)$ |
| $A_E$ | ELM-like burst amplitude | 0.28 |
| $w_E$ | ELM-like burst width | 0.005 |

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
