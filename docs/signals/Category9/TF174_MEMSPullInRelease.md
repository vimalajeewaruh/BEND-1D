# MEMS Pull-In / Release


## Overview

The **MEMSPullInRelease** signal is a MEMS-inspired displacement curve containing nonlinear approach, abrupt pull-in to a high plateau, a weak oscillation on the held state, and abrupt release followed by damped ringing. It is a compact hysteretic switching benchmark.

## Mathematical Definition

Let the pull-in and release locations be

```math
c_P=0.42,
\qquad
c_R=0.70.
```

For $0\leq x<c_P$, define

```math
u=\frac{x}{c_P},
```

and the nonlinear pre-pull-in branch by

```math
f(x)=
b_P+a_2u^2+a_5u^5.
```

For $c_P\leq x<c_R$, define the held-state plateau by

```math
f(x)=
L_H+
A_H
\sin\left(
2\pi f_H
\frac{x-c_P}{c_R-c_P}
\right).
```

For $x\geq c_R$, let

```math
v=x-c_R,
```

and define the post-release branch by

```math
f(x)=
A_R\left(
1-\frac{v}{1-c_R}
\right)
+b_R
+
A_De^{-\alpha_Dv}
\sin(2\pi f_Dv).
```

[View MEMS Pull-In / Release](../../assets/images/TF174_MEMSPullInRelease.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Hysteretic switching trajectory |
| Smooth portion | Nonlinear pre-pull-in loading |
| Pull-in event | Abrupt transition at $c_P$ |
| Held state | High plateau with weak oscillatory ripple |
| Release event | Abrupt transition at $c_R$ |
| Post-release behavior | Declining return branch with damped ringing |
| Main challenge | Preserving jumps without erasing adjacent oscillation |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c_P$ | Pull-in location | 0.42 |
| $c_R$ | Release location | 0.70 |
| $b_P$ | Pre-pull-in baseline | 0.06 |
| $a_2$ | Quadratic loading coefficient | 0.56 |
| $a_5$ | Fifth-order loading coefficient | 0.12 |
| $L_H$ | Held-state plateau level | 0.98 |
| $A_H$ | Plateau-ripple amplitude | 0.025 |
| $f_H$ | Number of ripple cycles across the held state | 2 |
| $A_R$ | Post-release linear-return amplitude | 0.24 |
| $b_R$ | Post-release baseline | 0.05 |
| $A_D$ | Ring-down amplitude | 0.15 |
| $\alpha_D$ | Ring-down decay rate | 16 |
| $f_D$ | Ring-down frequency | 34 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF174_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF174_python.md)



## Recommended Uses

- Hysteretic switch denoising
- Jump localization with nearby ring-down
- Mixed smooth and discontinuous morphology

## Provenance

This deterministic waveform is inspired by qualitative MEMS pull-in and release behavior. It is not a device-specific electromechanical model.

[← Previous: Transformer Inrush](TF173_TransformerInrush.md) · [Category 9 catalog](index.md) · [Next: Lorenz Wing Switch →](TF175_LorenzWingSwitch.md)
