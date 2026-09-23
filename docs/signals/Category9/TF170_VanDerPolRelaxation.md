# Van der Pol Relaxation

## Overview

This signal is a normalized numerical trajectory of the Van der Pol oscillator in its relaxation regime. Long, slowly varying portions alternate with rapid transitions, producing a deterministic waveform with strongly unequal local time scales.

## Mathematical Definition

The state $(y_1,y_2)$ satisfies

$$
\frac{dy_1}{dt}=y_2,
\qquad
\frac{dy_2}{dt}=\mu(1-y_1^2)y_2-y_1,
\qquad \mu=7,
$$

with $y_1(0)=2$ and $y_2(0)=0$. The system is integrated over $0\le t\le20$ using $N=1024$ equally spaced samples and fourth-order Runge–Kutta steps. The test signal is

$$
f_i=\frac{y_1(t_i)}{\max_j|y_1(t_j)|}.
$$

[Van der Pol Relaxation](../../assets/images/TF170_VanDerPolRelaxation.png)


## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Nonlinear relaxation oscillation |
| Signal type | Numerically integrated ODE trajectory |
| Time scales | Slow branches and fast transitions |
| Range | Normalized to maximum absolute value $1$ |
| Main challenge | Avoid blurring rapid transitions or roughening slow branches |

## Parameters

| Parameter | Value | Meaning |
|---|---:|---|
| $\mu$ | $7$ | Nonlinearity/relaxation strength |
| Integration interval | $[0,20]$ | Native ODE time |
| $N$ | $1024$ | Number of samples |
| Initial state | $(2,0)$ | Starting condition |

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
