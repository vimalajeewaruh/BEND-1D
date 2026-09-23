# XAFSEdge


## Overview

The **XAFSEdge** signal combines a smooth pre-edge background, sharp absorption edge, and weaker decaying post-edge oscillations with changing frequency.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $u=(x-0.34)_+$. Then

$$
f(x)=0.08+0.10x+0.72S(x;0.34,0.004)
+0.16I(x\ge0.34)e^{-2.6u}\sin[2\pi(12u+18u^2)].
$$

[XAFSEdge signal](../../assets/images/TF158_XAFSEdge.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Dominant edge with coherent oscillatory tail |
| Absorption edge | Near $x=0.34$ |
| Fine structure | Slowly decaying chirped oscillation |
| Main challenge | Preserving weak post-edge information beside a large transition |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.72$ | Edge magnitude | 0.72 |
| $2.6$ | Tail decay rate | 2.6 |
| $18$ | Quadratic phase coefficient | 18 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF158_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF158_python.md)




## Recommended Uses

- XAFS-spectrum denoising
- Edge localization
- Post-edge oscillation preservation

## Provenance

**Status:** X-ray-absorption-fine-structure-inspired deterministic surrogate.

---

[← Previous: DispersiveHydraulicJump](TF157_DispersiveHydraulicJump.md) | [Category 9 Catalog](index.md) | [Next: QuantumHallPlateaus →](TF159_QuantumHallPlateaus.md)
