# BatteryKnee


## Overview

The **BatteryKnee** signal represents a long mild degradation trend that develops a smooth but pronounced knee followed by accelerated decline. The onset of the knee is intentionally subtle.

## Mathematical Definition

Define the soft-plus function

```math
s(x)=
\frac{
\log\left[1+\exp\left(\kappa(x-x_0)\right)\right]
}{\kappa}.
```

Define the normalized nonlinear degradation component by

```math
D(x)=
A_D
\left[
\frac{s(x)}{s(1)}
\right]^p.
```

The signal is

```math
f(x)=
b_0-mx-D(x).
```

[View Battery Knee](../../assets/images/TF191_BatteryKnee.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Energy storage |
| Structure | Linear degradation trend plus normalized soft-plus power |
| Knee behavior | Smooth transition from mild to accelerated degradation |
| Regularity | Globally smooth with strongly changing curvature |
| Main challenge | Preserving the onset and severity of the knee |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Initial normalized level | 1 |
| $m$ | Linear degradation rate | 0.18 |
| $x_0$ | Knee center | 0.64 |
| $\kappa$ | Knee sharpness | 26 |
| $A_D$ | Nonlinear degradation magnitude | 0.58 |
| $p$ | Nonlinear degradation power | 1.55 |

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

