# GridInverterOscillation


## Overview

The **GridInverterOscillation** signal combines a load disturbance, decaying oscillation with changing instantaneous frequency, and later controller intervention.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $u=(x-0.30)_+$. Then

$$
\begin{aligned}
f(x)={}&0.30+0.02x+0.16S(x;0.30,0.006)\\
&+0.34I(x\ge0.30)e^{-5u}\sin[2\pi(10u+4u^2)]\\
&-0.10S(x;0.64,0.010).
\end{aligned}
$$

[GridInverterOscillation signal](../../assets/images/TF136_GridInverterOscillation.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Load step, decaying chirp, and controller intervention |
| Disturbance | Near $x=0.30$ |
| Intervention | Negative transition near $x=0.64$ |
| Main challenge | Preserving transient phase and the later control change |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $5$ | Oscillation decay rate | 5 |
| $4$ | Quadratic phase coefficient | 4 |
| $-0.10$ | Controller-shift magnitude | -0.10 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0136_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0136_python.md)


## Recommended Uses

- Grid-inverter telemetry denoising
- Phase-preserving transient recovery
- Controller-intervention localization

## Provenance

**Status:** Grid-inverter-disturbance-inspired deterministic surrogate.

---

[← Previous: EVFastCharge](TF135_EVFastCharge.md) | [Category 8 Catalog](index.md) | [Next: SatelliteReactionWheel →](TF137_SatelliteReactionWheel.md)
