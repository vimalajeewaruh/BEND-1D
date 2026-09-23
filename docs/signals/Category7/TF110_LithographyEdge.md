# LithographyEdge


## Overview

The **LithographyEdge** signal represents a nominal edge with low- and high-frequency roughness plus localized positive and negative bridge/pinch-like defects.

## Mathematical Definition

Let $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
f(x)=0.50+0.025\sin(14\pi x)+0.012\sin(86\pi x)+0.14g(x;0.39,0.010)-0.11g(x;0.69,0.008).
$$

[LithographyEdge signal](../../assets/images/TF110_LithographyEdge.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiscale roughness with localized defects |
| Roughness scales | 7 and 43 cycles |
| Defects | Positive near 0.39 and negative near 0.69 |
| Main challenge | Preserving small geometry defects within structured roughness |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.025,0.012$ | Roughness amplitudes | As shown |
| $0.14,-0.11$ | Defect amplitudes | As shown |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF110_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF110_python.md)


## Recommended Uses

- Edge-profile smoothing
- Multiscale roughness preservation
- Bridge/pinch defect detection

## Provenance

**Status:** Lithographic-edge-metrology-inspired deterministic surrogate.

---

[← Previous: SemiconductorMetrology](TF109_SemiconductorMetrology.md) | [Category 7 Catalog](index.md) | [Next: ParticlePileup →](TF111_ParticlePileup.md)
