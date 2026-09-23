# Lorenz Wing Switch


## Overview

This signal is the normalized first coordinate of a numerically integrated Lorenz trajectory after a burn-in period. Oscillations within each attractor wing are interrupted by irregular sign-changing wing switches, producing deterministic chaotic multiscale structure.

## Mathematical Definition

The Lorenz system is

$$
\dot X=\sigma(Y-X),\qquad
\dot Y=X(\rho-Z)-Y,\qquad
\dot Z=XY-\beta Z,
$$

with

$$
(\sigma,\rho,\beta)=\left(10,28,\frac83\right),
\qquad (X_0,Y_0,Z_0)=(1,1,1).
$$

Fourth-order Runge–Kutta integration uses step $0.01$. After discarding $1200$ burn-in samples, retain $N=1024$ values $X_i$, center them, and normalize:

$$
f_i=\frac{X_i-\bar X}{\max_j|X_j-\bar X|}.
$$

[Lorenz Wing Switch](../../assets/images/TF175_LorenzWingSwitch.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Deterministic chaotic oscillation |
| Local structure | Smooth within-wing rotations |
| Regime changes | Irregular sign-changing wing switches |
| Range | Centered and normalized to maximum absolute value $1$ |
| Main challenge | Preserve nonperiodic structure without treating it as noise |

## Parameters

| Parameter | Value |
|---|---:|
| $\sigma$ | $10$ |
| $\rho$ | $28$ |
| $\beta$ | $8/3$ |
| RK4 step | $0.01$ |
| Burn-in | $1200$ samples |
| Retained length | $1024$ samples |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF175_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF175_python.md)



## Recommended Uses

- Denoising deterministic chaotic signals
- Regime-switch preservation
- Testing methods under broadband nonperiodic structure

## Provenance

This signal is generated from the standard Lorenz system using the stated deterministic initial condition and numerical convention.

[← Previous: MEMS Pull-In / Release](TF174_MEMSPullInRelease.md) · [Category 9 catalog](index.md) · [Next: Dyadic Phase Twins →](TF176_DyadicPhaseTwins.md)
