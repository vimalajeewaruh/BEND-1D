# MeltPoolInstability

## Overview

The **MeltPoolInstability** signal combines slowly varying thermal output, process oscillation, a sharp spatter-like excursion, and a later finite-duration operating-regime change.

## Mathematical Definition

Define the smooth step

```math
s(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the process drift

```math
D(x)=b_0+b_1x+b_2x^2.
```

Define the oscillatory component

```math
O(x)=(A_0+A_1x)
\sin\left[2\pi(f_0x+\beta x^2)\right].
```

Define the positive and negative spatter components

```math
P_1(x)=A_{P1}
\exp\left[
-\frac12\left(\frac{x-\mu_1}{s_1}\right)^2
\right],
```

```math
P_2(x)=-A_{P2}
\exp\left[
-\frac12\left(\frac{x-\mu_2}{s_2}\right)^2
\right].
```

Define the regime-interval component

```math
R(x)=A_R
\left[
s(x;c_1,w_1)-s(x;c_2,w_2)
\right].
```

The signal is

```math
f(x)=D(x)+O(x)+P_1(x)+P_2(x)+R(x).
```

[View MeltPoolInstability signal](../../assets/images/TF075_MeltPoolInstability.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Drift, oscillation, spatter, and regime interval |
| Spatter region | Near $x=\mu_1$ to $x=\mu_2$ |
| Regime interval | Approximately $c_1<x<c_2$ |
| Main challenge | Retaining brief instability within gradual process drift |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Drift intercept | 0.35 |
| $b_1$ | Linear drift coefficient | 0.28 |
| $b_2$ | Quadratic drift coefficient | -0.10 |
| $A_0$ | Initial oscillation amplitude | 0.025 |
| $A_1$ | Oscillation amplitude-growth coefficient | 0.035 |
| $f_0$ | Initial oscillation frequency | 8 |
| $\beta$ | Quadratic phase coefficient | 3 |
| $A_{P1}$ | Positive spatter magnitude | 0.52 |
| $\mu_1$ | Positive spatter center | 0.61 |
| $s_1$ | Positive spatter width | 0.010 |
| $A_{P2}$ | Negative spatter magnitude | 0.20 |
| $\mu_2$ | Negative spatter center | 0.635 |
| $s_2$ | Negative spatter width | 0.016 |
| $A_R$ | Regime-change magnitude | 0.12 |
| $c_1,c_2$ | Regime-interval boundaries | 0.72, 0.86 |
| $w_1,w_2$ | Regime-transition widths | 0.012, 0.018 |

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
