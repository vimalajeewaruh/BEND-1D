# Lorenz Wing Switch


## Overview

The **LorenzWingSwitch** signal is the normalized first coordinate of a numerically integrated Lorenz trajectory after a burn-in period. Oscillations within each attractor wing are interrupted by irregular sign-changing wing switches, producing deterministic chaotic multiscale structure.

## Mathematical Definition

The Lorenz system is defined by

```math
\frac{dX}{dt}
=
\sigma(Y-X),
```

```math
\frac{dY}{dt}
=
X(\rho-Z)-Y,
```

```math
\frac{dZ}{dt}
=
XY-\beta Z.
```

The initial state is

```math
(X(0),Y(0),Z(0))
=
(X_0,Y_0,Z_0).
```

The system is numerically integrated using the fourth-order Runge--Kutta method with step size $h$. After discarding the first $N_B$ burn-in samples, retain $N$ values of the first coordinate,

```math
X_1,\ldots,X_N.
```

Define their sample mean by

```math
\bar X=
\frac{1}{N}
\sum_{i=1}^{N}X_i.
```

The centered and normalized test signal is

```math
f_i=
\frac{X_i-\bar X}
{\max_j |X_j-\bar X|},
\qquad
i=1,\ldots,N.
```

[View Lorenz Wing Switch](../../assets/images/TF175_LorenzWingSwitch.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Deterministic chaotic oscillation |
| Local structure | Smooth within-wing rotations |
| Regime changes | Irregular sign-changing wing switches |
| Dynamics | Controlled by the Lorenz parameters $\sigma$, $\rho$, and $\beta$ |
| Range | Centered and normalized to maximum absolute value $1$ |
| Main challenge | Preserving nonperiodic structure without treating it as noise |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $\sigma$ | Lorenz system parameter | 10 |
| $\rho$ | Lorenz system parameter | 28 |
| $\beta$ | Lorenz system parameter | $8/3$ |
| $X_0$ | Initial value of $X$ | 1 |
| $Y_0$ | Initial value of $Y$ | 1 |
| $Z_0$ | Initial value of $Z$ | 1 |
| $h$ | RK4 integration step size | 0.01 |
| $N_B$ | Number of discarded burn-in samples | 1200 |
| $N$ | Number of retained samples | 1024 |
| Integration method | Numerical ODE solver | Fourth-order Runge--Kutta |

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
