# StampReflectance

## Overview

The **StampReflectance** signal is a toy visible reflectance spectrum for a colored stamp. Broad absorption bands, a shoulder, and a weaker secondary structure mimic spectral features used to distinguish inks, pigments, and shades.

## Mathematical Definition

Map the unit interval to wavelength by

$$
\lambda(x)=\lambda_{\min}+(\lambda_{\max}-\lambda_{\min})x.
$$

Define the baseline

$$
B(\lambda)=B_0+\beta(\lambda-\lambda_0),
$$

and the absorption components

$$
A_1(\lambda)=a_1\exp\left[-\frac12\left(\frac{\lambda-\mu_1}{s_1}\right)^2\right],
$$

$$
A_2(\lambda)=a_2\exp\left[-\frac12\left(\frac{\lambda-\mu_2}{s_2}\right)^2\right],
$$

$$
S(\lambda)=a_s\exp\left[-\frac12\left(\frac{\lambda-\mu_s}{s_s}\right)^2\right].
$$

The reflectance signal is

$$
f(x)=B(\lambda(x))-A_1(\lambda(x))-A_2(\lambda(x))-S(\lambda(x)).
$$

[View StampReflectance signal](../../assets/images/TF045_StampReflectance.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth spectrum with unequal absorption structures |
| Wavelength range | $\lambda_{\min}$–$\lambda_{\max}$ nm |
| Main band | Centered at $\mu_1$ |
| Secondary features | Band at $\mu_2$ and shoulder at $\mu_s$ |
| Main challenge | Avoiding oversmoothing of diagnostically weak bands |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $\lambda_{\min}$ | Minimum wavelength | 400 nm |
| $\lambda_{\max}$ | Maximum wavelength | 700 nm |
| $B_0$ | Baseline reflectance | 0.72 |
| $\beta$ | Baseline slope | 0.00035 |
| $\lambda_0$ | Baseline reference wavelength | 550 nm |
| $a_1$ | Principal-band amplitude | 0.42 |
| $\mu_1$ | Principal-band center | 525 nm |
| $s_1$ | Principal-band width | 38 nm |
| $a_2$ | Secondary-band amplitude | 0.16 |
| $\mu_2$ | Secondary-band center | 585 nm |
| $s_2$ | Secondary-band width | 24 nm |
| $a_s$ | Shoulder amplitude | 0.08 |
| $\mu_s$ | Shoulder center | 455 nm |
| $s_s$ | Shoulder width | 18 nm |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF045_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF045_python.md)



## Recommended Uses

- Spectral denoising
- Weak-band preservation
- Shoulder detection
- Analytical-philately measurement studies

## Provenance

**Status:** Stamp-reflectance-inspired deterministic spectral surrogate.

---

[← Previous: PerforationDrift](TF044_PerforationDrift.md) | [Category 4 Catalog](index.md) | [Next: PlateWear →](TF046_PlateWear.md)

