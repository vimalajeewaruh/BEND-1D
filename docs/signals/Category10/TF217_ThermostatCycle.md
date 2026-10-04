# ThermostatCycle


## Overview

The **ThermostatCycle** signal contains four asymmetric heating intervals superimposed on slow thermal drift and a weak periodic component.

## Mathematical Definition

Define the logistic transition

```math
L(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the slowly varying thermal background by

```math
B(x)=
b_0+mx+
A_B\sin(2\pi f_Bx).
```

For $k=1,\ldots,K$, define the heating-cycle component by

```math
H_k(x)=
a_k
\left[
L(x;o_k,w_{\mathrm{on}})
-
L(x;d_k,w_{\mathrm{off}})
\right].
```

Let the heating on-times be

```math
\mathbf{o}
=
(0.05,\,0.28,\,0.52,\,0.76),
```

and the corresponding off-times be

```math
\mathbf{d}
=
(0.18,\,0.41,\,0.65,\,0.89).
```

The signal is

```math
f(x)=
B(x)+
\sum_{k=1}^{K}H_k(x).
```

[View Thermostat Cycle](../../assets/images/TF217_ThermostatCycle.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Building systems |
| Structure | Trend plus four unequal smooth finite-duration gates |
| Heating behavior | Rapid activation followed by slower thermal decay |
| Cycle behavior | Four heating intervals with potentially unequal amplitudes |
| Background behavior | Slow linear drift with a weak periodic component |
| Regularity | Smooth controller cycles with different heating and cooling rates |
| Main challenge | Preserving asymmetric transitions without flattening the drift |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline thermal level | 0.25 |
| $m$ | Thermal drift slope | 0.18 |
| $A_B$ | Background oscillation amplitude | 0.025 |
| $f_B$ | Background oscillation frequency | 4 |
| $K$ | Number of heating intervals | 4 |
| $\mathbf{o}$ | Heating on-times | $(0.05,\,0.28,\,0.52,\,0.76)$ |
| $\mathbf{d}$ | Heating off-times | $(0.18,\,0.41,\,0.65,\,0.89)$ |
| $\mathbf{a}$ | Heating-cycle amplitudes | Specified in implementation |
| $w_{\mathrm{on}}$ | Heating-on transition width | 0.018 |
| $w_{\mathrm{off}}$ | Heating-off transition width | 0.038 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF217_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF217_python.md)



## Recommended Uses

- Controller-cycle denoising
- Asymmetric edge preservation
- Trend-plus-cycle separation

## Provenance

This is a deterministic benchmark surrogate inspired by building systems measurement morphology. It is not a calibrated physical or environmental simulator.

[← Previous: ElevatorRide](TF216_ElevatorRide.md) · [Category 10 catalog](index.md) · [Next: AtmosphericRiver →](TF218_AtmosphericRiver.md)

