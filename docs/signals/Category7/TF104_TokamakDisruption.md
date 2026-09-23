# TokamakDisruption


## Overview

The **TokamakDisruption** signal contains a growing chirped oscillation, a slower locking-like component that emerges before failure, and an abrupt disruption collapse.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$. Then

$$
\begin{aligned}
f(x)={}&0.55+(0.04+0.30x)\sin[2\pi(8x+10x^2)]\\
&+0.16\sin(5\pi x)S(x;0.58,0.02)-0.95S(x;0.79,0.006).
\end{aligned}
$$

[TokamakDisruption signal](../../assets/images/TF104_TokamakDisruption.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Growing precursor and abrupt collapse |
| Locking component | Emerges near $x=0.58$ |
| Disruption | Sharp negative transition near $x=0.79$ |
| Main challenge | Retaining weak precursor structure before the dominant event |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.30$ | Oscillation-amplitude growth coefficient | 0.30 |
| $0.58$ | Locking-component onset | 0.58 |
| $-0.95$ | Collapse magnitude | -0.95 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF104_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF104_python.md)


## Recommended Uses

- Precursor-preserving denoising
- Abrupt-collapse localization
- Nonstationary oscillation recovery

## Provenance

**Status:** Tokamak-disruption-inspired deterministic fusion surrogate.

---

[← Previous: FusionELMSawtooth](TF103_FusionELMSawtooth.md) | [Category 7 Catalog](index.md) | [Next: CalciumTransientTrain →](TF105_CalciumTransientTrain.md)
