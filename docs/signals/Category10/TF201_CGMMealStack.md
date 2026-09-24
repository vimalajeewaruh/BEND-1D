# CGMMealStack


## Overview

Four asymmetric meal responses begin before previous responses return to baseline, producing shoulders and partially hidden peaks rather than isolated events.

## Mathematical Definition

For $u_k=(x-c_k)_+$, define
$$
r_k(x)=I(x\ge c_k)\frac{u_k}{\tau_k}
\exp\left(1-\frac{u_k}{\tau_k}\right).
$$
With the vectors in the parameter table,
$$
f(x)=0.20+0.03\sin(2\pi x)+\sum_{k=1}^{4}a_kr_k(x).
$$

[CGMMealStack signal](../../assets/images/TF201_CGMMealStack.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Biomedical monitoring |
| Structure | Baseline plus overlapping gamma-like causal responses |
| Regularity | Continuous with sharp causal onsets and long tails |
| Main challenge | Resolve stacked events and preserve shoulders |

## Parameters

| Parameter | Value |
|---|---|
| Meal times | $0.16,0.36,0.54,0.69$ |
| Amplitudes | $0.48,0.62,0.45,0.70$ |
| Time scales | $0.075,0.095,0.080,0.110$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF201_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF201_python.md)


## Recommended Uses

- Overlapping-event recovery
- Shoulder preservation
- Continuous-monitoring denoising

## Provenance

This is a deterministic benchmark surrogate inspired by biomedical monitoring measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: ThermalThrottle](TF200_ThermalThrottle.md) · [Category 10 catalog](index.md) · [Next: SleepSpindleKComplex →](TF202_SleepSpindleKComplex.md)

