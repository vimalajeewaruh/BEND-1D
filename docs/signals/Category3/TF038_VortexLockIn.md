# VortexLockIn

## Overview

The **VortexLockIn** signal represents idealized vortex-induced vibration. Its instantaneous frequency initially increases and then locks to a constant structural frequency, while its amplitude grows through approximately the same transition.

## Mathematical Definition

Define the instantaneous frequency

$$
\nu(x)=
\begin{cases}
f_0+\beta x, & x\leq x_c,\\
f_L, & x>x_c.
\end{cases}
$$

Define the accumulated phase

$$
\phi(x)=2\pi\int_0^x \nu(t)\,dt
$$

and the amplitude envelope

$$
E(x)=A_0+\frac{A_1}{1+e^{-k(x-x_a)}}.
$$

The signal is

$$
f(x)=E(x)\left[\sin\phi(x)+A_h\sin(2\phi(x)-\delta)\right].
$$

[VortexLockIn signal](../../assets/images/TF038_VortexLockIn.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Chirp-to-periodic lock-in transition |
| Initial frequency | $f_0$ |
| Locked frequency | $f_L$ |
| Lock-in location | $x=x_c$ |
| Main challenge | Preserving simultaneous frequency and amplitude transitions |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $f_0$ | Initial frequency | 7 |
| $\beta$ | Pre-lock frequency slope | 20 |
| $f_L$ | Locked frequency | 18 |
| $x_c$ | Frequency lock location | 0.55 |
| $A_0$ | Initial envelope level | 0.16 |
| $A_1$ | Envelope growth amplitude | 0.84 |
| $x_a$ | Amplitude-growth center | 0.33 |
| $k$ | Amplitude-growth sharpness | 28 |
| $A_h$ | Harmonic amplitude | 0.16 |
| $\delta$ | Harmonic phase shift | 0.4 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF038_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF038_python.md)



## Recommended Uses

- Chirp-to-lock-in transition detection
- Time-varying frequency denoising
- Amplitude-transition preservation
- Vortex-induced-vibration analysis

## Provenance

**Status:** Vortex-induced-vibration-inspired deterministic surrogate.

---

[← Previous: RotorRub](TF037_RotorRub.md) | [Category 3 Catalog](index.md) | [Next: InternalSolitons →](TF039_InternalSolitons.md)
