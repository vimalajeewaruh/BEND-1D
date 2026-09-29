# CheyneStokes

## Overview

The **CheyneStokes** signal consists of three respiratory episodes whose amplitudes gradually increase and decrease, separated by nearly quiescent apneic intervals. The weak breaths at the boundaries of each episode are especially vulnerable to aggressive thresholding.

## Mathematical Definition

For the episode intervals $(a_k,b_k)$, $k=1,\ldots,K$, define the envelope

```math
E(x)=
\sum_{k=1}^{K}
I(a_k\leq x\leq b_k)
\sin^p\left(
\pi\frac{x-a_k}{b_k-a_k}
\right),
```

where $I(\cdot)$ is the indicator function.

Define the phase

```math
\phi(x)=2\pi(f_0x+\beta x^2).
```

The signal is

```math
f(x)=
E(x)
[\sin\phi(x)+A_h\sin(2\phi(x)-\delta)].
```

[CheyneStokes signal](../../assets/images/TF030_CheyneStokes.png)


## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Repeated crescendo–decrescendo episodes |
| Number of episodes | $K$ |
| Between episodes | Nearly zero-amplitude apnea |
| Carrier | Mildly chirped oscillation with weak harmonic |
| Main challenge | Retaining weak boundary breaths and true quiescent intervals |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $K$ | Number of episodes | 3 |
| $(a_k,b_k)$ | Episode intervals | $(0,0.26),(0.34,0.60),(0.68,0.94)$ |
| $p$ | Envelope exponent | 1.65 |
| $f_0$ | Linear phase coefficient | 12 |
| $\beta$ | Quadratic phase coefficient | 0.55 |
| $A_h$ | Harmonic amplitude | 0.13 |
| $\delta$ | Harmonic phase shift | 0.35 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF030_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF030_python.md)



## Recommended Uses

- Envelope-preserving denoising
- Apnea-interval recovery
- Weak-oscillation preservation
- Recurrent nonstationary respiration analysis

## Provenance

**Status:** Cheyne–Stokes-respiration-inspired deterministic surrogate.

---

[← Previous: PVCTrain](TF029_PVCTrain.md) | [Category 3 Catalog](index.md) | [Next: EEGBurstSuppress →](TF031_EEGBurstSuppress.md)
