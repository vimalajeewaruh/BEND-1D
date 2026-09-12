

# TremorOnset

## Overview

The **TremorOnset** signal begins with a nearly quiescent baseline and smoothly develops into sustained oscillation. After onset, the dominant frequency is accompanied by a weak harmonic and slow amplitude modulation.

## Mathematical Definition

Define the onset envelope and amplitude modulation

$$
E(x)=\frac{1}{1+e^{-75(x-0.42)}},
\qquad
A(x)=0.78+0.15\sin(2.5\pi x).
$$

The signal is

$$
f(x)=0.025\sin(6\pi x)
+E(x)A(x)\left[\sin(36\pi x)+0.24\sin(72\pi x+0.65)\right].
$$

[TremorOnset signal](../../assets/images/TF032_TremorOnset.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth onset of sustained oscillation |
| Onset center | $x=0.42$ |
| Dominant oscillation | 18 cycles per unit interval |
| Additional structure | Weak harmonic and slow amplitude modulation |
| Main challenge | Simultaneous onset localization and periodic-signal preservation |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $75$ | Onset sharpness | 75 |
| $0.42$ | Onset center | 0.42 |
| $18$ | Dominant frequency | 18 |
| $36$ | Harmonic frequency | 36 |

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

