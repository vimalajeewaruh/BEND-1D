# ParticlePileup


## Overview

The **ParticlePileup** signal contains six detector-like pulses with fast rise and slower decay. The events at 0.49 and 0.515 deliberately create a pulse-pile-up resolution problem.

## Mathematical Definition

For pulse centers $c_k$ and amplitudes $a_k$, let $u_k=(x-c_k)_+$. Then

$$
f(x)=\sum_{k=1}^{6}a_k I(x\ge c_k)[1-e^{-140u_k}]e^{-18u_k},
$$

where

$$
c=(0.14,0.30,0.49,0.515,0.72,0.88),\qquad
a=(0.35,0.58,0.85,0.70,0.50,0.27).
$$

[ParticlePileup signal](../../assets/images/TF111_ParticlePileup.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Overlapping asymmetric detector pulses |
| Rise and decay | Fast rise, slower decay |
| Pile-up pair | Centers at 0.49 and 0.515 |
| Main challenge | Resolving close arrivals without splitting isolated pulses |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $140$ | Pulse rise rate | 140 |
| $18$ | Pulse decay rate | 18 |
| $c_k,a_k$ | Arrival times and amplitudes | As above |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF111_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF111_python.md)



## Recommended Uses

- Detector-pulse denoising
- Pulse-pile-up resolution
- Unequal-event preservation

## Provenance

**Status:** High-energy-detector-pulse-inspired deterministic surrogate.

---

[← Previous: LithographyEdge](TF110_LithographyEdge.md) | [Category 7 Catalog](index.md) | [Next: CryogenicPulse →](TF112_CryogenicPulse.md)
