# FRBScatterTail


## Overview

The **FRBScatterTail** signal contains a narrow fast-radio-burst-like component with a one-sided scattering tail and a weaker nearby component that creates a partially unresolved doublet.

## Mathematical Definition

Define the exponentially modified Gaussian profile

```math
E(x;c,s,\tau)
=
\frac{1}{2}
\exp\left[
\frac{s^2}{2\tau^2}
-
\frac{x-c}{\tau}
\right]
\mathrm{erfc}\left[
\frac{s^2/\tau-(x-c)}
{\sqrt{2}\,s}
\right].
```

Define the primary and companion components by

```math
e_1(x)=E(x;c_1,s_1,\tau_1),
```

```math
e_2(x)=E(x;c_2,s_2,\tau_2).
```

For sampled positions $x_i$, define their discrete normalization factors by

```math
M_1=\max_i e_1(x_i),
\qquad
M_2=\max_i e_2(x_i).
```

The normalized signal is

```math
f(x)=
\frac{e_1(x)}{M_1}
+
A_2\frac{e_2(x)}{M_2}.
```

[View FRB Scatter Tail](../../assets/images/TF182_FRBScatterTail.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Radio astronomy |
| Primary family | Asymmetric localized pulse doublet |
| Signal type | Two normalized exponentially modified Gaussian pulses |
| Primary component | Narrow pulse with a long one-sided scattering tail |
| Companion component | Weaker nearby asymmetric pulse |
| Regularity | Smooth but strongly asymmetric and highly localized |
| Main challenge | Localizing the leading edges while preserving the long tails |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c_1$ | Primary pulse location | 0.310 |
| $s_1$ | Primary Gaussian width | 0.0045 |
| $\tau_1$ | Primary scattering-tail scale | 0.038 |
| $c_2$ | Companion pulse location | 0.347 |
| $s_2$ | Companion Gaussian width | 0.0032 |
| $\tau_2$ | Companion scattering-tail scale | 0.024 |
| $A_2$ | Companion weight | 0.42 |
| $M_1$ | Primary discrete normalization factor | $\max_i e_1(x_i)$ |
| $M_2$ | Companion discrete normalization factor | $\max_i e_2(x_i)$ |

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

