# SemiconductorMetrology

## Overview

The **SemiconductorMetrology** signal combines slow critical-dimension-like drift, periodic tool variation at two scales, a sharp recalibration shift, and a localized defect excursion.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
f(x)=0.62+0.11x+0.035\sin(18\pi x)+0.018\sin(62\pi x)-0.08S(x;0.58,0.004)+0.12g(x;0.76,0.010).
$$

[SemiconductorMetrology signal](../../assets/images/TF109_SemiconductorMetrology.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Drift, periodic variation, step, and local defect |
| Recalibration | Negative shift near $x=0.58$ |
| Defect excursion | Narrow positive peak near $x=0.76$ |
| Main challenge | Separating tool periodicity from true process changes |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $9,31$ | Periodic cycle counts | As shown |
| $-0.08$ | Recalibration magnitude | -0.08 |
| $0.010$ | Defect width | 0.010 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF109_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF109_python.md)



## Recommended Uses

- Manufacturing-process smoothing
- Recalibration-step detection
- Local-defect preservation

## Provenance

**Status:** Semiconductor-metrology-inspired deterministic surrogate.

---

[← Previous: SpatialTranscriptScan](TF108_SpatialTranscriptScan.md) | [Category 7 Catalog](index.md) | [Next: LithographyEdge →](TF110_LithographyEdge.md)
