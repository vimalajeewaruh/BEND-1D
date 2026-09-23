# Nanoindentation Pop-In


## Overview

This loading–unloading curve contains nonlinear loading, two small pop-in events, a separate unloading branch, and a late adhesion-like depression. The weak discrete events sit on a much larger smooth background.

## Mathematical Definition

Define

$$
L(x;c,w)=\frac{1}{1+e^{-(x-c)/w}}.
$$

On the loading branch,

$$
f_L(x)=1.08\left(\frac{x}{0.70}\right)^{1.50}
-0.055L(x;0.29,0.0018)-0.070L(x;0.47,0.0018),
\qquad x\le0.70.
$$

Let $f_{70}$ be the value of the sampled loading curve nearest $x=0.70$. The unloading branch is

$$
f_U(x)=f_{70}\left(\frac{1-x}{0.30}\right)^{1.32},
\qquad x>0.70.
$$

Finally,

$$
f(x)=
\begin{cases}
f_L(x), & x\le0.70,\\
f_U(x), & x>0.70
\end{cases}
-0.11\exp\left[-\frac12\left(\frac{x-0.925}{0.018}\right)^2\right].
$$

[Nanoindentation Pop-In](../../assets/images/TF167_NanoindentationPopIn.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Hysteretic loading curve |
| Background | Smooth nonlinear loading and unloading |
| Local events | Two narrow pop-ins and a late adhesion dip |
| Junction | Branch change near $x=0.70$ |
| Main challenge | Preserve small abrupt events on a dominant trend |

## Parameters

| Parameter | Value | Meaning |
|---|---:|---|
| Pop-in centers | $0.29, 0.47$ | Loading discontinuities |
| Pop-in widths | $0.0018$ | Logistic transition widths |
| Branch point | $0.70$ | Loading-to-unloading transition |
| Adhesion center | $0.925$ | Late negative feature |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0167_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0167_python.md)



## Recommended Uses

- Weak change-point preservation
- Hysteretic curve smoothing
- Small-event recovery on nonlinear trends

## Provenance

This deterministic signal is inspired by qualitative nanoindentation curves. It is not a material-specific contact model.

[← Previous: Stress–Strain Fracture](TF166_StressStrainFracture.md) · [Category 9 catalog](index.md) · [Next: DSC Phase Transitions →](TF168_DSCPhaseTransitions.md)
