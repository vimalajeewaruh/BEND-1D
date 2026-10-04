# PeakOnPeak


## Overview

The **PeakOnPeak** stress test nests a broad peak, a shoulder, a narrower positive peak, and a very narrow negative notch.

## Mathematical Definition

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the broad peak

```math
P_B(x)=
A_B g(x;c_B,w_B).
```

Define the shoulder

```math
P_S(x)=
A_S g(x;c_S,w_S).
```

Define the narrow positive peak

```math
P_N(x)=
A_N g(x;c_N,w_N).
```

Define the very narrow negative notch

```math
D(x)=
-A_D g(x;c_D,w_D).
```

The signal is

```math
f(x)=P_B(x)+P_S(x)+P_N(x)+D(x).
```

[View PeakOnPeak signal](../../assets/images/TF151_PeakOnPeak.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Hierarchically nested peaks and notch |
| Broad structure | Dominant peak centered at $c_B$ |
| Shoulder | Intermediate-scale feature centered at $c_S$ |
| Narrow peak | Positive feature centered at $c_N$ |
| Finest feature | Negative notch centered at $c_D$ |
| Width hierarchy | $w_B>w_S>w_N>w_D$ |
| Main challenge | Preserving small nested structure inside dominant features |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_B$ | Broad-peak amplitude | 0.75 |
| $c_B$ | Broad-peak center | 0.50 |
| $w_B$ | Broad-peak width | 0.18 |
| $A_S$ | Shoulder amplitude | 0.26 |
| $c_S$ | Shoulder center | 0.58 |
| $w_S$ | Shoulder width | 0.060 |
| $A_N$ | Narrow-peak amplitude | 0.22 |
| $c_N$ | Narrow-peak center | 0.605 |
| $w_N$ | Narrow-peak width | 0.015 |
| $A_D$ | Notch magnitude | 0.10 |
| $c_D$ | Notch center | 0.610 |
| $w_D$ | Notch width | 0.0035 |
## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF151_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF151_python.md)




## Recommended Uses

- Nested-feature preservation
- Multiscale peak/notch resolution
- Oversmoothing detection

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: SmoothRoughSmooth](TF150_SmoothRoughSmooth.md) | [Category 8 Catalog](index.md) | [Next: FalseFlat →](TF152_FalseFlat.md)
