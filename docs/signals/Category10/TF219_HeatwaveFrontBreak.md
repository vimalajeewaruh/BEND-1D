# HeatwaveFrontBreak


## Overview

Temperature rises gradually toward a high plateau with increasingly visible diurnal oscillation, then collapses rapidly at a frontal passage.

## Mathematical Definition

With $L(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$,
$$
f(x)=0.18+0.72L(x;0.28,0.075)-0.82L(x;0.79,0.012)
+[0.02+0.05L(x;0.35,0.08)]\sin(18\pi x).
$$

[HeatwaveFrontBreak signal](../../assets/images/TF219_HeatwaveFrontBreak.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Climate |
| Structure | Two unequal logistic transitions plus amplitude-varying oscillation |
| Regularity | Smooth long trend with one sharp macroscopic break |
| Main challenge | Keep the abrupt break and low-amplitude diurnal structure |

## Parameters

| Parameter | Value |
|---|---|
| Rise center/width | $0.28/0.075$ |
| Break center/width | $0.79/0.012$ |
| Oscillation frequency | $9$ cycles/unit |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF219_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF219_python.md)



## Recommended Uses

- Regime-break localization
- Trend-plus-cycle denoising
- Climate-extreme morphology recovery

## Provenance

This is a deterministic benchmark surrogate inspired by climate measurement morphology. It is not a calibrated physical or environmental simulator.

[← Previous: AtmosphericRiver](TF218_AtmosphericRiver.md) · [Category 10 catalog](index.md) · [Next: DroughtRecovery →](TF220_DroughtRecovery.md)

