# AudioIntro


## Overview

The **AudioIntro** signal is an original generic musical-intro surrogate with ambient motion, successive bass and harmonic entries, repeated percussive attacks, and a mild chirped crescendo.

## Mathematical Definition

## Mathematical Definition

Define the smooth step

```math
s(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the ambient component

```math
A(x)=A_A\sin(2\pi f_Ax).
```

Define the bass layer

```math
B(x)=A_Bs(x;c_B,w_B)\sin(2\pi f_Bx).
```

Define the harmonic layer

```math
H(x)=A_Hs(x;c_H,w_H)
\sin(2\pi f_Hx+\delta_H).
```

Let the percussive beat centers be

```math
\mathcal{C}
=
(0.420,\,0.505,\,0.590,\,0.675,\,0.760,\,0.845,\,0.930).
```

For each $c\in\mathcal{C}$, define $u_c=(x-c)_+$. For $x\geq c$, define the damped percussive response as

```math
P_c(x)=
A_Pe^{-\alpha_Pu_c}
\sin(2\pi f_Pu_c),
```

with $P_c(x)=0$ for $x<c$.

The complete percussive component is

```math
P(x)=\sum_{c\in\mathcal{C}}P_c(x).
```

Define the increasing chirp component

```math
Q(x)=
A_Qx
\sin\left[
2\pi(f_Qx+\beta_Qx^2)
\right].
```

The signal is

```math
f(x)=A(x)+B(x)+H(x)+P(x)+Q(x).
```

[View AudioIntro signal](../../assets/images/TF096_AudioIntro.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Layered tonal and transient structure |
| Layer entries | Bass and harmonic layers enter near $c_B$ and $c_H$ |
| Transients | $K$ damped percussive attacks centered at $\mathcal{C}$ |
| Chirp | Increasing-amplitude component with changing frequency |
| Main challenge | Preserving simultaneous smooth, oscillatory, and impulsive components |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_A$ | Ambient-layer amplitude | 0.04 |
| $f_A$ | Ambient-layer frequency | 4 |
| $A_B$ | Bass-layer amplitude | 0.14 |
| $f_B$ | Bass-layer frequency | 9 |
| $c_B$ | Bass-layer entry location | 0.18 |
| $w_B$ | Bass-layer transition width | 0.020 |
| $A_H$ | Harmonic-layer amplitude | 0.12 |
| $f_H$ | Harmonic-layer frequency | 23 |
| $c_H$ | Harmonic-layer entry location | 0.38 |
| $w_H$ | Harmonic-layer transition width | 0.025 |
| $\delta_H$ | Harmonic-layer phase shift | 0.4 |
| $K$ | Number of percussive attacks | 7 |
| $\mathcal{C}$ | Percussive beat centers | As specified |
| $A_P$ | Percussive amplitude | 0.20 |
| $\alpha_P$ | Percussive decay rate | 70 |
| $f_P$ | Percussive frequency | 70 |
| $A_Q$ | Chirp amplitude-growth coefficient | 0.10 |
| $f_Q$ | Chirp base frequency | 14 |
| $\beta_Q$ | Quadratic phase coefficient | 5 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF096_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF096_python.md)



## Recommended Uses

- Layered-audio denoising
- Transient and tone preservation
- Multicomponent smoothing evaluation

## Provenance

**Status:** Original generic audio surrogate; not a reproduction of a copyrighted recording.

---

[← Previous: SpeechFormantTransition](TF095_SpeechFormantTransition.md) | [Category 6 Catalog](index.md) | [Next: MilankovitchCycles →](TF097_MilankovitchCycles.md)
