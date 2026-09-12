# ArterialPulse

## Overview

The **ArterialPulse** signal is a train of idealized pressure pulses. Each pulse combines a rapid systolic component, a broader shoulder, a dicrotic notch, and a reflected wave. Beat amplitudes vary slowly across the record.

## Mathematical Definition

Let

$$
G(x;\mu,s)=\exp\!\left[-\frac12\left(\frac{x-\mu}{s}\right)^2\right].
$$

For pulse center $c_k$, define

$$
P_k(x)=1.05G(x;c_k,0.010)+0.48G(x;c_k+0.022,0.020)
-0.23G(x;c_k+0.039,0.006)+0.20G(x;c_k+0.056,0.016).
$$

The nine centers are $c_k=0.07+0.115(k-1)$, and

$$
a_k=0.92+0.08\sin\!\left(\frac{2\pi(k-1)}{9}\right).
$$

The signal is

$$
f(x)=0.08+\sum_{k=1}^{9}a_kP_k(x).
$$

[ArterialPulse signal](../../assets/images/TF033_ArterialPulse.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Repeated asymmetric multiscale pulses |
| Number of pulses | 9 |
| Local features | Systolic peak, shoulder, notch, and reflection |
| Beat variability | Slowly varying amplitude |
| Main challenge | Preserving narrow and broad components within each beat |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.115$ | Pulse spacing | 0.115 |
| $0.010$ | Systolic width | 0.010 |
| $0.006$ | Notch width | 0.006 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF033_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF033_python.md)



## Recommended Uses

- Pulse-waveform denoising
- Dicrotic-notch preservation
- Recurrent multiscale feature recovery
- Beat-to-beat amplitude variation analysis

## Provenance

**Status:** Arterial-pressure-pulse-inspired deterministic physiological surrogate.

---

[← Previous: TremorOnset](TF032_TremorOnset.md) | [Category 3 Catalog](index.md) | [Next: EMGRecruitment →](TF034_EMGRecruitment.md)

