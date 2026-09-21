# WearableGaitIMU


## Overview

The **WearableGaitIMU** signal combines slowly changing gait cadence, a harmonic waveform, eight heel-strike-like impulses, and a localized stumble with gradual recovery.

## Mathematical Definition

Let $\phi(x)=2\pi(7x+1.8x^2)$ and $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
\begin{aligned}
f(x)={}&0.34\sin\phi(x)+0.11\sin[2\phi(x)+0.4]
+0.20\sum_{c\in\mathcal C}g(x;c,0.006)\\
&-0.38g(x;0.64,0.018)+0.20g(x;0.685,0.030),
\end{aligned}
$$

where $\mathcal C=(0.11,0.23,0.35,0.47,0.60,0.72,0.84,0.95)$.

[WearableGaitIMU signal](../../assets/images/TF130_WearableGaitIMU.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Quasiperiodic waveform, impulses, and localized disruption |
| Heel strikes | Eight narrow positive events |
| Stumble/recovery | Negative event near 0.64, broad rebound near 0.685 |
| Main challenge | Retaining rhythm and sharp events through a transient disturbance |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $1.8$ | Cadence-change coefficient | 1.8 |
| $0.006$ | Heel-strike width | 0.006 |
| $-0.38$ | Stumble amplitude | -0.38 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0130_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0130_python.md)



## Recommended Uses

- Wearable-IMU denoising
- Heel-strike preservation
- Gait-disruption detection

## Provenance

**Status:** Wearable-gait-IMU-inspired deterministic surrogate.

---

[← Previous: UltrasoundCrackEcho](TF129_UltrasoundCrackEcho.md) | [Category 8 Catalog](index.md) | [Next: EEGSeizureOnset →](TF131_EEGSeizureOnset.md)
