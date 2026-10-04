# XAFSEdge


## Overview

The **XAFSEdge** signal combines a smooth pre-edge background, sharp absorption edge, and weaker decaying post-edge oscillations with changing frequency.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the pre-edge background

```math
B(x)=b_0+mx.
```

Define the absorption edge

```math
E(x)=
A_ES(x;c_E,w_E).
```

Let

```math
u=(x-c_E)_+.
```

For $x\geq c_E$, define the post-edge oscillatory fine structure

```math
F(x)=
A_Fe^{-\alpha_Fu}
\sin\left[
2\pi(f_Fu+\beta_Fu^2)
\right],
```

with $F(x)=0$ for $x<c_E$.

The signal is

```math
f(x)=B(x)+E(x)+F(x).
```

[view XAFSEdge signal](../../assets/images/TF158_XAFSEdge.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Dominant edge with coherent oscillatory tail |
| Background | Smooth linear pre-edge trend |
| Absorption edge | Sharp positive transition centered at $c_E$ |
| Fine structure | Decaying chirped oscillation beginning at $c_E$ |
| Frequency evolution | Post-edge frequency increases according to $\beta_F$ |
| Main challenge | Preserving weak post-edge information beside a large transition |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.08 |
| $m$ | Pre-edge background slope | 0.10 |
| $A_E$ | Absorption-edge magnitude | 0.72 |
| $c_E$ | Absorption-edge location | 0.34 |
| $w_E$ | Edge transition width | 0.004 |
| $A_F$ | Fine-structure amplitude | 0.16 |
| $\alpha_F$ | Fine-structure decay rate | 2.6 |
| $f_F$ | Initial post-edge frequency | 12 |
| $\beta_F$ | Quadratic phase coefficient | 18 |

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
