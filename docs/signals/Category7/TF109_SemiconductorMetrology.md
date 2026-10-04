# SemiconductorMetrology

## Overview

The **SemiconductorMetrology** signal combines slow critical-dimension-like drift, periodic tool variation at two scales, a sharp recalibration shift, and a localized defect excursion.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the slow process trend

```math
B(x)=b_0+mx.
```

Define the periodic tool variation

```math
P(x)=
A_1\sin(2\pi f_1x)
+
A_2\sin(2\pi f_2x).
```

Define the recalibration shift

```math
R(x)=-A_R S(x;c_R,w_R).
```

Define the localized defect excursion

```math
D(x)=A_Dg(x;c_D,w_D).
```

The signal is

```math
f(x)=B(x)+P(x)+R(x)+D(x).
```

[View SemiconductorMetrology signal](../../assets/images/TF109_SemiconductorMetrology.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Drift, periodic variation, step, and local defect |
| Background | Linear drift with periodic variation at frequencies $f_1$ and $f_2$ |
| Recalibration | Negative shift near $c_R$ |
| Defect excursion | Narrow positive peak centered at $c_D$ |
| Main challenge | Separating tool periodicity from true process changes |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.62 |
| $m$ | Drift coefficient | 0.11 |
| $A_1$ | First periodic-component amplitude | 0.035 |
| $f_1$ | First periodic-component frequency | 9 |
| $A_2$ | Second periodic-component amplitude | 0.018 |
| $f_2$ | Second periodic-component frequency | 31 |
| $A_R$ | Recalibration-shift magnitude | 0.08 |
| $c_R$ | Recalibration location | 0.58 |
| $w_R$ | Recalibration transition width | 0.004 |
| $A_D$ | Defect-excursion amplitude | 0.12 |
| $c_D$ | Defect-excursion center | 0.76 |
| $w_D$ | Defect-excursion width | 0.010 |

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
