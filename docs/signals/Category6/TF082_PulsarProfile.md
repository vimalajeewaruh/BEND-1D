# PulsarProfile


## Overview

The **PulsarProfile** signal combines a small precursor, a narrow principal pulse, a broader component and asymmetric tail, and a weaker interpulse separated in phase.

## Mathematical Definition

Let $g(x;c,w)=e^{-((x-c)/w)^2/2}$. The signal is

$$
\begin{aligned}
f(x)={}&0.015+0.14g(x;0.18,0.010)+g(x;0.31,0.014)\\
&+0.34g(x;0.345,0.027)+0.42g(x;0.72,0.020)\\
&+0.16I(x\ge0.31)e^{-20(x-0.31)}.
\end{aligned}
$$

[PulsarProfile signal](../../assets/images/TF082_PulsarProfile.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Sparse unequal pulse components |
| Principal pulse | Narrow peak near $x=0.31$ |
| Secondary features | Precursor, asymmetric tail, and interpulse |
| Main challenge | Preserving both sharp and weak pulse structure |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.31$ | Principal-pulse phase | 0.31 |
| $20$ | Tail decay rate | 20 |
| $0.72$ | Interpulse phase | 0.72 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF082_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF082_python.md)



## Recommended Uses

- Folded-profile denoising
- Precursor and interpulse recovery
- Asymmetric-tail preservation

## Provenance

**Status:** Pulsar-profile-inspired deterministic surrogate.

---

[← Previous: ExoplanetTransitSpots](TF081_ExoplanetTransitSpots.md) | [Category 6 Catalog](index.md) | [Next: GravitationalWaveChirp →](TF083_GravitationalWaveChirp.md)
