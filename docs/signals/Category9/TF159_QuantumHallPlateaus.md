# QuantumHallPlateaus


## Overview

The **QuantumHallPlateaus** signal is a smooth staircase of nearly constant plateaus with weak decaying oscillatory structure over the early and middle record.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the staircase component

```math
P(x)=
\sum_{k=1}^{K}
a_k S(x;c_k,w_k).
```

The transition centers, heights, and widths are

```math
\mathbf{c}
=
(0.13,\,0.27,\,0.41,\,0.57,\,0.73,\,0.87),
```

```math
\mathbf{a}
=
(0.14,\,0.16,\,0.18,\,0.17,\,0.15,\,0.12),
```

```math
\mathbf{w}
=
(0.004,\,0.004,\,0.005,\,0.004,\,0.005,\,0.004).
```

Define the oscillatory gating function

```math
G(x)=
1-S(x;c_G,w_G).
```

Define the weak decaying chirped oscillation

```math
O(x)=
A_O e^{-\alpha_Ox}
\sin\left[
2\pi(f_Ox+\beta_Ox^2)
\right]
G(x).
```

The signal is

```math
f(x)=
b_0+P(x)+O(x).
```

[View QuantumHallPlateaus signal](../../assets/images/TF159_QuantumHallPlateaus.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth staircase with weak oscillation |
| Plateaus | $K$ narrow transitions with centers specified by $\mathbf{c}$ |
| Transition sizes | Unequal increments specified by $\mathbf{a}$ |
| Oscillation | Weak decaying chirped component |
| Oscillation gate | Smoothly suppressed near $c_G$ |
| Main challenge | Preserving plateau flatness, transition locations, and weak oscillation |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Initial baseline level | 0.10 |
| $K$ | Number of staircase transitions | 6 |
| $\mathbf{c}$ | Transition centers | $(0.13,\,0.27,\,0.41,\,0.57,\,0.73,\,0.87)$ |
| $\mathbf{a}$ | Transition heights | $(0.14,\,0.16,\,0.18,\,0.17,\,0.15,\,0.12)$ |
| $\mathbf{w}$ | Transition widths | $(0.004,\,0.004,\,0.005,\,0.004,\,0.005,\,0.004)$ |
| $A_O$ | Oscillation amplitude | 0.025 |
| $\alpha_O$ | Oscillation decay rate | 2.4 |
| $f_O$ | Initial oscillation frequency | 11 |
| $\beta_O$ | Quadratic phase coefficient | 8 |
| $c_G$ | Oscillation gate location | 0.58 |
| $w_G$ | Oscillation gate width | 0.025 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF159_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF159_python.md)




## Recommended Uses

- Plateau-preserving denoising
- Transition localization
- Weak magneto-oscillation recovery

## Provenance

**Status:** Quantum-Hall-transport-inspired deterministic surrogate.

---

[← Previous: XAFSEdge](TF158_XAFSEdge.md) | [Category 9 Catalog](index.md) | [Next: FresnelOccultation →](TF160_FresnelOccultation.md)
