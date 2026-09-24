# ThermostatCycle


## Overview

Four asymmetric heating intervals are superimposed on slow thermal drift and a weak periodic component.

## Mathematical Definition

With $L(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$,
$$
f(x)=0.25+0.18x+0.025\sin(8\pi x)
+\sum_{k=1}^{4}a_k[L(x;o_k,0.018)-L(x;d_k,0.038)],
$$
where $o_k$ and $d_k$ are the on and off times.

[ThermostatCycle signal](../../assets/images/TF217_ThermostatCycle.png)


## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Building systems |
| Structure | Trend plus four unequal smooth finite-duration gates |
| Regularity | Smooth controller cycles with different heating/cooling rates |
| Main challenge | Preserve asymmetric transitions without flattening drift |

## Parameters

| Parameter | Value |
|---|---|
| On times | $0.05,0.28,0.52,0.76$ |
| Off times | $0.18,0.41,0.65,0.89$ |
| On width | $0.018$ |
| Off width | $0.038$ |

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

