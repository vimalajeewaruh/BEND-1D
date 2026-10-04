# PeakForest


## Overview

The **PeakForest** signal is an artificial collection of twelve positive and negative Gaussian peaks spanning a wide range of amplitudes and widths, including several close neighbors.

## Mathematical Definition

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Let the peak centers, signed amplitudes, and widths be

```math
\mathbf{c}
=
(0.08,\,0.15,\,0.24,\,0.31,\,0.405,\,0.47,\,0.505,\,0.59,\,0.69,\,0.77,\,0.86,\,0.93),
```

```math
\mathbf{a}
=
(0.22,\,-0.18,\,0.30,\,0.50,\,-0.25,\,0.70,\,0.42,\,-0.35,\,0.55,\,0.24,\,-0.20,\,0.38),
```

```math
\mathbf{w}
=
(0.030,\,0.015,\,0.020,\,0.010,\,0.012,\,0.008,\,0.006,\,0.016,\,0.004,\,0.010,\,0.006,\,0.003).
```

Define the peak-forest component

```math
P(x)=
\sum_{k=1}^{K}
a_k g(x;c_k,w_k).
```

The signal is

```math
f(x)=b_0+P(x).
```

[View PeakForest signal](../../assets/images/TF122_PeakForest.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiscale positive and negative peak forest |
| Peak locations | $K$ irregularly spaced centers specified by $\mathbf{c}$ |
| Width range | 0.003–0.030 |
| Amplitude range | -0.35–0.70 |
| Main challenge | No single smoothing bandwidth is suitable for all peaks |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.02 |
| $K$ | Number of peaks | 12 |
| $\mathbf{c}$ | Peak centers | $(0.08,\,0.15,\,0.24,\,0.31,\,0.405,\,0.47,\,0.505,\,0.59,\,0.69,\,0.77,\,0.86,\,0.93)$ |
| $\mathbf{a}$ | Signed peak amplitudes | $(0.22,\,-0.18,\,0.30,\,0.50,\,-0.25,\,0.70,\,0.42,\,-0.35,\,0.55,\,0.24,\,-0.20,\,0.38)$ |
| $\mathbf{w}$ | Peak widths | $(0.030,\,0.015,\,0.020,\,0.010,\,0.012,\,0.008,\,0.006,\,0.016,\,0.004,\,0.010,\,0.006,\,0.003)$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF122_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF122_python.md)



## Recommended Uses

- Multiscale peak recovery
- Close-feature resolution
- Signed-feature preservation

## Provenance

**Status:** Deliberately artificial multiscale peak stress test.

---

[← Previous: CuspChirpStep](TF121_CuspChirpStep.md) | [Category 7 Catalog](index.md) | [Next: HiddenNeedle →](TF123_HiddenNeedle.md)
