# FRBScatterTail


## Overview

A narrow fast-radio-burst-like component has a one-sided scattering tail, and a weaker nearby component creates a partially unresolved doublet.

## Mathematical Definition

Define
$$
E(x;c,s,\tau)=\frac12
\exp\left\{\frac{s^2}{2\tau^2}-\frac{x-c}{\tau}\right\}
\mathrm{erfc}\left\{\frac{s^2/\tau-(x-c)}{\sqrt2\,s}\right\}.
$$
If $e_1=E(x;0.310,0.0045,0.038)$ and
$e_2=E(x;0.347,0.0032,0.024)$, then
$$
f(x)=\frac{e_1(x)}{\max_i e_1(x_i)}
+0.42\frac{e_2(x)}{\max_i e_2(x_i)}.
$$

[FRBScatterTail signal](../../assets/images/TF182_FRBScatterTail.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Radio astronomy |
| Structure | Two normalized exponentially modified Gaussian pulses |
| Regularity | Smooth but strongly asymmetric and highly localized |
| Main challenge | Localize the leading edges while preserving the long tails |

## Parameters

| Parameter | Value |
|---|---|
| Primary $(c,s,\tau)$ | $(0.310,0.0045,0.038)$ |
| Companion $(c,s,\tau)$ | $(0.347,0.0032,0.024)$ |
| Companion weight | $0.42$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF182_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF182_python.md)



## Recommended Uses

- Asymmetric transient denoising
- Close-event resolution
- One-sided tail preservation

## Provenance

This is a deterministic benchmark surrogate inspired by radio astronomy measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: GWChirpRingdown](TF181_GWChirpRingdown.md) · [Category 10 catalog](index.md) · [Next: PulsarGlitchRecovery →](TF183_PulsarGlitchRecovery.md)

