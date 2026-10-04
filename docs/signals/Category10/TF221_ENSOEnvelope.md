# ENSOEnvelope



## Overview

The **ENSOEnvelope** signal contains a low-frequency quasi-periodic oscillation with varying amplitude and slowly changing phase, together with asymmetric warm- and cold-event perturbations.

## Mathematical Definition

Define the Gaussian profile

```math
G(x;c,w)=
\exp\left[
-\frac{1}{2}
\left(
\frac{x-c}{w}
\right)^2
\right].
```

Define the varying oscillation amplitude by

```math
A(x)=
A_0+
A_M\sin(2\pi f_Mx+\delta_M).
```

Define the polynomial phase by

```math
\phi(x)=
2\pi
\left(
f_0x+\beta x^2
\right).
```

The quasi-periodic carrier is

```math
Q(x)=
A(x)\sin\phi(x).
```

Define the event component by

```math
E(x)=
\sum_{k=1}^{K}
a_kG(x;c_k,w_k).
```

Let the event centers, amplitudes, and widths be

```math
\mathbf{c}
=
(0.28,\,0.57,\,0.83),
```

```math
\mathbf{a}
=
(0.22,\,-0.18,\,0.25),
```

and

```math
\mathbf{w}
=
(0.06,\,0.07,\,0.045).
```

The signal is

```math
f(x)=
Q(x)+E(x).
```

[View ENSO Envelope](../../assets/images/TF221_ENSOEnvelope.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Climate variability |
| Structure | Amplitude-modulated polynomial-phase carrier plus three Gaussian events |
| Amplitude behavior | Slowly varying carrier amplitude governed by $A(x)$ |
| Phase behavior | Gradually changing instantaneous frequency through the quadratic phase term |
| Event behavior | Two positive and one negative localized perturbations |
| Regularity | Smooth, low-frequency, and nonstationary |
| Main challenge | Separating the evolving oscillation from asymmetric event structure |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_0$ | Mean carrier amplitude | 0.45 |
| $A_M$ | Amplitude-modulation magnitude | 0.20 |
| $f_M$ | Amplitude-modulation frequency | 0.75 |
| $\delta_M$ | Amplitude-modulation phase offset | 0.4 |
| $f_0$ | Initial carrier frequency coefficient | 2.1 |
| $\beta$ | Quadratic phase coefficient | 0.22 |
| $K$ | Number of localized events | 3 |
| $\mathbf{c}$ | Event centers | $(0.28,\,0.57,\,0.83)$ |
| $\mathbf{a}$ | Event amplitudes | $(0.22,\,-0.18,\,0.25)$ |
| $\mathbf{w}$ | Event widths | $(0.06,\,0.07,\,0.045)$ |

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

