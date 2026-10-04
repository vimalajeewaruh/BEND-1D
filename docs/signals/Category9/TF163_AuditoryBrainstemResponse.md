# Auditory Brainstem Response


## Overview

The **AuditoryBrainstemResponse** signal is a sequence of small, alternating negative-positive wave complexes inspired by an auditory brainstem response. The landmarks have unequal amplitudes and widths, and a very weak early component tests preservation of low-amplitude latency information.

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

Let the positive-peak centers be

```math
\boldsymbol{\mu}
=
(0.18,\,0.27,\,0.36,\,0.47,\,0.58,\,0.69,\,0.79),
```

with amplitudes

```math
\mathbf{a}
=
(0.18,\,0.15,\,0.24,\,0.19,\,0.31,\,0.13,\,0.10),
```

and widths

```math
\mathbf{w}
=
(0.010,\,0.012,\,0.011,\,0.013,\,0.014,\,0.015,\,0.016).
```

For each response landmark, define the negative-positive wave complex

```math
P_k(x)=
a_k
\left[
g(x;\mu_k,w_k)
-
\rho_N
g(x;\mu_k-\delta_N,\gamma_N w_k)
\right].
```

Define the weak early component

```math
E(x)=
A_E g(x;\mu_E,w_E).
```

The signal is

```math
f(x)=
\sum_{k=1}^{K}P_k(x)+E(x).
```

[View Auditory Brainstem Response](../../assets/images/TF163_AuditoryBrainstemResponse.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Sparse multipeak transient |
| Signal type | Alternating Gaussian wave complexes |
| Structure | $K$ unequal response landmarks |
| Negative components | Precede the positive peaks by $\delta_N$ and have relative amplitude $\rho_N$ |
| Weak feature | Small early peak centered at $\mu_E$ |
| Main challenge | Preserving latency, polarity, and unequal peak amplitudes |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of response landmarks | 7 |
| $\boldsymbol{\mu}$ | Positive-peak centers | $(0.18,\,0.27,\,0.36,\,0.47,\,0.58,\,0.69,\,0.79)$ |
| $\mathbf{a}$ | Positive-peak amplitudes | $(0.18,\,0.15,\,0.24,\,0.19,\,0.31,\,0.13,\,0.10)$ |
| $\mathbf{w}$ | Positive-peak widths | $(0.010,\,0.012,\,0.011,\,0.013,\,0.014,\,0.015,\,0.016)$ |
| $\delta_N$ | Preceding trough displacement | 0.020 |
| $\rho_N$ | Trough-to-peak amplitude ratio | 0.52 |
| $\gamma_N$ | Trough-to-peak width ratio | 1.15 |
| $A_E$ | Early-component amplitude | 0.03 |
| $\mu_E$ | Early-component center | 0.10 |
| $w_E$ | Early-component width | 0.006 |

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
