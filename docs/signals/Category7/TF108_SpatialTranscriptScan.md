# SpatialTranscriptScan

## Overview

The **SpatialTranscriptScan** signal places a strong tissue-domain interval, a localized hotspot, and a much smaller neighboring domain on a smooth spatial trend.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
\begin{aligned}
f(x)={}&0.18+0.20x+0.04\sin(4\pi x)\\
&+0.38[S(x;0.31,0.010)-S(x;0.55,0.012)]\\
&+0.24g(x;0.72,0.030)+0.08g(x;0.80,0.012).
\end{aligned}
$$

[SpatialTranscriptScan signal](../../assets/images/TF108_SpatialTranscriptScan.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Spatial trend, domain, hotspot, and weak feature |
| Strong domain | Approximately 0.31–0.55 |
| Weak domain | Narrow peak near $x=0.80$ |
| Main challenge | Retaining a weak neighboring feature without roughening the trend |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.38$ | Tissue-domain amplitude | 0.38 |
| $0.24$ | Hotspot amplitude | 0.24 |
| $0.08$ | Weak-domain amplitude | 0.08 |

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
