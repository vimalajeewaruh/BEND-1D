# FresnelOccultation

## Overview

The **FresnelOccultation** signal contains a finite intensity depression with localized, physically meaningful Fresnel-like fringes at ingress and egress.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$, $c_1=0.35$, $c_2=0.68$, and $s_1=1$, $s_2=-1$. Then

$$
\begin{aligned}
f(x)={}&1-0.82[S(x;0.35,0.004)-S(x;0.68,0.004)]\\
&+\sum_{k=1}^{2}0.15s_k e^{-\frac12((x-c_k)/0.052)^2}
\sin\{2\pi[16(x-c_k)+55(x-c_k)|x-c_k|]\}.
\end{aligned}
$$

[FresnelOccultation signal](../../assets/images/TF160_FresnelOccultation.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Finite occultation with boundary fringes |
| Occulted interval | Approximately 0.35–0.68 |
| Edge structure | Oppositely signed chirped fringe packets |
| Main challenge | Distinguishing physical interference from artificial ringing |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.82$ | Occultation depth | 0.82 |
| $0.052$ | Fringe envelope width | 0.052 |
| $55$ | Nonlinear fringe-phase coefficient | 55 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0160_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0160_python.md)



## Recommended Uses

- Occultation-curve denoising
- Edge-associated fringe preservation
- Physical-versus-artificial ringing assessment

## Provenance

**Status:** Fresnel-occultation-inspired deterministic surrogate.

---

[← Previous: QuantumHallPlateaus](TF159_QuantumHallPlateaus.md) | [Category 9 Catalog](index.md) | [Next: CapnogramBreaths →](TF161_CapnogramBreaths.md)
