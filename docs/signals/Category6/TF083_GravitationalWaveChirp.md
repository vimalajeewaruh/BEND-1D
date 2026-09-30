# GravitationalWaveChirp

## Overview

The **GravitationalWaveChirp** signal has simultaneous amplitude and frequency acceleration toward a merger-like event, followed by a short damped ring-down.

## Mathematical Definition

Define the smooth step

```math
s(x;c,w)=\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the active chirp window

```math
W(x)=s(x;c_1,w_1)-s(x;c_2,w_2).
```

Define the chirp phase

```math
\phi(x)=2\pi
\left(
f_0x+\beta_2x^2+\beta_4x^4+\beta_7x^7
\right).
```

Define the increasing chirp amplitude

```math
A(x)=A_0+A_1x^p.
```

The active chirp component is

```math
C(x)=W(x)A(x)\sin\phi(x).
```

Define the post-merger ring-down, for $x\geq c_2$, as

```math
R(x)=A_Re^{-\alpha_R(x-c_2)}
\sin\left[
2\pi f_R(x-c_2)+\delta_R
\right],
```

with $R(x)=0$ for $x<c_2$.

The signal is

```math
f(x)=C(x)+R(x).
```

[View GravitationalWaveChirp signal](../../assets/images/TF083_GravitationalWaveChirp.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Accelerating chirp and damped ring-down |
| Active chirp | Approximately $c_1<x<c_2$ |
| Merger/ring-down time | $x=c_2$ |
| Nonstationarity | Rapidly changing frequency and amplitude |
| Main challenge | Preserving merger-localized fine scales and post-event ringing |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c_1$ | Chirp onset location | 0.10 |
| $c_2$ | Merger/ring-down location | 0.79 |
| $w_1,w_2$ | Chirp-window transition widths | 0.018, 0.010 |
| $f_0$ | Initial chirp phase coefficient | 5 |
| $\beta_2$ | Quadratic phase coefficient | 4 |
| $\beta_4$ | Quartic phase coefficient | 18 |
| $\beta_7$ | Seventh-order phase coefficient | 38 |
| $A_0$ | Initial chirp amplitude | 0.06 |
| $A_1$ | Chirp amplitude-growth coefficient | 0.62 |
| $p$ | Chirp amplitude-growth exponent | 2.8 |
| $A_R$ | Ring-down amplitude | 0.70 |
| $\alpha_R$ | Ring-down decay rate | 15 |
| $f_R$ | Ring-down cycle frequency | 52 |
| $\delta_R$ | Ring-down phase shift | 0.3 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF083_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF083_python.md)



## Recommended Uses

- Chirp denoising
- Time-varying frequency recovery
- Ring-down preservation

## Provenance

**Status:** Compact-binary-waveform-inspired deterministic surrogate; not a physical simulator.

---

[← Previous: PulsarProfile](TF082_PulsarProfile.md) | [Category 6 Catalog](index.md) | [Next: MicrolensingPlanet →](TF084_MicrolensingPlanet.md)
