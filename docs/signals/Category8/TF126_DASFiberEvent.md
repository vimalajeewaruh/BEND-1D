# DASFiberEvent


## Overview

The **DASFiberEvent** signal combines a weak background, localized chirped wave packet with gradual fading, and a smaller high-frequency secondary echo.

## Mathematical Definition

Let

$$
b(x)=0.035\sin(6\pi x)+0.015x,
$$

$$
p(x)=0.28e^{-((x-0.46)/0.075)^2/2}\sin[2\pi(18x+14x^2)],
$$

and

$$
e(x)=0.10e^{-((x-0.64)/0.025)^2/2}\sin(90\pi x).
$$

Then $f(x)=b(x)+(1-0.25x)p(x)+e(x)$.

[DASFiberEvent signal](../../assets/images/TF126_DASFiberEvent.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Localized chirp with fading and echo |
| Main packet | Centered near $x=0.46$ |
| Secondary echo | Centered near $x=0.64$ |
| Main challenge | Preserving changing local frequency in a low-amplitude record |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.075$ | Main-packet width | 0.075 |
| $14$ | Quadratic phase coefficient | 14 |
| $0.10$ | Echo amplitude | 0.10 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF126_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF126_python.md)



## Recommended Uses

- Distributed-acoustic-sensing denoising
- Localized-chirp preservation
- Weak-echo recovery

## Provenance

**Status:** Distributed-acoustic-sensing-inspired deterministic surrogate.

---

[Category 8 Catalog](index.md) | [Next: PhotoacousticAline →](TF127_PhotoacousticAline.md)
