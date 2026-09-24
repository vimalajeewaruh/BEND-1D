# ENSOEnvelope



## Overview

A low-frequency quasi-periodic oscillation has varying amplitude, slowly changing phase, and asymmetric warm- and cold-event perturbations.

## Mathematical Definition

With $G(x;c,w)=e^{-((x-c)/w)^2/2}$,
$$
A(x)=0.45+0.20\sin(2\pi0.75x+0.4),\qquad
\phi(x)=2\pi(2.1x+0.22x^2),
$$
$$
f(x)=A(x)\sin\phi(x)+0.22G(x;0.28,0.06)
-0.18G(x;0.57,0.07)+0.25G(x;0.83,0.045).
$$

[ENSOEnvelope signal](../../assets/images/TF221_ENSOEnvelope.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Climate variability |
| Structure | Amplitude-modulated polynomial-phase carrier plus three events |
| Regularity | Smooth, low-frequency, and nonstationary |
| Main challenge | Separate the evolving oscillation from asymmetric event structure |

## Parameters

| Parameter | Value |
|---|---|
| Carrier phase | $2\pi(2.1x+0.22x^2)$ |
| Event centers | $0.28,0.57,0.83$ |
| Event amplitudes | $0.22,-0.18,0.25$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF221_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF221_python.md)




## Recommended Uses

- Nonstationary climate-signal denoising
- Envelope preservation
- Asymmetric event recovery

## Provenance

This is a deterministic benchmark surrogate inspired by climate variability measurement morphology. It is not a calibrated physical or financial simulator.

[← Previous: DroughtRecovery](TF220_DroughtRecovery.md) · [Category 10 catalog](index.md) · [Next: BubbleLogPeriodic →](TF222_BubbleLogPeriodic.md)

