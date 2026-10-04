# Van der Pol Relaxation

## Overview

The **VanDerPolRelaxation** signal is a normalized numerical trajectory of the Van der Pol oscillator in its relaxation regime. Long, slowly varying portions alternate with rapid transitions, producing a deterministic waveform with strongly unequal local time scales.

## Mathematical Definition

The Van der Pol system is defined by

```math
\frac{dy_1}{dt}=y_2,
```

```math
\frac{dy_2}{dt}
=
\mu(1-y_1^2)y_2-y_1.
```

The initial conditions are

```math
y_1(0)=y_{1,0},
\qquad
y_2(0)=y_{2,0}.
```

The system is integrated over

```math
0\leq t\leq T
```

using $N$ equally spaced samples and fourth-order Runge--Kutta steps.

The normalized test signal is

```math
f_i=
\frac{y_1(t_i)}
{\max_j |y_1(t_j)|},
\qquad i=1,\ldots,N.
```

[View Van der Pol Relaxation](../../assets/images/TF170_VanDerPolRelaxation.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Nonlinear relaxation oscillation |
| Signal type | Numerically integrated ODE trajectory |
| Dynamics | Controlled by the nonlinearity parameter $\mu$ |
| Time scales | Slowly varying branches separated by rapid transitions |
| Range | Normalized to maximum absolute value $1$ |
| Main challenge | Avoiding blurring of rapid transitions while preventing roughness on slow branches |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $\mu$ | Nonlinearity and relaxation strength | 7 |
| $T$ | Final integration time | 20 |
| $N$ | Number of equally spaced samples | 1024 |
| $y_{1,0}$ | Initial value of $y_1$ | 2 |
| $y_{2,0}$ | Initial value of $y_2$ | 0 |
| Integration method | Numerical ODE solver | Fourth-order Runge--Kutta |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF170_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF170_python.md)


## Recommended Uses

- Strongly nonuniform smoothness tests
- Nonlinear oscillation denoising
- Transition-location and phase preservation

## Provenance

This function is generated from the standard Van der Pol system using the stated numerical convention; it is deterministic for the given parameters.

[← Previous: TGA Decomposition](TF169_TGADecomposition.md) · [Category 9 catalog](index.md) · [Next: Seismic Dispersive Wave →](TF171_SeismicDispersiveWave.md)
