# PulsarProfile


## Overview

The **PulsarProfile** signal combines a small precursor, a narrow principal pulse, a broader component and asymmetric tail, and a weaker interpulse separated in phase.

## Mathematical Definition

## Mathematical Definition

Define the Gaussian pulse profile

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the sparse Gaussian pulse component

```math
P(x)=\sum_{k=1}^{K}a_k g(x;c_k,w_k).
```

Define the asymmetric tail, for $x\geq c_T$, as

```math
T(x)=A_Te^{-\alpha_T(x-c_T)},
```

with $T(x)=0$ for $x<c_T$.

The signal is

```math
f(x)=b_0+P(x)+T(x).
```

The pulse centers, amplitudes, and widths are

```math
\mathbf{c}=(0.18,\,0.31,\,0.345,\,0.72),
```

```math
\mathbf{a}=(0.14,\,1.00,\,0.34,\,0.42),
```

```math
\mathbf{w}=(0.010,\,0.014,\,0.027,\,0.020).
```


[View PulsarProfile signal](../../assets/images/TF082_PulsarProfile.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Sparse unequal pulse components |
| Principal pulse | Narrow peak near $x=c_2$ |
| Secondary features | Precursor, broader adjacent component, asymmetric tail, and interpulse |
| Interpulse | Centered near $x=c_4$ |
| Main challenge | Preserving both sharp and weak pulse structure |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.015 |
| $K$ | Number of Gaussian pulse components | 4 |
| $\mathbf{c}$ | Pulse centers | As specified |
| $\mathbf{a}$ | Pulse amplitudes | As specified |
| $\mathbf{w}$ | Pulse widths | As specified |
| $c_T$ | Tail onset location | 0.31 |
| $A_T$ | Tail amplitude | 0.16 |
| $\alpha_T$ | Tail decay rate | 20 |

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
