# SymmetryBreak


## Overview

The **SymmetryBreak** stress test is dominated by a nearly symmetric broad peak and cosine component, with a small localized perturbation that breaks the symmetry.

## Mathematical Definition

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the broad symmetric peak

```math
P(x)=
A_P g(x;c_S,w_P).
```

Define the symmetric oscillatory component

```math
O(x)=
A_O\cos\left[2\pi f_O(x-c_S)\right].
```

Define the localized symmetry-breaking perturbation

```math
B(x)=
A_B g(x;c_B,w_B).
```

The signal is

```math
f(x)=P(x)+O(x)+B(x).
```

[View SymmetryBreak signal](../../assets/images/TF153_SymmetryBreak.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Near symmetry with weak localized asymmetry |
| Symmetry center | Broad peak and cosine component are symmetric about $c_S$ |
| Broad structure | Dominant Gaussian peak centered at $c_S$ |
| Oscillation | Symmetric cosine component with frequency $f_O$ |
| Breaking feature | Small localized peak centered at $c_B$ |
| Main challenge | Avoiding false restoration of symmetry by over-regularization |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_P$ | Broad symmetric-peak amplitude | 0.58 |
| $c_S$ | Symmetry center | 0.50 |
| $w_P$ | Broad-peak width | 0.18 |
| $A_O$ | Cosine amplitude | 0.15 |
| $f_O$ | Cosine frequency | 4 |
| $A_B$ | Symmetry-breaking amplitude | 0.055 |
| $c_B$ | Symmetry-breaking center | 0.635 |
| $w_B$ | Symmetry-breaking width | 0.009 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF153_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF153_python.md)



## Recommended Uses

- Weak-asymmetry preservation
- Oversmoothing detection
- Shape-sensitive evaluation

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: FalseFlat](TF152_FalseFlat.md) | [Category 8 Catalog](index.md) | [Next: CompressionStorm →](TF154_CompressionStorm.md)
