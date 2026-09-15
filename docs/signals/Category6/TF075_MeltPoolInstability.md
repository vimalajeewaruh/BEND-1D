# MeltPoolInstability

## Overview

The **MeltPoolInstability** signal combines slowly varying thermal output, process oscillation, a sharp spatter-like excursion, and a later finite-duration operating-regime change.

## Mathematical Definition

Let $s(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$. Then

$$
\begin{aligned}
f(x)={}&0.35+0.28x-0.10x^2+(0.025+0.035x)\sin\{2\pi(8x+3x^2)\}\\
&+0.52e^{-\frac12((x-0.61)/0.010)^2}-0.20e^{-\frac12((x-0.635)/0.016)^2}\\
&+0.12[s(x;0.72,0.012)-s(x;0.86,0.018)].
\end{aligned}
$$

[MeltPoolInstability signal](../../assets/images/TF075_MeltPoolInstability.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Drift, oscillation, spatter, and regime interval |
| Spatter region | Near 0.61–0.635 |
| Regime interval | Approximately 0.72–0.86 |
| Main challenge | Retaining brief instability within gradual process drift |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.010,0.016$ | Spatter widths | As shown |
| $0.12$ | Regime-change magnitude | 0.12 |
| $8x+3x^2$ | Oscillatory phase scale | As shown |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF075_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF075_python.md)



## Recommended Uses

- Additive-manufacturing monitoring
- Spatter-event preservation
- Regime-change detection

## Provenance

**Status:** Melt-pool-monitoring-inspired deterministic manufacturing surrogate.

---

[← Previous: RadarMicroDoppler](TF074_RadarMicroDoppler.md) | [Category 6 Catalog](index.md) | [Next: FiberOTDR →](TF076_FiberOTDR.md)
