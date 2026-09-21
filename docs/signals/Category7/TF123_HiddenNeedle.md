# HiddenNeedle


## Overview

The **HiddenNeedle** signal embeds a very narrow low-amplitude peak and a small negative shoulder inside a dominant broad Gaussian feature.

## Mathematical Definition

Let $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
f(x)=0.80g(x;0.52,0.20)+0.085g(x;0.565,0.0035)-0.04g(x;0.61,0.016).
$$

[HiddenNeedle signal](../../assets/images/TF123_HiddenNeedle.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Weak narrow structure inside broad dominant feature |
| Dominant width | 0.20 |
| Needle width | 0.0035 |
| Main challenge | Global error can remain small even if the needle disappears |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.80$ | Broad-feature amplitude | 0.80 |
| $0.085$ | Needle amplitude | 0.085 |
| $-0.04$ | Shoulder amplitude | -0.04 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0123_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0123_python.md)



## Recommended Uses

- Oversmoothing detection
- Weak-needle preservation
- Feature-aware risk evaluation

## Provenance

**Status:** Deliberately artificial weak-feature stress test.

---

[← Previous: PeakForest](TF122_PeakForest.md) | [Category 7 Catalog](index.md) | [Next: NestedWavePackets →](TF124_NestedWavePackets.md)
