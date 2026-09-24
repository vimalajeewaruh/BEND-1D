# NetworkCongestionBurst


## Overview

A smooth load increase approaches saturation, then a gated sawtooth queue-burst train appears before a final release.

## Mathematical Definition

With $L(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$,
$$
b(x)=0.15+0.78L(x;0.22,0.065)-0.62L(x;0.82,0.035),
$$
$$
g(x)=L(x;0.46,0.010)-L(x;0.78,0.010),\quad
q=18(x-0.46),\quad r=2(q-\lfloor q\rfloor)-1,
$$
and $f(x)=b(x)+0.17g(x)r(x)$.

[NetworkCongestionBurst signal](../../assets/images/TF199_NetworkCongestionBurst.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Networks |
| Structure | Two logistic load transitions plus bounded sawtooth train |
| Regularity | Smooth trend combined with repeated nonsmooth resets |
| Main challenge | Separate queue bursts from the evolving load curve |

## Parameters

| Parameter | Value |
|---|---|
| Burst interval | approximately $0.46$–$0.78$ |
| Sawtooth rate | $18$ cycles/unit |
| Burst amplitude | $0.17$ |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF199_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF199_python.md)


## Recommended Uses

- Congestion-burst recovery
- Trend-plus-reset denoising
- Saturation transition preservation

## Provenance

This is a deterministic benchmark surrogate inspired by networks measurement morphology. It is not a calibrated physical simulator.

[← Previous: ValveChatter](TF198_ValveChatter.md) · [Category 10 catalog](index.md) · [Next: ThermalThrottle →](TF200_ThermalThrottle.md)

