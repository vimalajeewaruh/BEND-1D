# QuantumLeakageBurst


## Overview

The **QuantumLeakageBurst** signal combines a nearly stable low-amplitude readout, three leakage-like excursions, and a finite-duration level shift.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
\begin{aligned}
f(x)={}&0.08+0.02\sin(8\pi x)
+0.20\sum_{c\in\{0.24,0.47,0.71\}}g(x;c,0.020)\\
&+0.10[S(x;0.54,0.004)-S(x;0.64,0.006)].
\end{aligned}
$$

[QuantumLeakageBurst signal](../../assets/images/TF102_QuantumLeakageBurst.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Sparse excursions plus finite level shift |
| Leakage events | Near 0.24, 0.47, and 0.71 |
| Shift interval | Approximately 0.54–0.64 |
| Main challenge | Preserving small transients in a low-amplitude background |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.20$ | Leakage-burst amplitude | 0.20 |
| $0.020$ | Leakage-burst width | 0.020 |
| $0.10$ | Level-shift amplitude | 0.10 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0102_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0102_python.md)



## Recommended Uses

- Quantum-readout denoising
- Small-excursion recovery
- Short state-change preservation

## Provenance

**Status:** Quantum-leakage-monitoring-inspired deterministic surrogate.

---

[← Previous: QuantumRamseyDrift](TF101_QuantumRamseyDrift.md) | [Category 7 Catalog](index.md) | [Next: FusionELMSawtooth →](TF103_FusionELMSawtooth.md)
