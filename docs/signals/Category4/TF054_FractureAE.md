# FractureAE

## Overview

The **FractureAE** signal represents acoustic-emission activity during progressive material damage. Short pulses and damped resonances become more frequent and generally larger toward the failure end of the record.

## Mathematical Definition

The event times and amplitudes are

```math
\mathbf{t}=(0.16,\,0.31,\,0.47,\,0.60,\,0.70,\,0.775,\,0.835,\,0.885,\,0.925,\,0.955),
```

```math
\mathbf{A}=(0.22,\,0.28,\,0.25,\,0.35,\,0.42,\,0.55,\,0.68,\,0.82,\,1.00,\,1.18).
```

With $u_k=x-t_k$, define the pulse component

```math
P_k(x)=c_PA_k
\exp\left[
-\frac12\left(\frac{u_k}{s_P}\right)^2
\right].
```

Define the damped resonance component

```math
R_k(x)=A_k I(u_k\geq0)
e^{-(\alpha_0+\alpha_1k)u_k}
\sin\left[2\pi(f_0+f_1k)u_k\right].
```

The signal is

```math
f(x)=\sum_{k=1}^{K}\left[P_k(x)+R_k(x)\right].
```

[View FractureAE signal](../../assets/images/TF054_FractureAE.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Accelerating sparse-to-dense burst activity |
| Number of events | $K$ |
| Event trend | Generally increasing amplitude and frequency |
| Local structure | Narrow pulse followed by damped resonance |
| Main challenge | Adapting from sparse events to dense pre-failure activity |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $K$ | Number of events | 10 |
| $\mathbf{t}$ | Event times | As specified |
| $\mathbf{A}$ | Event amplitudes | As specified |
| $c_P$ | Pulse amplitude scaling factor | 0.45 |
| $s_P$ | Pulse width | 0.0025 |
| $\alpha_0$ | Base resonance decay rate | 30 |
| $\alpha_1$ | Event-dependent decay increment | 8 |
| $f_0$ | Base resonance frequency | 45 |
| $f_1$ | Event-dependent frequency increment | 4 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF054_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF054_python.md)



## Recommended Uses

- Acoustic-emission denoising
- Pre-failure activity detection
- Sparse-to-dense adaptation
- Pulse-and-ring-down preservation

## Provenance

**Status:** Fracture-acoustic-emission-inspired deterministic measurement surrogate.

---

[← Previous: CyclicVoltammetry](TF053_CyclicVoltammetry.md) | [Category 4 Catalog](index.md) | [Next: Pharmacokinetic →](TF055_Pharmacokinetic.md)
