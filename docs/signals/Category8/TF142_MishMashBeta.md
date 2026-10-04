# MishMashBeta

## Overview

The **MishMashBeta** stress test combines smooth low-frequency oscillations, Doppler-like compression, a finite plateau, an isolated negative spike, and a weak shoulder.

## Mathematical Definition

Define the stabilized coordinate

```math
u=\max(x,u_0).
```

Define the smooth step

```math
S(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the low-frequency oscillatory component

```math
B(x)=
A_1\sin(2\pi f_1x)
+
A_2\cos(2\pi f_2x).
```

Define the Doppler-like compressed oscillation

```math
D(x)=
A_D\sqrt{u(1-u)}
\sin\left(
\frac{2\pi\lambda_D}{u+\delta_D}
\right).
```

Define the finite plateau

```math
P(x)=
A_P
\left[
S(x;c_{P1},w_P)
-
S(x;c_{P2},w_P)
\right].
```

Define the isolated negative spike

```math
N(x)=
-A_N
\exp\left[
-\frac12\left(\frac{x-c_N}{w_N}\right)^2
\right].
```

Define the weak shoulder

```math
H(x)=
A_H
\exp\left[
-\frac12\left(\frac{x-c_H}{w_H}\right)^2
\right].
```

The signal is

```math
f(x)=B(x)+D(x)+P(x)+N(x)+H(x).
```

[View MishMashBeta signal](../../assets/images/TF142_MishMashBeta.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Oscillation, compression, plateau, spike, and shoulder |
| Background oscillation | Two smooth low-frequency components with frequencies $f_1$ and $f_2$ |
| Compressed oscillation | Nonstationary oscillation governed by $\lambda_D$ and $\delta_D$ |
| Plateau | Finite elevated region from approximately $c_{P1}$ to $c_{P2}$ |
| Narrow spike | Negative localized event centered at $c_N$ |
| Weak shoulder | Broader positive feature centered at $c_H$ |
| Main challenge | Incompatible frequency and localization geometries |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_1$ | First background-oscillation amplitude | 0.22 |
| $f_1$ | First background-oscillation frequency | 3 |
| $A_2$ | Second background-oscillation amplitude | 0.10 |
| $f_2$ | Second background-oscillation frequency | 5 |
| $u_0$ | Lower bound for the stabilized coordinate | 0.02 |
| $A_D$ | Compressed-oscillation amplitude | 0.14 |
| $\lambda_D$ | Compressed-oscillation phase scale | 1.15 |
| $\delta_D$ | Phase-denominator offset | 0.05 |
| $A_P$ | Plateau magnitude | 0.20 |
| $c_{P1}$ | Plateau onset location | 0.38 |
| $c_{P2}$ | Plateau offset location | 0.60 |
| $w_P$ | Plateau transition width | 0.008 |
| $A_N$ | Negative-spike magnitude | 0.30 |
| $c_N$ | Negative-spike center | 0.73 |
| $w_N$ | Negative-spike width | 0.005 |
| $A_H$ | Shoulder amplitude | 0.09 |
| $c_H$ | Shoulder center | 0.82 |
| $w_H$ | Shoulder width | 0.025 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF142_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF142_python.md)



## Recommended Uses

- Adversarial denoising evaluation
- Spike and plateau preservation
- Nonuniform-frequency recovery

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: MishMashAlpha](TF141_MishMashAlpha.md) | [Category 8 Catalog](index.md) | [Next: DoubletOnCliff →](TF143_DoubletOnCliff.md)
