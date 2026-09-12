---
layout: default
title: TF028 — VasospasmTCD
---

# TF028 — VasospasmTCD

## Overview

The **VasospasmTCD** signal is a toy transcranial-Doppler velocity trace. Cardiac pulsatility persists throughout the record, while a smooth pathological onset increases both mean velocity and pulsatile amplitude.

## Mathematical Definition

Define

$$
\phi(x)=2\pi\left[9x+0.06\sin(1.6\pi x)\right]
$$

and

$$
p(x)=0.55\sin\phi(x)+0.23\sin\{2\phi(x)-0.55\}
+0.10\sin\{3\phi(x)-1\}.
$$

The smooth onset is

$$
o(x)=\frac{1}{1+e^{-65(x-0.56)}}.
$$

The complete signal is

$$
f(x)=0.35+0.18p(x)+o(x)\left[0.48+0.18p(x)\right]
+0.035\sin(2.2\pi x).
$$


[VasospasmTCD signal](../../assets/images/TF028_VasospasmTCD.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Periodic waveform with gradual pathological onset |
| Persistent structure | Cardiac pulsatility |
| Onset center | $x=0.56$ |
| Post-onset change | Increased mean level and pulse amplitude |
| Main challenge | Preserving repeated pulses while localizing the smooth change |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.56$ | Onset center | 0.56 |
| $65$ | Onset sharpness | 65 |
| $9$ | Nominal cardiac frequency | 9 |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF028_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF011_python.md)



## Recommended Uses

- Smooth pathological-onset detection
- Pulsatile-flow denoising
- Joint level and amplitude-change recovery
- Repeated-waveform preservation

## Provenance

**Status:** Transcranial-Doppler-inspired deterministic physiological surrogate.

---

[← Previous: NasonPleth](TF027_NasonPleth.md) | [Category 3 Catalog](index.md) | [Next: PVCTrain →](TF029_PVCTrain.md)
