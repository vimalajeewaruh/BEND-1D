# Dyadic Phase Twins


## Overview

Four identical Gaussian-windowed cosine packets are placed at deliberately selected sample indices. Because the local shapes are exact translations, differences in denoising quality reveal sensitivity to dyadic alignment, decimation phase, or location-dependent processing rather than to morphology.

## Mathematical Definition

This diagnostic uses $N=4096$ samples

$$
x_i=\frac{i-1}{N-1},\qquad i=1,\ldots,N,
$$

and one-based center indices

$$
j=(512,1409,2306,3203),
\qquad c_k=\frac{j_k-1}{N-1}.
$$

The signal is

$$
f(x)=\sum_{k=1}^{4}
\exp\left[-\frac12\left(\frac{x-c_k}{0.014}\right)^2\right]
\cos\{2\pi34(x-c_k)\}.
$$

[Dyadic Phase Twins](../../assets/images/TF176_DyadicPhaseTwins.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Controlled translation diagnostic |
| Signal type | Four identical localized wave packets |
| Controlled variable | Sample-grid and dyadic alignment |
| Native sampling | $N=4096$ |
| Main challenge | Produce translation-consistent estimates |

## Parameters

| Parameter | Value | Meaning |
|---|---|---|
| Center indices | $512,1409,2306,3203$ | One-based MATLAB indices |
| Envelope width | $0.014$ | Gaussian localization scale |
| Carrier frequency | $34$ | Cycles per unit interval |
| $N$ | $4096$ | Required native sample count |

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
