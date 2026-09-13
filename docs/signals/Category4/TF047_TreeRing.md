# TreeRing


## Overview

The **TreeRing** signal represents annual ring-width variation. Multiscale oscillations mimic changing growth conditions, two narrow depressions represent drought episodes, and a local increase represents post-drought recovery.

## Mathematical Definition

Define the background growth pattern

$$
g(x)=0.75+0.12\sin(10\pi x+0.3)
+0.07\sin(26\pi x)+0.035\sin(62\pi x+0.7).
$$

The drought and recovery components are

$$
D_1(x)=0.42\exp\!\left[-\frac12\left(\frac{x-0.34}{0.055}\right)^2\right],
$$

$$
D_2(x)=0.30\exp\!\left[-\frac12\left(\frac{x-0.72}{0.035}\right)^2\right],
$$

$$
R(x)=0.14\exp\!\left[-\frac12\left(\frac{x-0.43}{0.025}\right)^2\right].
$$

Thus

$$
f(x)=g(x)-D_1(x)-D_2(x)+R(x).
$$

[TreeRing signal](../../assets/images/TF047_TreeRing.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiscale environmental variation with depressions |
| Drought centers | $x=0.34$ and $x=0.72$ |
| Recovery center | $x=0.43$ |
| Background scales | Frequencies 5, 13, and 31 |
| Main challenge | Preserving narrow environmental events within oscillatory growth |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.055$ | First drought width | 0.055 |
| $0.035$ | Second drought width | 0.035 |
| $0.025$ | Recovery width | 0.025 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF047_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF047_python.md)



## Recommended Uses

- Drought-event preservation
- Environmental trend denoising
- Multiscale oscillation recovery
- Local depression and rebound analysis

## Provenance

**Status:** Dendrochronology-inspired deterministic measurement surrogate.

---

[← Previous: PlateWear](TF046_PlateWear.md) | [Category 4 Catalog](index.md) | [Next: IceCore →](TF048_IceCore.md)

