# LeafNyctinasty


## Overview

The **LeafNyctinasty** signal contains two daily opening–closing cycles with deliberately unequal transition speeds, producing a nearly periodic but distinctly nonsinusoidal waveform.

## Mathematical Definition

Define the logistic transition

```math
L(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

For $k=1,\ldots,K$, define the opening–closing cycle by

```math
C_k(x)=
A_k
\left[
L(x;c_{O,k},w_{O,k})
-
L(x;c_{C,k},w_{C,k})
\right].
```

Let the opening centers be

```math
\mathbf{c}_O=
(0.08,\,0.57),
```

and the closing centers be

```math
\mathbf{c}_C=
(0.38,\,0.88).
```

The corresponding opening and closing widths are

```math
\mathbf{w}_O=
(0.025,\,0.022),
```

and

```math
\mathbf{w}_C=
(0.050,\,0.060).
```

The cycle amplitudes are

```math
\mathbf{A}=
(0.78,\,0.72).
```

Define the weak background oscillation by

```math
B(x)=
b_0+
A_B\sin(2\pi f_Bx).
```

The signal is

```math
f(x)=
B(x)+
\sum_{k=1}^{K}C_k(x).
```

[View Leaf Nyctinasty](../../assets/images/TF209_LeafNyctinasty.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Botany |
| Structure | Two pairs of asymmetric logistic gates plus a weak oscillation |
| Cycle behavior | Two opening–closing cycles with unequal amplitudes |
| Transition behavior | Opening transitions are sharper than the corresponding closing transitions |
| Regularity | Smooth repeated transitions without true jumps |
| Main challenge | Preserving unequal opening and closing rates |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.12 |
| $K$ | Number of opening–closing cycles | 2 |
| $\mathbf{A}$ | Cycle amplitudes | $(0.78,\,0.72)$ |
| $\mathbf{c}_O$ | Opening centers | $(0.08,\,0.57)$ |
| $\mathbf{c}_C$ | Closing centers | $(0.38,\,0.88)$ |
| $\mathbf{w}_O$ | Opening transition widths | $(0.025,\,0.022)$ |
| $\mathbf{w}_C$ | Closing transition widths | $(0.050,\,0.060)$ |
| $A_B$ | Background oscillation amplitude | 0.025 |
| $f_B$ | Background oscillation frequency | 5 |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF209_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF209_python.md)



## Recommended Uses

- Quasi-periodic transition denoising
- Asymmetry preservation
- Cycle-shape recovery

## Provenance

This is a deterministic benchmark surrogate inspired by botany measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: SapFlowLag](TF208_SapFlowLag.md) · [Category 10 catalog](index.md) · [Next: FungalGrowthPulse →](TF210_FungalGrowthPulse.md)

