# Boundary / Interior Twins


## Overview

Three identical wave packets are centered near the left boundary, in the interior, and near the right boundary. Any systematic difference among their estimates exposes boundary-extension artifacts or location-dependent smoothing.

## Mathematical Definition

With centers

$$
c=(0.025,0.500,0.975),
$$

the signal is

$$
f(x)=\sum_{k=1}^{3}
\exp\left[-\frac12\left(\frac{x-c_k}{0.013}\right)^2\right]
\cos\{2\pi31(x-c_k)\},
\qquad 0\le x\le1.
$$

[Boundary / Interior Twins](../../assets/images/TF177_BoundaryInteriorTwins.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Controlled boundary diagnostic |
| Signal type | Three identical localized wave packets |
| Controlled variable | Distance from the domain boundary |
| Symmetry | Left, center, and right placements |
| Main challenge | Treat boundary and interior features consistently |

## Parameters

| Parameter | Value |
|---|---|
| Centers | $0.025,0.500,0.975$ |
| Envelope width | $0.013$ |
| Carrier frequency | $31$ cycles/unit |

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
