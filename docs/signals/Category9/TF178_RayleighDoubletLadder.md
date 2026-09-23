# Rayleigh Doublet Ladder


## Overview

Six equal-width Gaussian doublets have progressively smaller separations. The sequence passes from clearly resolved pairs to nearly merged peaks, creating a direct resolution diagnostic for smoothing and denoising methods.

## Mathematical Definition

Let

$$
c=(0.10,0.25,0.40,0.55,0.70,0.85),
$$

$$
d=(0.060,0.045,0.032,0.024,0.018,0.012),
\qquad w=0.010.
$$

Then

$$
f(x)=\sum_{k=1}^{6}\left[
e^{-\frac12((x-c_k+d_k/2)/w)^2}
+e^{-\frac12((x-c_k-d_k/2)/w)^2}
\right].
$$

[Rayleigh Doublet Ladder](../../assets/images/TF178_RayleighDoubletLadder.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Controlled resolution ladder |
| Signal type | Six Gaussian doublets |
| Controlled variable | Within-pair separation |
| Constant property | Peak width $w=0.010$ |
| Main challenge | Resolve close pairs without creating false splitting |

## Parameters

| Pair center | Separation |
|---:|---:|
| $0.10$ | $0.060$ |
| $0.25$ | $0.045$ |
| $0.40$ | $0.032$ |
| $0.55$ | $0.024$ |
| $0.70$ | $0.018$ |
| $0.85$ | $0.012$ |

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
