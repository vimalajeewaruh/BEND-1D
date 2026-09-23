# SymmetryBreak


## Overview

The **SymmetryBreak** stress test is dominated by a nearly symmetric broad peak and cosine component, with a small localized perturbation that breaks the symmetry.

## Mathematical Definition

Let $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
f(x)=0.58g(x;0.50,0.18)+0.15\cos[8\pi(x-0.50)]+0.055g(x;0.635,0.009).
$$

[SymmetryBreak signal](../../assets/images/TF153_SymmetryBreak.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Near symmetry with weak localized asymmetry |
| Symmetry center | $x=0.50$ |
| Breaking feature | Peak near $x=0.635$ |
| Main challenge | Avoiding false restoration of symmetry by over-regularization |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.58$ | Broad symmetric-peak amplitude | 0.58 |
| $0.055$ | Symmetry-breaking amplitude | 0.055 |
| $0.009$ | Symmetry-breaking width | 0.009 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0153_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0153_python.md)



## Recommended Uses

- Weak-asymmetry preservation
- Oversmoothing detection
- Shape-sensitive evaluation

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: FalseFlat](TF152_FalseFlat.md) | [Category 8 Catalog](index.md) | [Next: CompressionStorm →](TF154_CompressionStorm.md)
