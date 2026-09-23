# NeedleInChirp

## Overview

The **NeedleInChirp** stress test embeds a narrow weak needle where an accelerating chirp has already become dense.

## Mathematical Definition

$$
f(x)=0.34(0.65+0.35x)\sin[2\pi(8x+26x^2)]+0.11e^{-((x-0.72)/0.003)^2/2}.
$$

[NeedleInChirp signal](../../assets/images/TF144_NeedleInChirp.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Amplitude-varying chirp with embedded needle |
| Chirp | Quadratic phase with coefficient 26 |
| Needle | Center 0.72, width 0.003 |
| Main challenge | Sparse-event detection competes with dense local oscillation |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $26$ | Quadratic chirp coefficient | 26 |
| $0.11$ | Needle amplitude | 0.11 |
| $0.003$ | Needle width | 0.003 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF144_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF144_python.md)



## Recommended Uses

- Dense-chirp denoising
- Embedded-needle detection
- Fine-scale coefficient competition tests

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: DoubletOnCliff](TF143_DoubletOnCliff.md) | [Category 8 Catalog](index.md) | [Next: DerivativeZoo →](TF145_DerivativeZoo.md)
