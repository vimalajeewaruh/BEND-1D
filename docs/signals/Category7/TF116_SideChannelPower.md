# SideChannelPower


## Overview

The **SideChannelPower** signal contains repeated damped computation-like transients and one intentionally weak localized perturbation near the fifth operation.

## Mathematical Definition

Let

$$
\mathcal C=(0.10,0.21,0.32,0.43,0.54,0.65,0.76,0.87).
$$

Then

$$
\begin{aligned}
f(x)={}&0.10+0.018\sin(6\pi x)\\
&+\sum_{c\in\mathcal C}0.24I(x\ge c)e^{-60(x-c)}\sin[2\pi\,75(x-c)]\\
&+0.055e^{-((x-0.54)/0.010)^2/2}.
\end{aligned}
$$

[SideChannelPower signal](../../assets/images/TF116_SideChannelPower.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Repeated damped computation transients |
| Repetition | Eight nominal operation times |
| Weak perturbation | Narrow positive feature near $x=0.54$ |
| Main challenge | Detecting a small operation-specific change in structured activity |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $60$ | Transient decay rate | 60 |
| $75$ | Transient cycle frequency | 75 |
| $0.055$ | Weak-perturbation amplitude | 0.055 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF116_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF116_python.md)



## Recommended Uses

- Side-channel-trace denoising
- Repeated-transient alignment
- Weak-perturbation detection

## Provenance

**Status:** Computation-power-side-channel-inspired deterministic surrogate.

---

[← Previous: HyperspectralMineral](TF115_HyperspectralMineral.md) | [Category 7 Catalog](index.md) | [Next: SecurityBeacon →](TF117_SecurityBeacon.md)
