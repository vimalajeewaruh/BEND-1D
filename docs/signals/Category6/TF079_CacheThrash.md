# CacheThrash

## Overview

The **CacheThrash** signal has a stable workload outside a finite central interval and rapid nonlinear switching with weaker oscillation inside it.

## Mathematical Definition

Define the smooth step

```math
s(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the finite thrashing window

```math
W(x)=s(x;c_1,w)-s(x;c_2,w).
```

Define the background component

```math
B(x)=b_0+A_B\sin(2\pi f_Bx).
```

Define the rapid switching component

```math
T(x)=A_TW(x)
\tanh\left[
\kappa\sin(2\pi f_Tx)
\right].
```

Define the weaker within-regime oscillation

```math
O(x)=A_OW(x)\sin(2\pi f_Ox).
```

The signal is

```math
f(x)=B(x)+T(x)+O(x).
```

[View CacheThrash signal](../../assets/images/TF079_CacheThrash.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Finite switching regime |
| Thrashing window | Approximately $c_1<x<c_2$ |
| Internal structure | Rapid high/low switching plus weak oscillation |
| Main challenge | Locating regime boundaries while preserving fast internal behavior |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Background level | 0.28 |
| $A_B$ | Background oscillation amplitude | 0.035 |
| $f_B$ | Background oscillation frequency | 4 |
| $c_1,c_2$ | Thrashing-window boundaries | 0.34, 0.73 |
| $w$ | Thrashing-window transition width | 0.005 |
| $A_T$ | Switching amplitude | 0.24 |
| $\kappa$ | Switching sharpness | 5 |
| $f_T$ | Switching frequency | 22 |
| $A_O$ | Within-regime oscillation amplitude | 0.08 |
| $f_O$ | Within-regime oscillation frequency | 7 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF079_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF079_python.md)



## Recommended Uses

- Regime-switching denoising
- Cache-thrashing detection
- Fast-state preservation

## Provenance

**Status:** Computer-architecture-inspired deterministic surrogate.

---

[← Previous: LatencyIncident](TF078_LatencyIncident.md) | [Category 6 Catalog](index.md) | [Next: TrainingLossSchedule →](TF080_TrainingLossSchedule.md)
