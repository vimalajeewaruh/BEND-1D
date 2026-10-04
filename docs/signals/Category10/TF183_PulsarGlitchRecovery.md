# PulsarGlitchRecovery

## Overview

The **PulsarGlitchRecovery** signal is a persistent pulsar-like oscillation that undergoes an abrupt frequency change followed by two recovery time scales while remaining continuous in phase.

## Mathematical Definition

Let the glitch occur at $c$.

For $x<c$, define the phase by

```math
\phi(x)=2\pi f_0x.
```

For $x\geq c$, let

```math
u=x-c,
```

and define the post-glitch phase by

```math
\phi(x)=
2\pi\left[
f_0x
+
\Delta f\,u
+
A_1\left(1-e^{-u/\tau_1}\right)
+
A_2\left(1-e^{-u/\tau_2}\right)
\right].
```

The signal is

```math
f(x)=\sin\left[\phi(x)\right].
```

[View Pulsar Glitch Recovery](../../assets/images/TF183_PulsarGlitchRecovery.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Astrophysics |
| Primary family | Oscillation with frequency glitch and recovery |
| Structure | Persistent sinusoid with a post-glitch nonlinear phase law |
| Glitch event | Abrupt local-frequency change at $c$ |
| Recovery | Two exponential recovery time scales $\tau_1$ and $\tau_2$ |
| Regularity | Continuous amplitude and phase across the glitch |
| Main challenge | Retaining a subtle change in oscillatory dynamics |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c$ | Glitch time | 0.43 |
| $f_0$ | Pre-glitch frequency | 9 |
| $\Delta f$ | Persistent frequency increment | 2.4 |
| $A_1$ | Fast-recovery phase coefficient | 0.22 |
| $\tau_1$ | Fast recovery time scale | 0.03 |
| $A_2$ | Slow-recovery phase coefficient | 0.16 |
| $\tau_2$ | Slow recovery time scale | 0.18 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF183_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF183_python.md)



## Recommended Uses

- Phase-preserving denoising
- Glitch detection
- Multirate recovery estimation

## Provenance

This is a deterministic benchmark surrogate inspired by astrophysics measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: FRBScatterTail](TF182_FRBScatterTail.md) · [Category 10 catalog](index.md) · [Next: MagnetarBurstStorm →](TF184_MagnetarBurstStorm.md)

