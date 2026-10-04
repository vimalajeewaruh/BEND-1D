# Rayleigh Doublet Ladder


## Overview

The **RayleighDoubletLadder** signal contains six equal-width Gaussian doublets with progressively smaller separations. The sequence passes from clearly resolved pairs to nearly merged peaks, creating a direct resolution diagnostic for smoothing and denoising methods.

## Mathematical Definition

Let the doublet centers be

```math
\mathbf{c}
=
(0.10,\,0.25,\,0.40,\,0.55,\,0.70,\,0.85),
```

with corresponding within-pair separations

```math
\mathbf{d}
=
(0.060,\,0.045,\,0.032,\,0.024,\,0.018,\,0.012).
```

For each doublet, define the two peak locations by

```math
c_k^- = c_k-\frac{d_k}{2},
\qquad
c_k^+ = c_k+\frac{d_k}{2}.
```

Define the $k$th Gaussian doublet by

```math
D_k(x)=
A\exp\left[
-\frac12
\left(
\frac{x-c_k^-}{w}
\right)^2
\right]
+
A\exp\left[
-\frac12
\left(
\frac{x-c_k^+}{w}
\right)^2
\right].
```

The signal is

```math
f(x)=
\sum_{k=1}^{K}D_k(x),
\qquad
0\leq x\leq1.
```

[View Rayleigh Doublet Ladder](../../assets/images/TF178_RayleighDoubletLadder.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Controlled resolution ladder |
| Signal type | $K$ Gaussian doublets |
| Controlled variable | Within-pair separation $d_k$ |
| Constant property | Common peak width $w$ |
| Resolution pattern | Progresses from clearly separated to nearly merged peaks |
| Main challenge | Resolving close pairs without creating false splitting |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of Gaussian doublets | 6 |
| $\mathbf{c}$ | Doublet centers | $(0.10,\,0.25,\,0.40,\,0.55,\,0.70,\,0.85)$ |
| $\mathbf{d}$ | Within-pair separations | $(0.060,\,0.045,\,0.032,\,0.024,\,0.018,\,0.012)$ |
| $A$ | Common peak amplitude | 1 |
| $w$ | Common Gaussian peak width | 0.010 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF178_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF178_python.md)



## Recommended Uses

- Empirical peak-resolution limits
- Bandwidth and threshold selection studies
- Detecting artificial peak merging or splitting

## Provenance

This is an artificial diagnostic named for the general idea of a resolution ladder; it does not impose a particular optical Rayleigh criterion.

[← Previous: Boundary / Interior Twins](TF177_BoundaryInteriorTwins.md) · [Category 9 catalog](index.md) · [Next: Equal-Energy Scale Ladder →](TF179_EqualEnergyScaleLadder.md)
