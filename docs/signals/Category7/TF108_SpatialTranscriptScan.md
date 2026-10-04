# SpatialTranscriptScan

## Overview

The **SpatialTranscriptScan** signal places a strong tissue-domain interval, a localized hotspot, and a much smaller neighboring domain on a smooth spatial trend.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the smooth spatial background

```math
B(x)=b_0+mx+A_B\sin(2\pi f_Bx).
```

Define the strong tissue-domain component

```math
D(x)=
A_D
\left[
S(x;c_1,w_1)-S(x;c_2,w_2)
\right].
```

Define the localized hotspot

```math
H(x)=A_Hg(x;c_H,w_H).
```

Define the weak neighboring feature

```math
W(x)=A_Wg(x;c_W,w_W).
```

The signal is

```math
f(x)=B(x)+D(x)+H(x)+W(x).
```

[View SpatialTranscriptScan signal](../../assets/images/TF108_SpatialTranscriptScan.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Spatial trend, domain, hotspot, and weak feature |
| Background | Smooth increasing trend with low-frequency oscillation |
| Strong domain | Approximately from $c_1$ to $c_2$ |
| Hotspot | Localized feature centered at $c_H$ |
| Weak feature | Narrow neighboring peak centered at $c_W$ |
| Main challenge | Retaining a weak neighboring feature without roughening the trend |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.18 |
| $m$ | Spatial trend slope | 0.20 |
| $A_B$ | Background oscillation amplitude | 0.04 |
| $f_B$ | Background oscillation frequency | 2 |
| $A_D$ | Tissue-domain amplitude | 0.38 |
| $c_1$ | Tissue-domain onset | 0.31 |
| $w_1$ | Tissue-domain onset width | 0.010 |
| $c_2$ | Tissue-domain offset | 0.55 |
| $w_2$ | Tissue-domain offset width | 0.012 |
| $A_H$ | Hotspot amplitude | 0.24 |
| $c_H$ | Hotspot center | 0.72 |
| $w_H$ | Hotspot width | 0.030 |
| $A_W$ | Weak-feature amplitude | 0.08 |
| $c_W$ | Weak-feature center | 0.80 |
| $w_W$ | Weak-feature width | 0.012 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF108_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF108_python.md)



## Recommended Uses

- Spatial-omics smoothing
- Domain-boundary recovery
- Weak-hotspot preservation

## Provenance

**Status:** Spatial-transcriptomics-inspired deterministic surrogate.

---

[← Previous: CopyNumberGenome](TF107_CopyNumberGenome.md) | [Category 7 Catalog](index.md) | [Next: SemiconductorMetrology →](TF109_SemiconductorMetrology.md)
