# T-Wave Alternans


## Overview

## Overview

The **TWaveAlternans** signal consists of five idealized cardiac beats sharing the same P–QRS structure, while successive T waves alternate subtly in amplitude. The small beat-to-beat difference is scientifically meaningful but easily lost when the sharp R peaks dominate a global error criterion.

## Mathematical Definition

Define the Gaussian function

```math
g(x;\mu,w)=
\exp\left[
-\frac12
\left(
\frac{x-\mu}{w}
\right)^2
\right].
```

Let the R-wave centers be

```math
\mathbf{r}
=
(0.110,\,0.305,\,0.500,\,0.695,\,0.890),
```

and let the T-wave amplitudes be

```math
\mathbf{A}
=
(0.300,\,0.270,\,0.300,\,0.270,\,0.300).
```

For each beat, define the P-wave component

```math
P_k(x)=
A_P g(x;r_k-\delta_P,w_P).
```

Define the Q-wave component

```math
Q_k(x)=
-A_Q g(x;r_k-\delta_Q,w_Q).
```

Define the R-wave component

```math
R_k(x)=
A_R g(x;r_k,w_R).
```

Define the S-wave component

```math
S_k(x)=
-A_S g(x;r_k+\delta_S,w_S).
```

Define the T-wave component

```math
T_k(x)=
A_k g(x;r_k+\delta_T,w_T).
```

The signal is

```math
f(x)=
\sum_{k=1}^{K}
\left[
P_k(x)+Q_k(x)+R_k(x)+S_k(x)+T_k(x)
\right].
```

[View T-Wave Alternans](../../assets/images/TF164_TWaveAlternans.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Repeated multiscale pulses |
| Signal type | Gaussian P–QRS–T components |
| Main structure | $K$ repeated cardiac beats |
| Dominant feature | Narrow R waves with amplitude $A_R$ |
| Weak feature | Alternating T-wave amplitudes specified by $\mathbf{A}$ |
| T-wave structure | Broad components displaced from the R waves by $\delta_T$ |
| Main challenge | Preserving subtle T-wave alternation next to sharp dominant peaks |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of cardiac beats | 5 |
| $\mathbf{r}$ | R-wave centers | $(0.110,\,0.305,\,0.500,\,0.695,\,0.890)$ |
| $\mathbf{A}$ | T-wave amplitudes | $(0.300,\,0.270,\,0.300,\,0.270,\,0.300)$ |
| $A_P$ | P-wave amplitude | 0.12 |
| $\delta_P$ | P-wave displacement before R wave | 0.060 |
| $w_P$ | P-wave width | 0.018 |
| $A_Q$ | Q-wave magnitude | 0.14 |
| $\delta_Q$ | Q-wave displacement before R wave | 0.012 |
| $w_Q$ | Q-wave width | 0.0050 |
| $A_R$ | R-wave amplitude | 1 |
| $w_R$ | R-wave width | 0.0042 |
| $A_S$ | S-wave magnitude | 0.25 |
| $\delta_S$ | S-wave displacement after R wave | 0.012 |
| $w_S$ | S-wave width | 0.0060 |
| $\delta_T$ | T-wave displacement after R wave | 0.070 |
| $w_T$ | T-wave width | 0.027 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF164_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF164_python.md)



## Recommended Uses

- Preservation of weak beat-to-beat variation
- Multiscale cardiac-waveform denoising
- Testing error metrics dominated by narrow peaks

## Provenance

This is a deterministic ECG-inspired test function, not a clinical recording or diagnostic model.

[← Previous: Auditory Brainstem Response](TF163_AuditoryBrainstemResponse.md) · [Category 9 catalog](index.md) · [Next: Turbulence Intermittency →](TF165_TurbulenceIntermittency.md)
