

# TremorOnset

## Overview

The **TremorOnset** signal begins with a nearly quiescent baseline and smoothly develops into sustained oscillation. After onset, the dominant frequency is accompanied by a weak harmonic and slow amplitude modulation.

## Mathematical Definition

Define the onset envelope

```math
E(x)=\frac{1}{1+e^{-k(x-x_c)}},
```

and the amplitude modulation

```math
A(x)=A_0+A_m\sin(\omega_m x).
```

The signal is

```math
f(x)=
A_b\sin(\omega_b x)
+
E(x)A(x)
[\sin(\omega_1x)+A_h\sin(\omega_2x+\delta)].
```

[TremorOnset signal](../../assets/images/TF032_TremorOnset.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth onset of sustained oscillation |
| Onset center | $x=x_c$ |
| Dominant oscillation | $f_1$ cycles per unit interval |
| Additional structure | Weak harmonic and slow amplitude modulation |
| Main challenge | Simultaneous onset localization and periodic-signal preservation |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $x_c$ | Onset center | 0.42 |
| $k$ | Onset sharpness | 75 |
| $A_0$ | Mean oscillation amplitude | 0.78 |
| $A_m$ | Amplitude-modulation strength | 0.15 |
| $\omega_m$ | Modulation angular frequency | $2.5\pi$ |
| $A_b$ | Background oscillation amplitude | 0.025 |
| $\omega_b$ | Background angular frequency | $6\pi$ |
| $\omega_1$ | Dominant angular frequency | $36\pi$ |
| $A_h$ | Harmonic amplitude | 0.24 |
| $\omega_2$ | Harmonic angular frequency | $72\pi$ |
| $\delta$ | Harmonic phase shift | 0.65 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF032_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF032_python.md)



## Recommended Uses

- Oscillatory-onset detection
- Tremor-like signal denoising
- Harmonic preservation
- Slowly modulated amplitude recovery

## Provenance

**Status:** Tremor-onset-inspired deterministic physiological surrogate.

---

[← Previous: EEGBurstSuppress](TF031_EEGBurstSuppress.md) | [Category 3 Catalog](index.md) | [Next: ArterialPulse →](TF033_ArterialPulse.md)

