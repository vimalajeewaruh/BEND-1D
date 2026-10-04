# Boundary / Interior Twins


## Overview

The **BoundaryInteriorTwins** signal contains three identical wave packets centered near the left boundary, in the interior, and near the right boundary. Any systematic difference among their estimates exposes boundary-extension artifacts or location-dependent smoothing.

## Mathematical Definition

Let the packet centers be

```math
\mathbf{c}
=
(0.025,\,0.500,\,0.975).
```

Define each localized wave packet by

```math
P_k(x)=
A
\exp\left[
-\frac12
\left(
\frac{x-c_k}{w}
\right)^2
\right]
\cos\left[
2\pi f(x-c_k)
\right],
\qquad
k=1,\ldots,K.
```

The signal is

```math
f(x)=
\sum_{k=1}^{K}P_k(x),
\qquad
0\leq x\leq1.
```

[View Boundary / Interior Twins](../../assets/images/TF177_BoundaryInteriorTwins.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Controlled boundary diagnostic |
| Signal type | $K$ identical localized wave packets |
| Local morphology | Gaussian-windowed cosine oscillations |
| Controlled variable | Distance from the domain boundary |
| Symmetry | Left, center, and right placements |
| Main challenge | Treating boundary and interior features consistently |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of wave packets | 3 |
| $\mathbf{c}$ | Packet centers | $(0.025,\,0.500,\,0.975)$ |
| $A$ | Common packet amplitude | 1 |
| $w$ | Gaussian envelope width | 0.013 |
| $f$ | Carrier frequency | 31 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF177_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF177_python.md)



## Recommended Uses

- Boundary-extension assessment
- Location-invariance checks
- Comparing periodic, symmetric, and zero-padding conventions

## Provenance

This is an artificial controlled diagnostic designed specifically to reveal boundary-handling effects.

[← Previous: Dyadic Phase Twins](TF176_DyadicPhaseTwins.md) · [Category 9 catalog](index.md) · [Next: Rayleigh Doublet Ladder →](TF178_RayleighDoubletLadder.md)
