# QuantumHallPlateaus


## Overview

The **QuantumHallPlateaus** signal is a smooth staircase of nearly constant plateaus with weak decaying oscillatory structure over the early and middle record.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$. Then

$$
f(x)=0.10+\sum_{k=1}^{6}a_kS(x;c_k,w_k)
+0.025e^{-2.4x}\sin[2\pi(11x+8x^2)][1-S(x;0.58,0.025)],
$$

where

$$
c=(0.13,0.27,0.41,0.57,0.73,0.87),
$$

$$
a=(0.14,0.16,0.18,0.17,0.15,0.12),\quad
w=(0.004,0.004,0.005,0.004,0.005,0.004).
$$

[QuantumHallPlateaus signal](../../assets/images/TF159_QuantumHallPlateaus.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth staircase with weak oscillation |
| Plateaus | Six narrow transitions |
| Oscillation | Decays and is gated off near $x=0.58$ |
| Main challenge | Preserving plateau flatness, transition locations, and weak oscillation |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c_k,a_k,w_k$ | Transition centers, heights, and widths | As above |
| $0.025$ | Oscillation amplitude | 0.025 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0159_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0159_python.md)




## Recommended Uses

- Plateau-preserving denoising
- Transition localization
- Weak magneto-oscillation recovery

## Provenance

**Status:** Quantum-Hall-transport-inspired deterministic surrogate.

---

[← Previous: XAFSEdge](TF158_XAFSEdge.md) | [Category 9 Catalog](index.md) | [Next: FresnelOccultation →](TF160_FresnelOccultation.md)
