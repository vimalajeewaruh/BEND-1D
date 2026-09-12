

# BearingFault

## Overview

The **BearingFault** signal models a localized rolling-element defect. Nearly periodic impacts occur when the damaged region enters the load zone, and each impact excites damped structural resonances on two frequency scales.

## Mathematical Definition

Let the base impact times be

$$
b_k=0.075+0.112(k-1),\qquad k=1,\ldots,9,
$$

and weakly modulate them as

$$
t_k=b_k+0.0045\sin\!\left(\frac{2\pi(k-1)}{5}\right).
$$

With $u_k=x-t_k$, define

$$
I_k(x)=0.65\exp\!\left[-\frac12\left(\frac{u_k}{0.0035}\right)^2\right]
$$

and

$$
R_k(x)=\mathbf{1}_{\{u_k\geq0\}}e^{-48u_k}
\left[\sin(116\pi u_k)+0.32\sin(206\pi u_k)\right].
$$

The signal is

$$
f(x)=\sum_{k=1}^{9}\left[I_k(x)+R_k(x)\right].
$$

[BearingFault signal](../../assets/images/TF035_BearingFault.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Nearly periodic impacts with damped resonances |
| Number of impacts | 9 |
| Timing | Weakly modulated from a regular grid |
| Ring-down frequencies | 58 and 103 cycles per unit interval |
| Main challenge | Preserving sharp impacts and weaker oscillatory tails |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.112$ | Base impact spacing | 0.112 |
| $0.0035$ | Impact width | 0.0035 |
| $48$ | Ring-down decay rate | 48 |

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

