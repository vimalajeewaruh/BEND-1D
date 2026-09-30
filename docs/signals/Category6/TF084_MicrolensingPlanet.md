# MicrolensingPlanet

## Overview

The **MicrolensingPlanet** signal places a weak, localized positive-negative planetary anomaly on a dominant, broad, smooth lensing curve.

## Mathematical Definition

Define the normalized event coordinate

```math
u=\frac{x-c_0}{s_0},
```

and the Gaussian anomaly profile

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the broad microlensing event

```math
M(x)=b_0+\frac{A_M}{\sqrt{1+u^2}}.
```

Define the positive planetary anomaly

```math
P_1(x)=A_1g(x;c_1,w_1),
```

and the negative planetary anomaly

```math
P_2(x)=-A_2g(x;c_2,w_2).
```

The signal is

```math
f(x)=M(x)+P_1(x)+P_2(x).
```

[View MicrolensingPlanet signal](../../assets/images/TF084_MicrolensingPlanet.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Broad smooth peak with weak local anomaly |
| Dominant center | $x=c_0$ |
| Broad-event scale | $s_0$ |
| Planetary feature | Positive-negative perturbation near $c_1$–$c_2$ |
| Main challenge | Preserving scientifically meaningful local shape despite low global-error contribution |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.10 |
| $A_M$ | Broad-event amplitude | 0.82 |
| $c_0$ | Broad-event center | 0.52 |
| $s_0$ | Broad-event scale | 0.115 |
| $A_1$ | Positive anomaly amplitude | 0.095 |
| $c_1$ | Positive anomaly center | 0.585 |
| $w_1$ | Positive anomaly width | 0.010 |
| $A_2$ | Negative anomaly magnitude | 0.035 |
| $c_2$ | Negative anomaly center | 0.605 |
| $w_2$ | Negative anomaly width | 0.016 |

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
