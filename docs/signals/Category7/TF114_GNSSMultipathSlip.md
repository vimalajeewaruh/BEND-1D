# GNSSMultipathSlip

## Overview

The **GNSSMultipathSlip** signal combines smooth multipath oscillations, a sharp positive cycle-slip-like transition, and a gradual post-slip reacquisition adjustment.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$. Then

$$
\begin{aligned}
f(x)={}&0.12\sin(10\pi x)+0.035\sin(34\pi x+0.4)+0.42S(x;0.57,0.003)\\
&-0.25I(x\ge0.57)[1-e^{-5(x-0.57)}].
\end{aligned}
$$

[GNSSMultipathSlip signal](../../assets/images/TF114_GNSSMultipathSlip.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Oscillatory background with sharp slip and reacquisition |
| Slip location | $x=0.57$ |
| Background | Two multipath-like oscillatory scales |
| Main challenge | Preserving the slip without phase distortion or artificial ringing |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.42$ | Cycle-slip magnitude | 0.42 |
| $0.003$ | Slip transition width | 0.003 |
| $5$ | Reacquisition rate | 5 |

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
