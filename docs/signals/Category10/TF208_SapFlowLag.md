# SapFlowLag


## Overview

Two unequal diurnal hydraulic pulses activate quickly and decay slowly against a weak background oscillation representing lagged forcing.

## Mathematical Definition

For $u_k=(x-c_k)_+$,
$$
f(x)=0.12+0.03\sin(4\pi x-0.4)
+\sum_{k=1}^{2}I(x\ge c_k)a_k
(1-e^{-u_k/t_{r,k}})e^{-u_k/t_{d,k}}.
$$

[SapFlowLag signal](../../assets/images/TF208_SapFlowLag.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Plant hydraulics |
| Structure | Two asymmetric causal pulses plus low-frequency forcing |
| Regularity | Smooth and recurrent but nonidentical |
| Main challenge | Preserve cycle-to-cycle differences and long lags |

## Parameters

| Parameter | Value |
|---|---|
| Pulse starts | $0.08,0.57$ |
| Amplitudes | $0.78,0.70$ |
| Rise scales | $0.040,0.050$ |
| Decay scales | $0.17,0.19$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF208_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF208_python.md)



## Recommended Uses

- Diurnal-cycle denoising
- Hydraulic-lag preservation
- Unequal repeated-event recovery

## Provenance

This is a deterministic benchmark surrogate inspired by plant hydraulics measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: StomatalClosure](TF207_StomatalClosure.md) · [Category 10 catalog](index.md) · [Next: LeafNyctinasty →](TF209_LeafNyctinasty.md)

