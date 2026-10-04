# ParticlePileup


## Overview

The **ParticlePileup** signal contains six detector-like pulses with fast rise and slower decay. The events at 0.49 and 0.515 deliberately create a pulse-pile-up resolution problem.

## Mathematical Definition

Let the pulse centers and amplitudes be

```math
\mathbf{c}
=
(0.14,\,0.30,\,0.49,\,0.515,\,0.72,\,0.88),
```

```math
\mathbf{a}
=
(0.35,\,0.58,\,0.85,\,0.70,\,0.50,\,0.27).
```

For each pulse, define

```math
u_k=(x-c_k)_+.
```

For $x\geq c_k$, define the asymmetric detector pulse

```math
P_k(x)=
a_k
\left[
1-e^{-k_ru_k}
\right]
e^{-k_du_k},
```

with $P_k(x)=0$ for $x<c_k$.

The signal is

```math
f(x)=\sum_{k=1}^{K}P_k(x).
```

[View ParticlePileup signal](../../assets/images/TF111_ParticlePileup.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Overlapping asymmetric detector pulses |
| Rise and decay | Fast rise governed by $k_r$ and slower decay governed by $k_d$ |
| Pile-up pair | Pulses centered at $c_3=0.49$ and $c_4=0.515$ |
| Weak event | Final pulse at $c_6=0.88$ has the smallest amplitude |
| Main challenge | Resolving close arrivals without splitting isolated pulses |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of detector pulses | 6 |
| $\mathbf{c}$ | Pulse arrival locations | $(0.14,\,0.30,\,0.49,\,0.515,\,0.72,\,0.88)$ |
| $\mathbf{a}$ | Pulse amplitudes | $(0.35,\,0.58,\,0.85,\,0.70,\,0.50,\,0.27)$ |
| $k_r$ | Pulse rise rate | 140 |
| $k_d$ | Pulse decay rate | 18 |

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
