# ECGBeat

## Overview

The **ECGBeat** signal represents one electrocardiographic beat. A small broad P wave is followed by a sharp QRS complex and a broader T wave, with weak baseline wander and a small ST-level feature.

## Mathematical Definition

Define the Gaussian component

```math
G(x;\mu,s)=
\exp\left[
-\frac12\left(\frac{x-\mu}{s}\right)^2
\right].
```

Define the baseline component

```math
B(x)=A_{B1}\sin(\omega_{B1}x)
+A_{B2}\sin(\omega_{B2}x+\delta_B).
```

The waveform components are

```math
P(x)=A_PG(x;\mu_P,s_P),
```

```math
Q(x)=-A_QG(x;\mu_Q,s_Q),
```

```math
R(x)=A_RG(x;\mu_R,s_R),
```

```math
S(x)=-A_SG(x;\mu_S,s_S),
```

and

```math
T(x)=A_TG(x;\mu_T,s_T).
```

Define the ST-level component

```math
L(x)=A_L
\left[
\frac{1}{1+e^{-k_1(x-x_1)}}
-
\frac{1}{1+e^{-k_2(x-x_2)}}
\right].
```

The signal is

```math
f(x)=B(x)+P(x)+Q(x)+R(x)+S(x)+L(x)+T(x).
```

[View ECGBeat signal](../../assets/images/TF059_ECGBeat.png)

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
| $A_{B1},A_{B2}$ | Baseline oscillation amplitudes | 0.018, 0.010 |
| $\omega_{B1},\omega_{B2}$ | Baseline angular frequencies | $2.5\pi,6.2\pi$ |
| $\delta_B$ | Baseline phase shift | 0.4 |
| $A_P$ | P-wave amplitude | 0.12 |
| $\mu_P$ | P-wave center | 0.18 |
| $s_P$ | P-wave width | 0.030 |
| $A_Q$ | Q-wave magnitude | 0.16 |
| $\mu_Q$ | Q-wave center | 0.365 |
| $s_Q$ | Q-wave width | 0.010 |
| $A_R$ | R-wave amplitude | 1.05 |
| $\mu_R$ | R-wave center | 0.392 |
| $s_R$ | R-wave width | 0.0065 |
| $A_S$ | S-wave magnitude | 0.28 |
| $\mu_S$ | S-wave center | 0.418 |
| $s_S$ | S-wave width | 0.012 |
| $A_T$ | T-wave amplitude | 0.34 |
| $\mu_T$ | T-wave center | 0.68 |
| $s_T$ | T-wave width | 0.060 |
| $A_L$ | ST-level amplitude | 0.045 |
| $x_1,x_2$ | ST-level interval locations | 0.435, 0.58 |
| $k_1,k_2$ | ST-level transition sharpness | 90, 55 |

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

