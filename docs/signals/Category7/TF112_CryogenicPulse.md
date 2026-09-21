# CryogenicPulse


## Overview

The **CryogenicPulse** signal combines a weak precursor, a sharp thermal-pulse onset with long decay, and a smaller delayed secondary pulse.

## Mathematical Definition

Let $u=(x-0.28)_+$ and $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
f(x)=0.95I(x\ge0.28)[1-e^{-170u}]e^{-7u}+0.08g(x;0.245,0.010)+0.18g(x;0.62,0.020).
$$

[CryogenicPulse signal](../../assets/images/TF112_CryogenicPulse.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Precursor, sharp onset, long decay, and secondary pulse |
| Main onset | $x=0.28$ |
| Weak structures | Precursor at 0.245 and secondary pulse at 0.62 |
| Main challenge | Preserving three components at substantially different scales |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $170$ | Main-pulse rise rate | 170 |
| $7$ | Main-pulse decay rate | 7 |
| $0.08,0.18$ | Auxiliary pulse amplitudes | As shown |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0112_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0112_python.md)



## Recommended Uses

- Cryogenic-detector denoising
- Weak-precursor recovery
- Long-tail preservation

## Provenance

**Status:** Cryogenic-detector-pulse-inspired deterministic surrogate.

---

[← Previous: ParticlePileup](TF111_ParticlePileup.md) | [Category 7 Catalog](index.md) | [Next: SpaceWeatherStorm →](TF113_SpaceWeatherStorm.md)
