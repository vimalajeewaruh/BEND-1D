# CoughFlowBurst


## Overview

An explosive primary cough-flow onset is followed by two smaller bursts and an irregularly modulated decay.

## Mathematical Definition

For $u_k=(x-c_k)_+$,
$$
r_k(x)=I(x\ge c_k)\left(\frac{u_k}{\tau_k}\right)^{p_k}
\exp\left(p_k-\frac{u_k}{\tau_k}\right).
$$
The signal is
$$
f(x)=\left[\sum_{k=1}^{3}a_kr_k(x)\right]
[1+0.08\sin(46\pi x)].
$$

[CoughFlowBurst signal](../../assets/images/TF204_CoughFlowBurst.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Respiratory physiology |
| Structure | Three causal generalized gamma-like bursts with modulation |
| Regularity | Sharp asymmetric onsets and extended tails |
| Main challenge | Preserve high-dynamic-range onset and weak secondary events |

## Parameters

| Parameter | Value |
|---|---|
| Burst centers | $0.28,0.405,0.53$ |
| Amplitudes | $1.00,0.48,0.32$ |
| Shape powers | $1.2,1.4,1.1$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF204_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF204_python.md)



## Recommended Uses

- Respiratory-burst denoising
- Secondary-event preservation
- Asymmetric tail recovery

## Provenance

This is a deterministic benchmark surrogate inspired by respiratory physiology measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: PupilLightReflex](TF203_PupilLightReflex.md) · [Category 10 catalog](index.md) · [Next: DesaturationRecovery →](TF205_DesaturationRecovery.md)

