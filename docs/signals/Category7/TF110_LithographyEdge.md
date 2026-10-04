# LithographyEdge


## Overview

The **LithographyEdge** signal represents a nominal edge with low- and high-frequency roughness plus localized positive and negative bridge/pinch-like defects.

## Mathematical Definition

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the nominal edge level

```math
B(x)=b_0.
```

Define the multiscale roughness component

```math
R(x)=
A_1\sin(2\pi f_1x)
+
A_2\sin(2\pi f_2x).
```

Define the positive localized defect

```math
D_1(x)=A_{D1}g(x;c_{D1},w_{D1}).
```

Define the negative localized defect

```math
D_2(x)=-A_{D2}g(x;c_{D2},w_{D2}).
```

The signal is

```math
f(x)=B(x)+R(x)+D_1(x)+D_2(x).
```

[View LithographyEdge signal](../../assets/images/TF110_LithographyEdge.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiscale roughness with localized defects |
| Roughness scales | Frequencies $f_1$ and $f_2$ |
| Positive defect | Localized near $c_{D1}$ |
| Negative defect | Localized near $c_{D2}$ |
| Main challenge | Preserving small geometry defects within structured roughness |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Nominal edge level | 0.50 |
| $A_1$ | Low-frequency roughness amplitude | 0.025 |
| $f_1$ | Low-frequency roughness frequency | 7 |
| $A_2$ | High-frequency roughness amplitude | 0.012 |
| $f_2$ | High-frequency roughness frequency | 43 |
| $A_{D1}$ | Positive-defect amplitude | 0.14 |
| $c_{D1}$ | Positive-defect center | 0.39 |
| $w_{D1}$ | Positive-defect width | 0.010 |
| $A_{D2}$ | Negative-defect magnitude | 0.11 |
| $c_{D2}$ | Negative-defect center | 0.69 |
| $w_{D2}$ | Negative-defect width | 0.008 |

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
