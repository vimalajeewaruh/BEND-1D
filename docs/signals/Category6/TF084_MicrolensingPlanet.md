# MicrolensingPlanet

## Overview

The **MicrolensingPlanet** signal places a weak, localized positive-negative planetary anomaly on a dominant, broad, smooth lensing curve.

## Mathematical Definition

Let $u=(x-0.52)/0.115$ and $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
f(x)=0.10+\frac{0.82}{\sqrt{1+u^2}}+0.095g(x;0.585,0.010)-0.035g(x;0.605,0.016).
$$

[MicrolensingPlanet signal](../../assets/images/TF084_MicrolensingPlanet.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Broad smooth peak with weak local anomaly |
| Dominant center | $x=0.52$ |
| Planetary feature | Positive-negative perturbation near 0.585–0.605 |
| Main challenge | Preserving scientifically meaningful local shape despite low global-error contribution |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.115$ | Broad-event scale | 0.115 |
| $0.095$ | Positive anomaly amplitude | 0.095 |
| $-0.035$ | Negative anomaly amplitude | -0.035 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF084_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF084_python.md)



## Recommended Uses

- Weak-anomaly preservation
- Broad-versus-local scale separation
- Feature-aware denoising evaluation

## Provenance

**Status:** Planetary-microlensing-inspired deterministic surrogate.

---

[← Previous: GravitationalWaveChirp](TF083_GravitationalWaveChirp.md) | [Category 6 Catalog](index.md) | [Next: SolarFlare →](TF085_SolarFlare.md)
