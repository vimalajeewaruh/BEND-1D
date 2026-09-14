# MassSpectrum

## Overview

The **MassSpectrum** signal contains sparse narrow peaks of unequal amplitude on a weak broad background. Two nearby peaks form a partially separated doublet, creating a stringent resolution problem.

## Mathematical Definition

Let

$$
G(x;c,w)=\exp\!\left[-\frac12\left(\frac{x-c}{w}\right)^2\right].
$$

The centers, amplitudes, and widths are

$$
c=(0.11,0.24,0.365,0.492,0.510,0.675,0.82,0.905),
$$

$$
A=(0.28,0.62,0.40,1.00,0.72,0.35,0.78,0.24),
$$

$$
w=(0.0045,0.0065,0.0035,0.0050,0.0042,0.0075,0.0055,0.0030).
$$

The signal is

$$
f(x)=0.022+0.018x+0.035G(x;0.73,0.18)
+\sum_{k=1}^{8}A_kG(x;c_k,w_k).
$$

[MassSpectrum signal](../../assets/images/TF062_MassSpectrum.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Sparse narrow peaks and close doublet |
| Number of narrow peaks | 8 |
| Close pair | Centers 0.492 and 0.510 |
| Background | Weak drift and broad component |
| Main challenge | Retaining weak lines without merging close peaks |

## Parameters

| Parameter | Meaning | Default |
|---|---|---|
| $N$ | Number of samples | 1024 |
| $c$ | Peak centers | As listed above |
| $A$ | Peak amplitudes | As listed above |
| $w$ | Peak widths | As listed above |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF062_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF062_python.md)



## Recommended Uses

- Sparse spectral-peak denoising
- Doublet resolution
- Weak-line preservation
- Unequal-amplitude peak recovery

## Provenance

**Status:** Mass-spectrometry-inspired deterministic analytical surrogate.

---

[← Previous: EEGSpindle](TF061_EEGSpindle.md) | [Category 5 Catalog](index.md) | [Next: NMRMultiplet →](TF063_NMRMultiplet.md)

