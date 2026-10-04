# Nanoindentation Pop-In


## Overview

The **NanoindentationPopIn** signal is a loading–unloading curve containing nonlinear loading, two small pop-in events, a separate unloading branch, and a late adhesion-like depression. The weak discrete events sit on a much larger smooth background.

## Mathematical Definition

Define the smooth logistic transition

```math
L(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

For $x\leq c_B$, define the loading branch

```math
f_L(x)=
A_L
\left(
\frac{x}{c_B}
\right)^{p_L}
-
A_1L(x;c_1,w_P)
-
A_2L(x;c_2,w_P).
```

Let $f_B$ denote the value of the sampled loading curve nearest $x=c_B$.

For $x>c_B$, define the unloading branch

```math
f_U(x)=
f_B
\left(
\frac{1-x}{1-c_B}
\right)^{p_U}.
```

Define the adhesion-like depression

```math
D(x)=
-A_D
\exp\left[
-\frac12
\left(
\frac{x-c_D}{w_D}
\right)^2
\right].
```

For $x\leq c_B$, the full signal is

```math
f(x)=f_L(x)+D(x).
```

For $x>c_B$, the full signal is

```math
f(x)=f_U(x)+D(x).
```

[View Nanoindentation Pop-In](../../assets/images/TF167_NanoindentationPopIn.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Hysteretic loading curve |
| Background | Smooth nonlinear loading and unloading |
| Loading behavior | Power-law growth with exponent $p_L$ |
| Local events | Two narrow pop-ins centered at $c_1$ and $c_2$ |
| Junction | Loading-to-unloading branch change at $c_B$ |
| Unloading behavior | Power-law decay with exponent $p_U$ |
| Late feature | Adhesion-like negative depression centered at $c_D$ |
| Main challenge | Preserving small abrupt events on a dominant smooth trend |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_L$ | Loading amplitude scale | 1.08 |
| $p_L$ | Loading power exponent | 1.50 |
| $c_1$ | First pop-in center | 0.29 |
| $c_2$ | Second pop-in center | 0.47 |
| $A_1$ | First pop-in magnitude | 0.055 |
| $A_2$ | Second pop-in magnitude | 0.070 |
| $w_P$ | Pop-in transition width | 0.0018 |
| $c_B$ | Loading-to-unloading branch point | 0.70 |
| $f_B$ | Sampled loading value nearest the branch point | $f_L(c_B)$ approximately |
| $p_U$ | Unloading power exponent | 1.32 |
| $A_D$ | Adhesion-depression magnitude | 0.11 |
| $c_D$ | Adhesion-depression center | 0.925 |
| $w_D$ | Adhesion-depression width | 0.018 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF167_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF167_python.md)



## Recommended Uses

- Weak change-point preservation
- Hysteretic curve smoothing
- Small-event recovery on nonlinear trends

## Provenance

This deterministic signal is inspired by qualitative nanoindentation curves. It is not a material-specific contact model.

[← Previous: Stress–Strain Fracture](TF166_StressStrainFracture.md) · [Category 9 catalog](index.md) · [Next: DSC Phase Transitions →](TF168_DSCPhaseTransitions.md)
