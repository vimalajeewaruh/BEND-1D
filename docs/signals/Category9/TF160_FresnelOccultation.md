# FresnelOccultation

## Overview

The **FresnelOccultation** signal contains a finite intensity depression with localized, physically meaningful Fresnel-like fringes at ingress and egress.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the finite occultation component

```math
O(x)=
-A_O
\left[
S(x;c_1,w_O)
-
S(x;c_2,w_O)
\right].
```

For $k=1,2$, let

```math
u_k=x-c_k.
```

Define the localized Fresnel-like fringe packets

```math
F_k(x)=
A_F s_k
\exp\left[
-\frac12\left(\frac{u_k}{w_F}\right)^2
\right]
\sin\left[
2\pi\left(f_Fu_k+\beta_Fu_k|u_k|\right)
\right].
```

The signal is

```math
f(x)=
b_0+O(x)+\sum_{k=1}^{K}F_k(x).
```

The fringe centers and signs are

```math
\mathbf{c}=(0.35,\,0.68),
```

```math
\mathbf{s}=(1,\,-1).
```

[View FresnelOccultation signal](../../assets/images/TF160_FresnelOccultation.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Finite occultation with boundary fringes |
| Occulted interval | Approximately $c_1$ to $c_2$ |
| Occultation depth | Intensity reduction controlled by $A_O$ |
| Edge structure | Oppositely signed chirped fringe packets centered at $c_1$ and $c_2$ |
| Fringe localization | Gaussian envelopes with common width $w_F$ |
| Fringe frequency | Nonlinear phase controlled by $f_F$ and $\beta_F$ |
| Main challenge | Distinguishing physical interference from artificial ringing |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline intensity level | 1 |
| $A_O$ | Occultation depth | 0.82 |
| $c_1$ | Ingress location | 0.35 |
| $c_2$ | Egress location | 0.68 |
| $w_O$ | Occultation-edge transition width | 0.004 |
| $K$ | Number of fringe packets | 2 |
| $\mathbf{s}$ | Fringe signs | $(1,\,-1)$ |
| $A_F$ | Fringe amplitude | 0.15 |
| $w_F$ | Fringe envelope width | 0.052 |
| $f_F$ | Linear fringe-phase frequency | 16 |
| $\beta_F$ | Nonlinear fringe-phase coefficient | 55 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF160_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF160_python.md)



## Recommended Uses

- Occultation-curve denoising
- Edge-associated fringe preservation
- Physical-versus-artificial ringing assessment

## Provenance

**Status:** Fresnel-occultation-inspired deterministic surrogate.

---

[← Previous: QuantumHallPlateaus](TF159_QuantumHallPlateaus.md) | [Category 9 Catalog](index.md) | [Next: CapnogramBreaths →](TF161_CapnogramBreaths.md)
