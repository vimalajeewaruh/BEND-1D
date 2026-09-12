# VortexLockIn

## Overview

The **VortexLockIn** signal represents idealized vortex-induced vibration. Its instantaneous frequency initially increases and then locks to a constant structural frequency, while its amplitude grows through approximately the same transition.

## Mathematical Definition

The instantaneous frequency is

$$
\nu(x)=
\begin{cases}
7+20x, & x\leq0.55,\\
18, & x>0.55.
\end{cases}
$$

Define the accumulated phase

$$
\phi(x)=2\pi\int_0^x\nu(t)\,dt
$$

and the amplitude envelope

$$
E(x)=0.16+\frac{0.84}{1+e^{-28(x-0.33)}}.
$$

The signal is

$$
f(x)=E(x)\left[\sin\phi(x)+0.16\sin\{2\phi(x)-0.4\}\right].
$$

[VortexLockIn signal](../../assets/images/TF038_VortexLockIn.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Chirp-to-periodic lock-in transition |
| Initial frequency | 7 |
| Locked frequency | 18 |
| Lock-in location | $x=0.55$ |
| Main challenge | Preserving simultaneous frequency and amplitude transitions |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.55$ | Frequency lock location | 0.55 |
| $0.33$ | Amplitude-growth center | 0.33 |
| $28$ | Amplitude-growth sharpness | 28 |

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
