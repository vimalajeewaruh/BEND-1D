# GearboxDefect

## Overview

The **GearboxDefect** signal contains persistent modulated vibration and recurring damped impacts that strengthen after the middle of the record.

## Mathematical Definition

Let

$$
C(x)=[1+0.28\sin(10\pi x-0.3)]
[0.32\sin(92\pi x)+0.12\sin(184\pi x+0.4)].
$$

For $c_k=0.12+0.105(k-1)$, $k=1,\ldots,9$, let $a_k=0.22+0.16\mathbf{1}_{\{c_k>0.5\}}$ and $u_k=(x-c_k)_+$. Then

$$
f(x)=C(x)+\sum_{k=1}^{9}a_k\mathbf{1}_{\{x\geq c_k\}}e^{-75u_k}\sin(250\pi u_k).
$$

[GearboxDefect signal](../../assets/images/TF072_GearboxDefect.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Modulated carrier with repeated impacts |
| Impact spacing | 0.105 |
| Change | Stronger impacts after $x=0.5$ |
| Main challenge | Retaining sparse impacts inside persistent vibration |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $46,92$ | Carrier frequencies | As shown |
| $125$ | Impact resonance frequency | 125 |
| $75$ | Impact decay rate | 75 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF072_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF072_python.md)



## Recommended Uses

- Gearbox condition monitoring
- Embedded-impact preservation
- Deterioration-change detection

## Provenance

**Status:** Gearbox-defect-inspired deterministic mechanical surrogate.

---

[← Previous: PowerGridFault](TF071_PowerGridFault.md) | [Category 6 Catalog](index.md) | [Next: LidarMultiEcho →](TF073_LidarMultiEcho.md)

