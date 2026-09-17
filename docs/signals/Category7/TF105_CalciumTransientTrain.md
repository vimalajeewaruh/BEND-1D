# CalciumTransientTrain


## Overview

The **CalciumTransientTrain** signal contains six causal fast-rise, slow-decay responses. Two nearby events overlap, and the final small event is intentionally difficult to preserve.

## Mathematical Definition

For event centers $c_k$ and amplitudes $a_k$, let $u_k=(x-c_k)_+$. Then

$$
f(x)=0.05+0.01x+\sum_{k=1}^{6}a_k I(x\ge c_k)[1-e^{-120u_k}]e^{-10u_k},
$$

where

$$
c=(0.16,0.29,0.43,0.455,0.67,0.82),\qquad
a=(0.28,0.52,0.72,0.45,0.35,0.18).
$$

[CalciumTransientTrain signal](../../assets/images/TF105_CalciumTransientTrain.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Sparse overlapping asymmetric transients |
| Rise and decay | Rapid rise and slower decay |
| Close pair | Events at 0.43 and 0.455 |
| Main challenge | Resolving overlap while preserving the weak event at 0.82 |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $120$ | Rise rate | 120 |
| $10$ | Decay rate | 10 |
| $c_k,a_k$ | Event centers and amplitudes | As above |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0105_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0105_python.md)


## Recommended Uses

- Calcium-imaging trace denoising
- Overlapping-transient resolution
- Weak-event preservation

## Provenance

**Status:** Calcium-transient-inspired deterministic neural-imaging surrogate.

---

[← Previous: TokamakDisruption](TF104_TokamakDisruption.md) | [Category 7 Catalog](index.md) | [Next: NanoporeCurrent →](TF106_NanoporeCurrent.md)
