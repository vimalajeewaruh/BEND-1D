# PeakOnPeak


## Overview

The **PeakOnPeak** stress test nests a broad peak, a shoulder, a narrower positive peak, and a very narrow negative notch.

## Mathematical Definition

Let $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
f(x)=0.75g(x;0.50,0.18)+0.26g(x;0.58,0.060)+0.22g(x;0.605,0.015)-0.10g(x;0.610,0.0035).
$$

[PeakOnPeak signal](../../assets/images/TF151_PeakOnPeak.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Hierarchically nested peaks and notch |
| Width hierarchy | 0.18, 0.060, 0.015, and 0.0035 |
| Finest feature | Negative notch near $x=0.610$ |
| Main challenge | Preserving small nested structure inside dominant features |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.75,0.26,0.22,-0.10$ | Component amplitudes | As shown |
| $0.18,0.060,0.015,0.0035$ | Component widths | As shown |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0151_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0151_python.md)




## Recommended Uses

- Nested-feature preservation
- Multiscale peak/notch resolution
- Oversmoothing detection

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: SmoothRoughSmooth](TF150_SmoothRoughSmooth.md) | [Category 8 Catalog](index.md) | [Next: FalseFlat →](TF152_FalseFlat.md)
