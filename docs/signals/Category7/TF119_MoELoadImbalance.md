# MoELoadImbalance


## Overview

The **MoELoadImbalance** signal begins near a balanced operating level, enters a sustained routing-imbalance interval, exhibits redistributive oscillation, and then recovers.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the balanced background

```math
B(x)=b_0+A_B\sin(2\pi f_Bx).
```

Define the finite routing-imbalance component

```math
L(x)=
A_L
\left[
S(x;c_{L1},w_{L1})-S(x;c_{L2},w_{L2})
\right].
```

Define the redistribution window

```math
W(x)=
S(x;c_{R1},w_R)-S(x;c_{R2},w_R).
```

Define the redistributive oscillation

```math
R(x)=
A_R\sin(2\pi f_Rx)W(x).
```

The signal is

```math
f(x)=B(x)+L(x)+R(x).
```

[View MoELoadImbalance signal](../../assets/images/TF119_MoELoadImbalance.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Finite level imbalance with internal oscillation |
| Background | Low-amplitude oscillation around balanced level $b_0$ |
| Imbalance interval | Approximately from $c_{L1}$ to $c_{L2}$ |
| Redistribution | Oscillation with frequency $f_R$ localized within the imbalance interval |
| Main challenge | Recovering both regime duration and internal routing dynamics |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Balanced operating level | 0.42 |
| $A_B$ | Background oscillation amplitude | 0.025 |
| $f_B$ | Background oscillation frequency | 4 |
| $A_L$ | Imbalance magnitude | 0.28 |
| $c_{L1}$ | Imbalance onset location | 0.38 |
| $w_{L1}$ | Imbalance onset width | 0.012 |
| $c_{L2}$ | Imbalance offset location | 0.70 |
| $w_{L2}$ | Imbalance offset width | 0.018 |
| $A_R$ | Redistribution amplitude | 0.08 |
| $f_R$ | Redistribution frequency | 12 |
| $c_{R1}$ | Redistribution onset location | 0.42 |
| $c_{R2}$ | Redistribution offset location | 0.68 |
| $w_R$ | Redistribution transition width | 0.015 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF119_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF119_python.md)



## Recommended Uses

- AI-infrastructure telemetry smoothing
- Routing-regime detection
- Internal-oscillation preservation

## Provenance

**Status:** Mixture-of-experts-load-routing-inspired deterministic surrogate.

---

[← Previous: GPUThermalThrottle](TF118_GPUThermalThrottle.md) | [Category 7 Catalog](index.md) | [Next: InferenceQueueCollapse →](TF120_InferenceQueueCollapse.md)
