# Fano

## Overview

The **Fano** signal combines a broad smooth background with an asymmetric resonance. Its characteristic peak-dip structure is motivated by interference between a localized resonance and a continuum, as encountered in atomic, molecular, and condensed-matter spectroscopy.

## Mathematical Definition

Define $\epsilon(x)=\frac{x-0.58}{0.025},\qquad q=1.5.$  Then

```math
f(x) =
0.35
\exp
\left\{
-\left(
\frac{x-0.26}{0.12}
\right)^2
\right\}
+
0.75
\left\{
\frac{(q+\epsilon(x))^2}{1+\epsilon(x)^2}-1
\right\}.
```


[View Fano signal](../../assets/images/TF006_Fano.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth global structure |
| Secondary tags | Asymmetric resonance, peak-dip pair |
| Continuity | Continuous |
| Background | Broad Gaussian component |
| Localized feature | Narrow Fano resonance near $x=0.58$ |
| Main challenge | Preserving asymmetric interference structure |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $q$ | Fano asymmetry parameter | 1.5 |
| $0.58$ | Resonance location | 0.58 |
| $0.025$ | Resonance width scale | 0.025 |
| $0.26$ | Background center | 0.26 |
| $0.12$ | Background width | 0.12 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF006_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF006_python.md)



## Recommended Uses

- Preservation of peak-dip asymmetry
- Narrow-resonance recovery over a broad background
- Testing peak and trough location bias
- Detecting oversmoothing of interference-like structures

## Provenance

**Status:** Fano-line-shape-inspired deterministic morphology surrogate.

---

[← Previous: DiffusionBand](TF005_DiffusionBand.md) | [Signal Catalog](index.md) | [Next: BouncingBall →](TF007_BouncingBall.md)
