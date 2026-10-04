# WearableGaitIMU


## Overview

The **WearableGaitIMU** signal combines slowly changing gait cadence, a harmonic waveform, eight heel-strike-like impulses, and a localized stumble with gradual recovery.

## Mathematical Definition

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the gait phase

```math
\phi(x)=2\pi(f_0x+\beta x^2).
```

Define the harmonic gait waveform

```math
G(x)=
A_1\sin\phi(x)
+
A_2\sin\left[2\phi(x)+\delta_2\right].
```

Define the heel-strike component

```math
H(x)=
A_H\sum_{k=1}^{K}g(x;c_k,w_H).
```

The heel-strike locations are

```math
\mathbf{c}
=
(0.11,\,0.23,\,0.35,\,0.47,\,0.60,\,0.72,\,0.84,\,0.95).
```

Define the stumble component

```math
S(x)=
-A_Sg(x;c_S,w_S).
```

Define the recovery component

```math
R(x)=
A_Rg(x;c_R,w_R).
```

The signal is

```math
f(x)=G(x)+H(x)+S(x)+R(x).
```

[View WearableGaitIMU signal](../../assets/images/TF130_WearableGaitIMU.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Quasiperiodic waveform, impulses, and localized disruption |
| Gait cadence | Gradually changes according to the quadratic phase coefficient $\beta$ |
| Heel strikes | $K$ narrow positive events at locations specified by $\mathbf{c}$ |
| Stumble | Negative localized event centered at $c_S$ |
| Recovery | Broader positive rebound centered at $c_R$ |
| Main challenge | Retaining rhythm and sharp events through a transient disturbance |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $f_0$ | Initial gait frequency | 7 |
| $\beta$ | Cadence-change coefficient | 1.8 |
| $A_1$ | Fundamental gait amplitude | 0.34 |
| $A_2$ | Second-harmonic amplitude | 0.11 |
| $\delta_2$ | Second-harmonic phase shift | 0.4 |
| $K$ | Number of heel-strike events | 8 |
| $\mathbf{c}$ | Heel-strike locations | $(0.11,\,0.23,\,0.35,\,0.47,\,0.60,\,0.72,\,0.84,\,0.95)$ |
| $A_H$ | Heel-strike amplitude | 0.20 |
| $w_H$ | Heel-strike width | 0.006 |
| $A_S$ | Stumble magnitude | 0.38 |
| $c_S$ | Stumble center | 0.64 |
| $w_S$ | Stumble width | 0.018 |
| $A_R$ | Recovery amplitude | 0.20 |
| $c_R$ | Recovery center | 0.685 |
| $w_R$ | Recovery width | 0.030 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF130_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF130_python.md)



## Recommended Uses

- Wearable-IMU denoising
- Heel-strike preservation
- Gait-disruption detection

## Provenance

**Status:** Wearable-gait-IMU-inspired deterministic surrogate.

---

[← Previous: UltrasoundCrackEcho](TF129_UltrasoundCrackEcho.md) | [Category 8 Catalog](index.md) | [Next: EEGSeizureOnset →](TF131_EEGSeizureOnset.md)
