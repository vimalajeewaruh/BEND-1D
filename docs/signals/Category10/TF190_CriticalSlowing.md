# CriticalSlowing


## Overview

Three similar perturbations relax with progressively longer time constants before a final abrupt regime transition and partial recovery.

## Mathematical Definition

Let $u_k=(x-c_k)_+$ with
$c=(0.16,0.38,0.60)$, $a=(0.35,0.33,0.30)$, and
$\tau=(0.025,0.060,0.120)$. With $L(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$,
$$
f(x)=0.10+0.04x+\sum_{k=1}^{3}I(x\ge c_k)a_ke^{-u_k/\tau_k}
-0.48L(x;0.83,0.006)+0.20L(x;0.89,0.025).
$$

[CriticalSlowing signal](../../assets/images/TF190_CriticalSlowing.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Dynamical systems |
| Structure | Causal exponential relaxations plus smooth terminal steps |
| Regularity | One-sided transients and sharp smooth transition |
| Main challenge | Recover systematic growth in the relaxation time |

## Parameters

| Parameter | Value |
|---|---|
| Event centers | $0.16,0.38,0.60$ |
| Decay scales | $0.025,0.060,0.120$ |
| Final transition | $0.83$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF190_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF190_python.md)



## Recommended Uses

- Early-warning morphology
- Relaxation-time estimation
- Transition preservation

## Provenance

This is a deterministic benchmark surrogate inspired by dynamical systems measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: SolitonCollision](TF189_SolitonCollision.md) · [Category 10 catalog](index.md) · [Next: BatteryKnee →](TF191_BatteryKnee.md)

