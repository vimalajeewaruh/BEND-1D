# VibratoTone


## Overview

The **VibratoTone** signal has a smooth attack and release, periodic frequency modulation of its carrier, and simultaneous slower amplitude modulation.

## Mathematical Definition

Define the smooth step

```math
s(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the smooth tone envelope

```math
E(x)=s(x;c_1,w_1)-s(x;c_2,w_2).
```

Define the frequency-modulated phase

```math
\phi(x)=
2\pi
\left[
f_Cx+A_V\sin(2\pi f_Vx)
\right].
```

Define the amplitude modulation

```math
A(x)=A_0+A_M\sin(2\pi f_Mx).
```

The signal is

```math
f(x)=E(x)A(x)\sin\phi(x).
```

[View VibratoTone signal](../../assets/images/TF093_VibratoTone.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Frequency- and amplitude-modulated oscillation |
| Envelope | Smooth onset near $c_1$ and release near $c_2$ |
| Carrier | Nominal frequency $f_C$ with vibrato frequency $f_V$ |
| Amplitude variation | Periodic modulation with frequency $f_M$ |
| Main challenge | Preserving coherent modulation rather than isolated features |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c_1$ | Envelope onset location | 0.12 |
| $w_1$ | Envelope onset width | 0.025 |
| $c_2$ | Envelope release location | 0.88 |
| $w_2$ | Envelope release width | 0.035 |
| $f_C$ | Nominal carrier frequency | 30 |
| $A_V$ | Vibrato phase-modulation magnitude | 0.75 |
| $f_V$ | Vibrato frequency | 5.5 |
| $A_0$ | Mean amplitude | 0.72 |
| $A_M$ | Amplitude-modulation magnitude | 0.14 |
| $f_M$ | Amplitude-modulation frequency | 2.2 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF093_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF093_python.md)



## Recommended Uses

- Modulated-tone denoising
- Instantaneous-frequency preservation
- Smooth-envelope recovery

## Provenance

**Status:** Musical-vibrato-inspired deterministic surrogate.

---

[← Previous: PercussiveAttackDecay](TF092_PercussiveAttackDecay.md) | [Category 6 Catalog](index.md) | [Next: ChordBeating →](TF094_ChordBeating.md)
