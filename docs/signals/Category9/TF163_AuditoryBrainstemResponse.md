# Auditory Brainstem Response


## Overview

This signal is a sequence of small, alternating negative-positive wave complexes inspired by an auditory brainstem response. The landmarks have unequal amplitudes and widths, and a very weak early component tests preservation of low-amplitude latency information.

## Mathematical Definition

Let

$$
g(x;\mu,w)=\exp\left[-\frac12\left(\frac{x-\mu}{w}\right)^2\right].
$$

With

$$
\mu=(0.18,0.27,0.36,0.47,0.58,0.69,0.79),
$$

$$
a=(0.18,0.15,0.24,0.19,0.31,0.13,0.10),
$$

and

$$
w=(0.010,0.012,0.011,0.013,0.014,0.015,0.016),
$$

the signal is

$$
f(x)=\sum_{k=1}^{7}a_k\left[g(x;\mu_k,w_k)-0.52g(x;\mu_k-0.020,1.15w_k)\right]
+0.03g(x;0.10,0.006).
$$

[Auditory Brainstem Response](../../assets/images/TF163_AuditoryBrainstemResponse.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Sparse multipeak transient |
| Signal type | Alternating Gaussian components |
| Structure | Seven unequal response landmarks |
| Weak feature | Small early peak near $x=0.10$ |
| Main challenge | Preserve latency, polarity, and unequal peak amplitudes |

## Parameters

| Parameter | Value | Meaning |
|---|---|---|
| $\mu_k$ | listed above | Positive-peak centers |
| $a_k$ | listed above | Positive-peak amplitudes |
| $w_k$ | listed above | Positive-peak widths |
| Negative offset | $0.020$ | Preceding trough displacement |
| Negative scale | $0.52$ | Trough-to-peak amplitude ratio |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF163_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF163_python.md)



## Recommended Uses

- Small transient and latency preservation
- Unequal peak recovery
- Biomedical evoked-response denoising

## Provenance

This deterministic waveform is inspired by qualitative ABR morphology. It is not patient data and is not intended for diagnosis.

[← Previous: Diffusion MRI IVIM](TF162_DiffusionMRIIVIM.md) · [Category 9 catalog](index.md) · [Next: T-Wave Alternans →](TF164_TWaveAlternans.md)
