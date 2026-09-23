# T-Wave Alternans


## Overview

Five idealized cardiac beats share the same P–QRS structure, while successive T waves alternate subtly in amplitude. The small beat-to-beat difference is scientifically meaningful but easily lost when the sharp R peaks dominate a global error criterion.

## Mathematical Definition

Let

$$
g(x;\mu,w)=\exp\left[-\frac12\left(\frac{x-\mu}{w}\right)^2\right].
$$

For R-wave centers

$$
r=(0.110,0.305,0.500,0.695,0.890)
$$

and alternating T-wave amplitudes

$$
A=(0.300,0.270,0.300,0.270,0.300),
$$

define

$$
\begin{aligned}
f(x)=\sum_{k=1}^{5}\big[&0.12g(x;r_k-0.060,0.018)
-0.14g(x;r_k-0.012,0.0050)\\
&+g(x;r_k,0.0042)-0.25g(x;r_k+0.012,0.0060)
+A_k g(x;r_k+0.070,0.027)\big].
\end{aligned}
$$

[T-Wave Alternans](../../assets/images/TF164_TWaveAlternans.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Repeated multiscale pulses |
| Signal type | Gaussian P–QRS–T components |
| Dominant feature | Narrow unit-amplitude R waves |
| Weak feature | Alternating T-wave amplitudes $0.30$ and $0.27$ |
| Main challenge | Preserve subtle alternation next to sharp dominant peaks |

## Parameters

| Parameter | Value | Meaning |
|---|---|---|
| $r_k$ | listed above | R-wave centers |
| $A_k$ | listed above | T-wave amplitudes |
| T-wave offset | $0.070$ | Displacement from R wave |
| T-wave width | $0.027$ | Broad T-wave scale |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0164_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0164_python.md)



## Recommended Uses

- Preservation of weak beat-to-beat variation
- Multiscale cardiac-waveform denoising
- Testing error metrics dominated by narrow peaks

## Provenance

This is a deterministic ECG-inspired test function, not a clinical recording or diagnostic model.

[← Previous: Auditory Brainstem Response](TF163_AuditoryBrainstemResponse.md) · [Category 9 catalog](index.md) · [Next: Turbulence Intermittency →](TF165_TurbulenceIntermittency.md)
