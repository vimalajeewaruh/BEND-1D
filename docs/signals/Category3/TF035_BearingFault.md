

# BearingFault

## Overview

Let the base impact times be

```math
b_k=t_0+d(k-1),
\qquad k=1,\ldots,K.
```

Weakly modulate the impact times as

```math
t_k=
b_k+A_t\sin\left(\frac{2\pi(k-1)}{P}\right).
```

With $u_k=x-t_k$, define the impact component

```math
I_k(x)=
A_I\exp\left[
-\frac{1}{2}
\left(\frac{u_k}{s_I}\right)^2
\right].
```

Define the ring-down component

```math
R_k(x)=
I(u_k\geq0)e^{-\alpha u_k}
[\sin(\omega_1u_k)+A_2\sin(\omega_2u_k)],
```

where $I(\cdot)$ is the indicator function.

The signal is

```math
f(x)=
\sum_{k=1}^{K}
[I_k(x)+R_k(x)].
```

[View BearingFault signal](../../assets/images/TF035_BearingFault.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Nearly periodic impacts with damped resonances |
| Number of impacts | $K$ |
| Timing | Weakly modulated from a regular grid |
| Ring-down frequencies | Two distinct resonance frequencies |
| Main challenge | Preserving sharp impacts and weaker oscillatory tails |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $K$ | Number of impacts | 9 |
| $t_0$ | First base impact time | 0.075 |
| $d$ | Base impact spacing | 0.112 |
| $A_t$ | Timing-modulation amplitude | 0.0045 |
| $P$ | Timing-modulation period | 5 |
| $A_I$ | Impact amplitude | 0.65 |
| $s_I$ | Impact width | 0.0035 |
| $\alpha$ | Ring-down decay rate | 48 |
| $\omega_1$ | First resonance angular frequency | $116\pi$ |
| $A_2$ | Second resonance relative amplitude | 0.32 |
| $\omega_2$ | Second resonance angular frequency | $206\pi$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF035_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF035_python.md)


## Recommended Uses

- Repeated-impact detection
- Ring-down preservation
- Condition-monitoring denoising
- Slightly irregular impulse-train analysis

## Provenance

**Status:** Rolling-element-bearing-fault-inspired deterministic mechanical surrogate.

---

[← Previous: EMGRecruitment](TF034_EMGRecruitment.md) | [Category 3 Catalog](index.md) | [Next: GearDefect →](TF036_GearDefect.md)

