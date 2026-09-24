# YieldShockRecovery


## Overview

A drifting baseline experiences shocks of opposite sign, each followed by a mixture of fast and slow exponential mean reversion.

## Mathematical Definition

For $u_k=(x-c_k)_+$,
$$
f(x)=0.18+0.10x+\sum_{k=1}^{2}I(x\ge c_k)a_k
[0.72e^{-u_k/t_{1,k}}+0.28e^{-u_k/t_{2,k}}],
$$
with the parameter vectors listed below.

[YieldShockRecovery signal](../../assets/images/TF225_YieldShockRecovery.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Fixed income |
| Structure | Linear trend plus two signed causal biexponential shocks |
| Regularity | Abrupt value changes with long smooth tails |
| Main challenge | Preserve jumps while estimating two recovery scales |

## Parameters

| Parameter | Value |
|---|---|
| Shock times | $0.43,0.76$ |
| Shock amplitudes | $0.72,-0.32$ |
| Fast scales | $0.055,0.040$ |
| Slow scales | $0.24,0.14$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF226_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF226_python.md)



## Recommended Uses

- Jump-and-recovery denoising
- Signed shock preservation
- Multirate mean-reversion estimation

## Provenance

This is a deterministic benchmark surrogate inspired by fixed income measurement morphology. It is not a calibrated physical or financial simulator.

[← Previous: LiquidityDrought](TF224_LiquidityDrought.md) · [Category 10 catalog](index.md) · [Next: AnalyticNearPole →](TF226_AnalyticNearPole.md)

