# CheyneStokes

## Overview

The **CheyneStokes** signal consists of three respiratory episodes whose amplitudes gradually increase and decrease, separated by nearly quiescent apneic intervals. The weak breaths at the boundaries of each episode are especially vulnerable to aggressive thresholding.

## Mathematical Definition

For the episode intervals

$$
(a_k,b_k)\in\{(0,0.26),(0.34,0.60),(0.68,0.94)\},
$$

define the envelope

$$
E(x)=\sum_{k=1}^{3}
\mathbf{1}_{\{a_k\leq x\leq b_k\}}
\sin^{1.65}\!\left(\pi\frac{x-a_k}{b_k-a_k}\right).
$$

With

$$
\phi(x)=2\pi(12x+0.55x^2),
$$

the signal is

$$
f(x)=E(x)\left[\sin\phi(x)+0.13\sin\{2\phi(x)-0.35\}\right].
$$

[CheyneStokes signal](../../assets/images/TF030_CheyneStokes.png)


## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Repeated crescendo–decrescendo episodes |
| Number of episodes | 3 |
| Between episodes | Nearly zero-amplitude apnea |
| Carrier | Mildly chirped oscillation with weak harmonic |
| Main challenge | Retaining weak boundary breaths and true quiescent intervals |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $(a_k,b_k)$ | Episode intervals | $(0,0.26),(0.34,0.60),(0.68,0.94)$ |
| $1.65$ | Envelope exponent | 1.65 |
| $0.13$ | Harmonic amplitude | 0.13 |

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
