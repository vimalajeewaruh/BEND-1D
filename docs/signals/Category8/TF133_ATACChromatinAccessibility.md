# ATACChromatinAccessibility


## Overview

The **ATACChromatinAccessibility** signal places six narrow regulatory-like peaks within three broad accessibility regions of unequal scale.

## Mathematical Definition

Let $g(x;c,w)=e^{-((x-c)/w)^2/2}$. Then

$$
f(x)=0.06+0.018\sin(8\pi x)+\sum_{k=1}^{3}a_k g(x;c_k,w_k)+\sum_{j=1}^{6}b_j g(x;d_j,0.007),
$$

where

$$
c=(0.20,0.52,0.77),\ a=(0.22,0.30,0.18),\ w=(0.070,0.085,0.060),
$$

$$
d=(0.18,0.235,0.49,0.54,0.705,0.79),\quad
b=(0.16,0.12,0.20,0.10,0.08,0.15).
$$

[ATACChromatinAccessibility signal](../../assets/images/TF133_ATACChromatinAccessibility.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Broad regions containing narrow peaks |
| Broad scales | Widths 0.060–0.085 |
| Narrow scale | Common width 0.007 |
| Main challenge | Recovering regional and localized genomic structure together |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c_k,a_k,w_k$ | Broad-region parameters | As above |
| $d_j,b_j$ | Narrow-peak centers and amplitudes | As above |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF133_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF133_python.md)



## Recommended Uses

- Chromatin-accessibility smoothing
- Broad/narrow scale separation
- Weak regulatory-peak preservation

## Provenance

**Status:** ATAC-seq-accessibility-profile-inspired deterministic genomic surrogate.

---

[← Previous: MRFreeInductionDecay](TF132_MRFreeInductionDecay.md) | [Category 8 Catalog](index.md) | [Next: WindTurbineGustControl →](TF134_WindTurbineGustControl.md)
