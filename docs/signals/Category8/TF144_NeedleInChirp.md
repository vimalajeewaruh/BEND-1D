# NeedleInChirp

## Overview

The **NeedleInChirp** stress test embeds a narrow weak needle where an accelerating chirp has already become dense.

## Mathematical Definition

Define the amplitude envelope

```math
A(x)=A_C(a_0+a_1x).
```

Define the accelerating chirp phase

```math
\phi(x)=
2\pi(f_0x+\beta x^2).
```

Define the amplitude-varying chirp

```math
C(x)=
A(x)\sin\phi(x).
```

Define the narrow needle

```math
N(x)=
A_N
\exp\left[
-\frac12\left(\frac{x-c_N}{w_N}\right)^2
\right].
```

The signal is

```math
f(x)=C(x)+N(x).
```

[View NeedleInChirp signal](../../assets/images/TF144_NeedleInChirp.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Amplitude-varying chirp with embedded needle |
| Chirp amplitude | Gradually increases according to $A(x)$ |
| Chirp frequency | Increasing frequency governed by $f_0$ and $\beta$ |
| Needle | Narrow weak peak centered at $c_N$ |
| Main challenge | Sparse-event detection competes with dense local oscillation |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_C$ | Chirp amplitude scale | 0.34 |
| $a_0$ | Initial amplitude-envelope level | 0.65 |
| $a_1$ | Amplitude-envelope slope | 0.35 |
| $f_0$ | Chirp base frequency | 8 |
| $\beta$ | Quadratic chirp coefficient | 26 |
| $A_N$ | Needle amplitude | 0.11 |
| $c_N$ | Needle center | 0.72 |
| $w_N$ | Needle width | 0.003 |
## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF144_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF144_python.md)



## Recommended Uses

- Dense-chirp denoising
- Embedded-needle detection
- Fine-scale coefficient competition tests

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: DoubletOnCliff](TF143_DoubletOnCliff.md) | [Category 8 Catalog](index.md) | [Next: DerivativeZoo →](TF145_DerivativeZoo.md)
