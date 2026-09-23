# CopyNumberGenome


## Overview

The **CopyNumberGenome** signal contains long genomic segments, a deletion, a narrow focal amplification, and mild smooth waviness.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$. Then

$$
\begin{aligned}
f(x)={}&0.48+0.025\sin(10\pi x)\\
&+0.20[S(x;0.18,0.004)-S(x;0.39,0.004)]\\
&-0.15[S(x;0.52,0.004)-S(x;0.66,0.004)]\\
&+0.30[S(x;0.74,0.003)-S(x;0.79,0.003)].
\end{aligned}
$$

[CopyNumberGenome signal](../../assets/images/TF107_CopyNumberGenome.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiscale piecewise-constant structure |
| Broad alterations | Gain from 0.18–0.39 and deletion from 0.52–0.66 |
| Focal feature | Amplification from 0.74–0.79 |
| Main challenge | Preserving a narrow genomic segment alongside long segments |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.20$ | Broad gain magnitude | 0.20 |
| $-0.15$ | Deletion magnitude | -0.15 |
| $0.30$ | Focal amplification magnitude | 0.30 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF107_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF107_python.md)



## Recommended Uses

- Copy-number denoising
- Segment-boundary preservation
- Focal-amplification detection

## Provenance

**Status:** Genomic-copy-number-inspired deterministic surrogate.

---

[← Previous: NanoporeCurrent](TF106_NanoporeCurrent.md) | [Category 7 Catalog](index.md) | [Next: SpatialTranscriptScan →](TF108_SpatialTranscriptScan.md)
