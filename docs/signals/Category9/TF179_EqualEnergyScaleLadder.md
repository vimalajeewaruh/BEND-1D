# Equal-Energy Scale Ladder


## Overview

Five Mexican-hat-like features span a wide range of widths. Their amplitudes are scaled inversely with the square root of width so that the features have comparable continuous-domain energy. This isolates scale preference from raw-energy preference.

## Mathematical Definition

Let

$$
c=(0.10,0.27,0.45,0.65,0.85),
\qquad
w=(0.005,0.008,0.013,0.022,0.037),
$$

and $w_0=0.013$. Define

$$
z_k(x)=\frac{x-c_k}{w_k},
\qquad
A_k=\sqrt{\frac{w_0}{w_k}}.
$$

The signal is

$$
f(x)=\sum_{k=1}^{5}A_k[1-z_k(x)^2]e^{-z_k(x)^2/2}.
$$

[Equal-Energy Scale Ladder](../../assets/images/TF179_EqualEnergyScaleLadder.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Controlled scale-bias diagnostic |
| Signal type | Five second-derivative Gaussian profiles |
| Controlled variable | Width from $0.005$ to $0.037$ |
| Equalized property | Approximate continuous-domain energy |
| Main challenge | Treat narrow and broad equal-energy features fairly |

## Parameters

| Center | Width | Amplitude factor $\sqrt{0.013/w}$ |
|---:|---:|---:|
| $0.10$ | $0.005$ | $1.612$ |
| $0.27$ | $0.008$ | $1.275$ |
| $0.45$ | $0.013$ | $1.000$ |
| $0.65$ | $0.022$ | $0.769$ |
| $0.85$ | $0.037$ | $0.593$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0179_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0179_python.md)



## Recommended Uses

- Scale-bias measurement
- Comparing multiscale shrinkage rules
- Equal-energy feature retention

## Provenance

This is a deliberately artificial scale diagnostic. The amplitude normalization is part of the definition.

[← Previous: Rayleigh Doublet Ladder](TF178_RayleighDoubletLadder.md) · [Category 9 catalog](index.md) · [Next: Hölder Ladder →](TF180_HolderLadder.md)
