# FuelCellFloodDry


## Overview

Three operating cycles contain rapid performance loss followed by slower recovery, with unequal amplitudes and recovery constants.

## Mathematical Definition

For each event let $u_k=(x-c_k)_+$. With the parameter vectors shown below,
$$
f(x)=0.82+0.03\sin(4\pi x)
-\sum_{k=1}^{3}I(x\ge c_k)a_k
(1-e^{-u_k/t_{f,k}})e^{-u_k/t_{s,k}}.
$$

[FuelCellFloodDry signal](../../assets/images/TF192_FuelCellFloodDry.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Energy systems |
| Structure | Baseline plus three negative asymmetric causal pulses |
| Regularity | Smooth but sharply activated and multirate |
| Main challenge | Preserve both rapid losses and long recovery tails |

## Parameters

| Parameter | Value |
|---|---|
| Event centers | $0.20,0.50,0.76$ |
| Loss amplitudes | $0.36,0.48,0.32$ |
| Fast scales | $0.010,0.012,0.008$ |
| Slow scales | $0.095,0.135,0.080$ |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF192_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF192_python.md)




## Recommended Uses

- Asymmetric event denoising
- Cycle-to-cycle comparison
- Tail-preserving recovery

## Provenance

This is a deterministic benchmark surrogate inspired by energy systems measurement morphology. It is not a calibrated physical simulator.

[← Previous: BatteryKnee](TF191_BatteryKnee.md) · [Category 10 catalog](index.md) · [Next: GNSSMultipathFade →](TF193_GNSSMultipathFade.md)

