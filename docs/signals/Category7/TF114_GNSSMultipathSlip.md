# GNSSMultipathSlip

## Overview

The **GNSSMultipathSlip** signal combines smooth multipath oscillations, a sharp positive cycle-slip-like transition, and a gradual post-slip reacquisition adjustment.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the multipath background

```math
M(x)=
A_1\sin(2\pi f_1x)
+
A_2\sin(2\pi f_2x+\delta_2).
```

Define the cycle-slip component

```math
C(x)=A_C S(x;c_C,w_C).
```

For $x\geq c_C$, define the reacquisition adjustment as

```math
R(x)=
-A_R
\left[
1-e^{-k_R(x-c_C)}
\right],
```

with $R(x)=0$ for $x<c_C$.

The signal is

```math
f(x)=M(x)+C(x)+R(x).
```

[View GNSSMultipathSlip signal](../../assets/images/TF114_GNSSMultipathSlip.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Oscillatory background with sharp slip and reacquisition |
| Background | Two multipath-like oscillatory components at frequencies $f_1$ and $f_2$ |
| Slip location | Centered at $c_C$ with transition width $w_C$ |
| Reacquisition | Gradual negative adjustment beginning at $c_C$ |
| Main challenge | Preserving the slip without phase distortion or artificial ringing |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_1$ | First multipath-component amplitude | 0.12 |
| $f_1$ | First multipath-component frequency | 5 |
| $A_2$ | Second multipath-component amplitude | 0.035 |
| $f_2$ | Second multipath-component frequency | 17 |
| $\delta_2$ | Second multipath-component phase shift | 0.4 |
| $A_C$ | Cycle-slip magnitude | 0.42 |
| $c_C$ | Cycle-slip location | 0.57 |
| $w_C$ | Cycle-slip transition width | 0.003 |
| $A_R$ | Reacquisition-adjustment magnitude | 0.25 |
| $k_R$ | Reacquisition rate | 5 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF114_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF114_python.md)



## Recommended Uses

- GNSS-series denoising
- Cycle-slip localization
- Oscillatory-background preservation

## Provenance

**Status:** GNSS-multipath-and-cycle-slip-inspired deterministic surrogate.

---

[← Previous: SpaceWeatherStorm](TF113_SpaceWeatherStorm.md) | [Category 7 Catalog](index.md) | [Next: HyperspectralMineral →](TF115_HyperspectralMineral.md)
