# TurbiditeSequence


## Overview

The **TurbiditeSequence** signal contains six sharp depositional onsets with unequal exponential grading scales on a slowly changing background.

## Mathematical Definition

For event centers $c_k$, amplitudes $a_k$, and decay scales $\tau_k$,

$$
f(x)=0.30+0.12x+0.035\sin(6\pi x)+\sum_{k=1}^{6}a_k I(x\ge c_k)e^{-(x-c_k)/\tau_k},
$$

where

$$
c=(0.15,0.31,0.48,0.64,0.79,0.90),
$$

$$
a=(0.28,0.42,0.22,0.50,0.35,0.20),\quad
\tau=(0.045,0.065,0.030,0.075,0.050,0.028).
$$

[TurbiditeSequence signal](../../assets/images/TF098_TurbiditeSequence.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Repeated sharp onset and graded decay |
| Events | Six unequal causal deposits |
| Background | Slow trend with weak oscillation |
| Main challenge | Keeping thin events distinct after smoothing |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c_k$ | Event locations | As above |
| $a_k$ | Event amplitudes | As above |
| $\tau_k$ | Grading scales | As above |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF098_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF098_python.md)



## Recommended Uses

- Stratigraphic-series denoising
- Thin-event preservation
- Causal-decay recovery

## Provenance

**Status:** Turbidite-sequence-inspired deterministic sedimentological surrogate.

---

[← Previous: MilankovitchCycles](TF097_MilankovitchCycles.md) | [Category 6 Catalog](index.md) | [Next: CavefishNeuromast →](TF099_CavefishNeuromast.md)
