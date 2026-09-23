# GrandMishMash


## Overview

The **GrandMishMash** is a compact final examination of local adaptivity, combining smooth curvature, a cusp, finite plateau, jump, close peaks, notch, localized chirp, wave packet, near-cancellation, and terminal needle.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
\begin{aligned}
f(x)={}&0.12x+0.08\log(1+6x)+0.18\sqrt{|x-0.16|}\\
&+0.16[S(x;0.24,0.006)-S(x;0.36,0.006)]-0.18S(x;0.43,0.003)\\
&+0.26g(x;0.50,0.010)+0.21g(x;0.527,0.008)-0.13g(x;0.575,0.005)\\
&+0.13\sin[2\pi(8x+24x^2)][S(x;0.60,0.02)-S(x;0.78,0.02)]\\
&+0.16g(x;0.80,0.045)\sin(110\pi x)\\
&+0.28g(x;0.885,0.035)-0.26g(x;0.895,0.037)+0.09g(x;0.955,0.0028).
\end{aligned}
$$

[GrandMishMash signal](../../assets/images/TF155_GrandMishMash.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Comprehensive mixed-geometry stress test |
| Middle structure | Plateau, jump, doublet, notch, and localized chirp |
| Terminal structure | Wave packet, near-cancellation, and very narrow needle |
| Main challenge | Local adaptation across essentially incompatible geometries |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.24,0.36$ | Plateau boundaries | As shown |
| $0.50,0.527,0.575$ | Peak/notch centers | As shown |
| $0.0028$ | Terminal-needle width | 0.0028 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF155_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF155_python.md)




## Recommended Uses

- Comprehensive local-adaptivity testing
- Multiscale feature preservation
- Global-error limitation studies

## Provenance

**Status:** Deliberately artificial GrandMishMash stress test.

---

[← Previous: CompressionStorm](TF154_CompressionStorm.md) | [Category 8 Catalog](index.md) | Next: end of Category 8
