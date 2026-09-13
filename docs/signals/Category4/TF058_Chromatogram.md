# Chromatogram

## Overview

The **Chromatogram** signal has a weakly drifting baseline and seven unequal approximately Gaussian peaks. Some peaks are separated, others overlap, and a small post-peak tail follows the dominant component.

## Mathematical Definition

Let

$$
G(x;c,w)=\exp\!\left[-\frac12\left(\frac{x-c}{w}\right)^2\right].
$$

The centers, amplitudes, and widths are

$$
c=(0.16,0.29,0.43,0.50,0.67,0.81,0.87),
$$

$$
A=(0.42,0.78,0.33,0.54,1.00,0.47,0.29),
$$

$$
w=(0.012,0.018,0.011,0.022,0.016,0.020,0.013).
$$

The signal is

$$
f(x)=0.035+0.018x+
\sum_{k=1}^{7}A_kG(x;c_k,w_k)
+0.10\mathbf{1}_{\{x>0.67\}}e^{-18(x-0.67)}.
$$

[Chromatogram signal](../../assets/images/TF058_Chromatogram.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Drifting baseline with unequal overlapping peaks |
| Number of peaks | 7 |
| Dominant peak | Centered at $x=0.67$ |
| Additional feature | Exponential post-peak tail |
| Main challenge | Preserving weak and overlapping peaks adjacent to strong peaks |

## Parameters

| Parameter | Meaning | Default |
|---|---|---|
| $N$ | Number of samples | 1024 |
| $c$ | Peak centers | $(0.16,0.29,0.43,0.50,0.67,0.81,0.87)$ |
| $A$ | Peak amplitudes | $(0.42,0.78,0.33,0.54,1.00,0.47,0.29)$ |
| $w$ | Peak widths | $(0.012,0.018,0.011,0.022,0.016,0.020,0.013)$ |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF058_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF058_python.md)



## Recommended Uses

- Chromatographic peak preservation
- Overlapping-peak recovery
- Baseline-drift denoising
- Weak-component detection near dominant peaks

## Provenance

**Status:** Chromatography-inspired deterministic analytical surrogate.

---

[← Previous: PollutionEpisode](TF057_PollutionEpisode.md) | [Category 4 Catalog](index.md)

