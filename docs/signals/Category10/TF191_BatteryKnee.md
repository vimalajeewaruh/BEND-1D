# BatteryKnee


## Overview

A long mild degradation trend develops a smooth but pronounced knee followed by accelerated decline. The knee onset is intentionally subtle.

## Mathematical Definition

Let
$$
s(x)=\frac{\log[1+\exp\{\kappa(x-x_0)\}]}{\kappa},
\qquad \kappa=26,\quad x_0=0.64.
$$
The normalized degradation curve is
$$
f(x)=1-0.18x-0.58\left[\frac{s(x)}{s(1)}\right]^{1.55}.
$$

[BatteryKnee signal](../../assets/images/TF191_BatteryKnee.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Energy storage |
| Structure | Linear trend plus normalized soft-plus power |
| Regularity | Globally smooth with strongly changing curvature |
| Main challenge | Preserve the onset and severity of the knee |

## Parameters

| Parameter | Value |
|---|---|
| Knee center $x_0$ | $0.64$ |
| Sharpness $\kappa$ | $26$ |
| Power | $1.55$ |
| Nonlinear loss | $0.58$ |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF191_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF191_python.md)




## Recommended Uses

- Knee-point preservation
- Battery-health curve smoothing
- Curvature-change detection

## Provenance

This is a deterministic benchmark surrogate inspired by energy storage measurement morphology. It is not a calibrated physical simulator.

[← Previous: CriticalSlowing](TF190_CriticalSlowing.md) · [Category 10 catalog](index.md) · [Next: FuelCellFloodDry →](TF192_FuelCellFloodDry.md)

