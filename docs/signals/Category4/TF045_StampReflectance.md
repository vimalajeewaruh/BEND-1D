# StampReflectance

## Overview

The **StampReflectance** signal is a toy visible reflectance spectrum for a colored stamp. Broad absorption bands, a shoulder, and a weaker secondary structure mimic spectral features used to distinguish inks, pigments, and shades.

## Mathematical Definition

Map the unit interval to wavelength in nanometers:

$$
\lambda(x)=400+300x.
$$

Define

$$
B(\lambda)=0.72+0.00035(\lambda-550),
$$

$$
A_1(\lambda)=0.42\exp\!\left[-\frac12\left(\frac{\lambda-525}{38}\right)^2\right],
$$

$$
A_2(\lambda)=0.16\exp\!\left[-\frac12\left(\frac{\lambda-585}{24}\right)^2\right],
$$

and

$$
S(\lambda)=0.08\exp\!\left[-\frac12\left(\frac{\lambda-455}{18}\right)^2\right].
$$

The reflectance signal is

$$
f(x)=B\{\lambda(x)\}-A_1\{\lambda(x)\}-A_2\{\lambda(x)\}-S\{\lambda(x)\}.
$$

[StampReflectance signal](../../assets/images/TF045_StampReflectance.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth spectrum with unequal absorption structures |
| Wavelength range | 400–700 nm |
| Main band | Centered near 525 nm |
| Secondary features | Band near 585 nm and shoulder near 455 nm |
| Main challenge | Avoiding oversmoothing of diagnostically weak bands |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $525$ nm | Principal-band center | 525 |
| $585$ nm | Secondary-band center | 585 |
| $455$ nm | Shoulder center | 455 |

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

