# FractureAE

## Overview

The **FractureAE** signal represents acoustic-emission activity during progressive material damage. Short pulses and damped resonances become more frequent and generally larger toward the failure end of the record.

## Mathematical Definition

The event times and amplitudes are

$$
t=(0.16,\,0.31,\,0.47,\,0.60,\,0.70,\,0.775,\,0.835,\,0.885,\,0.925,\,0.955),
$$

$$
A=(0.22,\,0.28,\,0.25,\,0.35,\,0.42,\,0.55,\,0.68,\,0.82,\,1.00,\,1.18).
$$

With $u_k=x-t_k$, define

$$
P_k(x)=0.45A_k\exp\left[-\frac{1}{2}\left(\frac{u_k}{0.0025}\right)^2\right].
$$

and

$$
R_k(x)=A_k I(u_k\geq 0)e^{-(30+8k)u_k}\sin\left(2\pi(45+4k)u_k\right).
$$

The signal is

$$
f(x)=\sum_{k=1}^{10}\left[P_k(x)+R_k(x)\right].
$$

[FractureAE signal](../../assets/images/TF054_FractureAE.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Accelerating sparse-to-dense burst activity |
| Number of events | 10 |
| Event trend | Generally increasing amplitude and frequency |
| Local structure | Narrow pulse followed by damped resonance |
| Main challenge | Adapting from sparse events to dense pre-failure activity |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.0025$ | Pulse width | 0.0025 |
| $30+8k$ | Event-dependent decay rate | As shown |
| $45+4k$ | Event-dependent frequency | As shown |


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
