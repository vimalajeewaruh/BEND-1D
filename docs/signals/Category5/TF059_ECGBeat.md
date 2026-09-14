# ECGBeat

## Overview

The **ECGBeat** signal represents one electrocardiographic beat. A small broad P wave is followed by a sharp QRS complex and a broader T wave, with weak baseline wander and a small ST-level feature.

## Mathematical Definition

Let

```math
G(x;\mu,s)=\exp\!\left[-\frac12\left(\frac{x-\mu}{s}\right)^2\right].
```

The baseline is $B(x)=0.018\sin(2.5\pi x)+0.010\sin(6.2\pi x+0.4).$

The waveform components are $P(x)=0.12G(x;0.18,0.030),$

$$
Q(x)=-0.16G(x;0.365,0.010),
$$

$$
R(x)=1.05G(x;0.392,0.0065),
$$

$$
S(x)=-0.28G(x;0.418,0.012),
$$

$$
T(x)=0.34G(x;0.68,0.060),
$$

and

$$
L(x)=0.045\left[
\frac{1}{1+e^{-90(x-0.455)}}-
\frac{1}{1+e^{-55(x-0.58)}}
\right].
$$

The signal is

$$
f(x)=B(x)+P(x)+Q(x)+R(x)+S(x)+L(x)+T(x).
$$

[ECGBeat signal](../../assets/images/TF059_ECGBeat.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiscale physiological waveform |
| Broad components | P and T waves |
| Narrow components | QRS complex |
| Additional feature | Weak ST-level interval |
| Main challenge | Preserving small broad waves and a very sharp R peak |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.0065$ | R-wave width | 0.0065 |
| $0.030$ | P-wave width | 0.030 |
| $0.060$ | T-wave width | 0.060 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF059_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF059_python.md)



## Recommended Uses

- ECG denoising
- QRS preservation
- Multiscale physiological feature recovery
- Low-amplitude P-, T-, and ST-feature detection

## Provenance

**Status:** Single-ECG-beat-inspired deterministic physiological surrogate.

---

[Category 5 Catalog](index.md) | [Next: ArterialPulse →](TF060_ArterialPulse.md)

