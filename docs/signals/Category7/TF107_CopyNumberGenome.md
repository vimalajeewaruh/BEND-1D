# CopyNumberGenome


## Overview

The **CopyNumberGenome** signal contains long genomic segments, a deletion, a narrow focal amplification, and mild smooth waviness.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the baseline component

```math
B(x)=b_0+A_B\sin(2\pi f_Bx).
```

Define the broad gain

```math
G(x)=
A_G
\left[
S(x;c_{G1},w_G)-S(x;c_{G2},w_G)
\right].
```

Define the deletion

```math
D(x)=
-A_D
\left[
S(x;c_{D1},w_D)-S(x;c_{D2},w_D)
\right].
```

Define the focal amplification

```math
F(x)=
A_F
\left[
S(x;c_{F1},w_F)-S(x;c_{F2},w_F)
\right].
```

The signal is

```math
f(x)=B(x)+G(x)+D(x)+F(x).
```

[View CopyNumberGenome signal](../../assets/images/TF107_CopyNumberGenome.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiscale piecewise-constant structure |
| Background | Mild smooth waviness around baseline $b_0$ |
| Broad alterations | Gain from $c_{G1}$ to $c_{G2}$ and deletion from $c_{D1}$ to $c_{D2}$ |
| Focal feature | Amplification from $c_{F1}$ to $c_{F2}$ |
| Main challenge | Preserving a narrow genomic segment alongside long segments |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.48 |
| $A_B$ | Background oscillation amplitude | 0.025 |
| $f_B$ | Background oscillation frequency | 5 |
| $A_G$ | Broad gain magnitude | 0.20 |
| $c_{G1}$ | Broad gain onset | 0.18 |
| $c_{G2}$ | Broad gain offset | 0.39 |
| $w_G$ | Broad gain transition width | 0.004 |
| $A_D$ | Deletion magnitude | 0.15 |
| $c_{D1}$ | Deletion onset | 0.52 |
| $c_{D2}$ | Deletion offset | 0.66 |
| $w_D$ | Deletion transition width | 0.004 |
| $A_F$ | Focal amplification magnitude | 0.30 |
| $c_{F1}$ | Focal amplification onset | 0.74 |
| $c_{F2}$ | Focal amplification offset | 0.79 |
| $w_F$ | Focal amplification transition width | 0.003 |
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
