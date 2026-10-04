# SatelliteReactionWheel


## Overview

The **SatelliteReactionWheel** signal combines two slowly varying wheel harmonics, a localized high-frequency resonance crossing, and a narrow momentum-dump-like impulse.

## Mathematical Definition

Define the two wheel-harmonic phases

```math
\phi_1(x)=2\pi(f_1x+\beta_1x^2),
```

```math
\phi_2(x)=2\pi(f_2x+\beta_2x^2).
```

Define the persistent wheel-harmonic component

```math
W(x)=
A_1\sin\phi_1(x)
+
A_2\sin\left[\phi_2(x)+\delta_2\right].
```

Define the localized resonance packet

```math
R(x)=
A_R
\exp\left[
-\frac12\left(\frac{x-c_R}{w_R}\right)^2
\right]
\sin(2\pi f_Rx).
```

Define the momentum-dump-like impulse

```math
D(x)=
-A_D
\exp\left[
-\frac12\left(\frac{x-c_D}{w_D}\right)^2
\right].
```

The signal is

```math
f(x)=W(x)+R(x)+D(x).
```

[View SatelliteReactionWheel signal](../../assets/images/TF137_SatelliteReactionWheel.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Persistent harmonics, resonance packet, and sparse impulse |
| Wheel harmonics | Two slowly varying oscillations governed by $\phi_1(x)$ and $\phi_2(x)$ |
| Resonance | Localized high-frequency packet centered at $c_R$ |
| Momentum-dump-like event | Narrow negative impulse centered at $c_D$ |
| Main challenge | Preserving a sparse event within nonstationary vibration |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_1$ | First wheel-harmonic amplitude | 0.22 |
| $f_1$ | First nominal wheel-harmonic frequency | 18 |
| $\beta_1$ | First frequency-change coefficient | 3 |
| $A_2$ | Second wheel-harmonic amplitude | 0.14 |
| $f_2$ | Second nominal wheel-harmonic frequency | 31 |
| $\beta_2$ | Second frequency-change coefficient | -2 |
| $\delta_2$ | Second wheel-harmonic phase shift | 0.5 |
| $A_R$ | Resonance amplitude | 0.20 |
| $c_R$ | Resonance center | 0.58 |
| $w_R$ | Resonance width | 0.065 |
| $f_R$ | Resonance frequency | 54 |
| $A_D$ | Momentum-dump impulse magnitude | 0.32 |
| $c_D$ | Momentum-dump impulse center | 0.82 |
| $w_D$ | Momentum-dump impulse width | 0.008 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF137_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF137_python.md)



## Recommended Uses

- Spacecraft-vibration denoising
- Resonance-packet recovery
- Sparse-event preservation

## Provenance

**Status:** Satellite-reaction-wheel-inspired deterministic surrogate.

---

[← Previous: GridInverterOscillation](TF136_GridInverterOscillation.md) | [Category 8 Catalog](index.md) | [Next: MicrofluidicDropletTrain →](TF138_MicrofluidicDropletTrain.md)
