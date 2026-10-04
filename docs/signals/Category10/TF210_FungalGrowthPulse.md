# FungalGrowthPulse


## Overview

The **FungalGrowthPulse** signal contains a slowly increasing baseline punctuated by four sigmoidal growth spurts of different widths and magnitudes, with a weak oscillation between them.

## Mathematical Definition

Define the logistic transition

```math
L(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the slowly increasing baseline by

```math
B(x)=
b_0+mx.
```

For $k=1,\ldots,K$, define the growth increments by

```math
G_k(x)=
A_kL(x;c_k,w_k).
```

Let the growth centers, magnitudes, and widths be

```math
\mathbf{c}
=
(0.19,\,0.39,\,0.63,\,0.84),
```

```math
\mathbf{A}
=
(0.19,\,0.15,\,0.27,\,0.12),
```

and

```math
\mathbf{w}
=
(0.035,\,0.018,\,0.050,\,0.020).
```

Define the oscillation gate by

```math
g(x)=
L(x;c_{R1},w_R)
-
L(x;c_{R2},w_R).
```

Define the weak oscillatory component by

```math
R(x)=
A_R
\sin(2\pi f_Rx)
g(x).
```

The signal is

```math
f(x)=
B(x)
+
\sum_{k=1}^{K}G_k(x)
+
R(x).
```

[View Fungal Growth Pulse](../../assets/images/TF210_FungalGrowthPulse.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Mycology |
| Structure | Trend plus unequal logistic growth increments and gated ripple |
| Growth behavior | Four cumulative sigmoidal growth spurts with different magnitudes and widths |
| Oscillatory behavior | Weak ripple localized across the main growth region |
| Regularity | Smooth cumulative staircase |
| Main challenge | Preserving weak and broad growth phases simultaneously |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Initial baseline level | 0.06 |
| $m$ | Baseline slope | 0.12 |
| $K$ | Number of growth spurts | 4 |
| $\mathbf{c}$ | Growth centers | $(0.19,\,0.39,\,0.63,\,0.84)$ |
| $\mathbf{A}$ | Growth magnitudes | $(0.19,\,0.15,\,0.27,\,0.12)$ |
| $\mathbf{w}$ | Growth widths | $(0.035,\,0.018,\,0.050,\,0.020)$ |
| $A_R$ | Ripple amplitude | 0.018 |
| $f_R$ | Ripple frequency | 9 |
| $c_{R1}$ | Ripple-gate onset | 0.17 |
| $c_{R2}$ | Ripple-gate termination | 0.88 |
| $w_R$ | Ripple-gate transition width | 0.03 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF210_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF210_python.md)



## Recommended Uses

- Growth-curve denoising
- Multiple-knee preservation
- Weak interphase oscillation recovery

## Provenance

This is a deterministic benchmark surrogate inspired by mycology measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: LeafNyctinasty](TF209_LeafNyctinasty.md) · [Category 10 catalog](index.md) · [Next: PianoInharmonicDecay →](TF211_PianoInharmonicDecay.md)

