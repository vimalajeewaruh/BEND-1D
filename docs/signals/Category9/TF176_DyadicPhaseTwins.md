# Dyadic Phase Twins


## Overview

The **DyadicPhaseTwins** signal contains four identical Gaussian-windowed cosine packets placed at deliberately selected sample indices. Because the local shapes are exact translations, differences in denoising quality reveal sensitivity to dyadic alignment, decimation phase, or location-dependent processing rather than to morphology.

## Mathematical Definition

Using $N$ equally spaced samples on $[0,1]$, define

```math
x_i=
\frac{i-1}{N-1},
\qquad
i=1,\ldots,N.
```

Let the one-based center indices be

```math
\mathbf{j}
=
(512,\,1409,\,2306,\,3203),
```

with corresponding locations

```math
c_k=
\frac{j_k-1}{N-1},
\qquad
k=1,\ldots,K.
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
\right].
```

The signal is

```math
f(x)=
\sum_{k=1}^{K}P_k(x).
```

[View Dyadic Phase Twins](../../assets/images/TF176_DyadicPhaseTwins.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Controlled translation diagnostic |
| Signal type | $K$ identical localized wave packets |
| Local morphology | Gaussian-windowed cosine oscillations |
| Controlled variable | Sample-grid and dyadic alignment |
| Native sampling | $N$ equally spaced samples |
| Main challenge | Producing translation-consistent estimates |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Required native sample count | 4096 |
| $K$ | Number of wave packets | 4 |
| $\mathbf{j}$ | One-based center indices | $(512,\,1409,\,2306,\,3203)$ |
| $c_k$ | Center location corresponding to $j_k$ | $(j_k-1)/(N-1)$ |
| $A$ | Common packet amplitude | 1 |
| $w$ | Gaussian envelope width | 0.014 |
| $f$ | Carrier frequency | 34 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF176_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF176_python.md)



## Recommended Uses

- Translation-invariance diagnostics
- Dyadic phase and decimation sensitivity
- Comparing cycle-spinning or undecimated procedures

## Provenance

This is a deliberately artificial controlled diagnostic. Its sample count and center indices are part of the definition and should not be changed when testing dyadic alignment.

[← Previous: Lorenz Wing Switch](TF175_LorenzWingSwitch.md) · [Category 9 catalog](index.md) · [Next: Boundary / Interior Twins →](TF177_BoundaryInteriorTwins.md)
