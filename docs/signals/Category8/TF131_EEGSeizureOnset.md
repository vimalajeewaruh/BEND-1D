# EEGSeizureOnset

## Overview

The **EEGSeizureOnset** signal begins with low-amplitude background activity, includes a weak precursor, develops a finite growing-frequency oscillatory episode, and ends with post-event suppression.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the background activity

```math
B(x)=
A_1\sin(2\pi f_1x)
+
A_2\sin(2\pi f_2x+\delta_2).
```

Define the finite seizure-episode envelope

```math
E(x)=
S(x;c_{E1},w_{E1})
-
S(x;c_{E2},w_{E2}).
```

Define the growing-frequency phase

```math
\phi(x)=
2\pi(f_0x+\beta x^2).
```

Define the seizure-like oscillatory episode

```math
Q(x)=
A_E E(x)\sin\phi(x).
```

Define the weak precursor

```math
P(x)=
A_Pg(x;c_P,w_P).
```

Define the post-event suppression

```math
D(x)=
-A_DS(x;c_D,w_D).
```

The signal is

```math
f(x)=B(x)+Q(x)+P(x)+D(x).
```

[View EEGSeizureOnset signal](../../assets/images/TF131_EEGSeizureOnset.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Weak precursor, oscillatory onset, and suppression |
| Background activity | Two low-amplitude oscillatory components |
| Precursor | Narrow positive peak centered at $c_P$ |
| Seizure-like episode | Finite oscillatory interval from approximately $c_{E1}$ to $c_{E2}$ |
| Frequency evolution | Increasing frequency governed by $\beta$ |
| Post-event suppression | Negative level shift beginning near $c_D$ |
| Main challenge | Preserving the weak early precursor beside stronger later activity |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_1$ | First background amplitude | 0.035 |
| $f_1$ | First background frequency | 5 |
| $A_2$ | Second background amplitude | 0.018 |
| $f_2$ | Second background frequency | 9 |
| $\delta_2$ | Second background phase shift | 0.6 |
| $A_E$ | Episode amplitude | 0.38 |
| $c_{E1}$ | Episode onset location | 0.42 |
| $w_{E1}$ | Episode onset width | 0.05 |
| $c_{E2}$ | Episode offset location | 0.82 |
| $w_{E2}$ | Episode offset width | 0.03 |
| $f_0$ | Episode base frequency | 12 |
| $\beta$ | Quadratic phase coefficient | 12 |
| $A_P$ | Precursor amplitude | 0.18 |
| $c_P$ | Precursor center | 0.36 |
| $w_P$ | Precursor width | 0.008 |
| $A_D$ | Post-event suppression magnitude | 0.06 |
| $c_D$ | Suppression onset location | 0.84 |
| $w_D$ | Suppression transition width | 0.015 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF131_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF131_python.md)



## Recommended Uses

- EEG denoising
- Weak-precursor preservation
- Oscillatory-onset localization

## Provenance

**Status:** Seizure-onset-EEG-inspired deterministic surrogate; not a clinical simulator.

---

[← Previous: WearableGaitIMU](TF130_WearableGaitIMU.md) | [Category 8 Catalog](index.md) | [Next: MRFreeInductionDecay →](TF132_MRFreeInductionDecay.md)
