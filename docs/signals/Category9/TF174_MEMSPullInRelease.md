# MEMS Pull-In / Release


## Overview

This MEMS-inspired displacement curve contains nonlinear approach, abrupt pull-in to a high plateau, a weak oscillation on the held state, and abrupt release followed by damped ringing. It is a compact hysteretic switching benchmark.

## Mathematical Definition

For $0\le x\le1$,

$$
f(x)=
\begin{cases}
0.06+0.56u^2+0.12u^5,\quad u=x/0.42, & x<0.42,\\
0.98+0.025\sin\left(4\pi\dfrac{x-0.42}{0.28}\right), & 0.42\le x<0.70,\\
0.24\left(1-\dfrac{x-0.70}{0.30}\right)+0.05
+0.15e^{-16v}\sin(68\pi v),\quad v=x-0.70, & x\ge0.70.
\end{cases}
$$

[MEMS Pull-In / Release](../../assets/images/TF174_MEMSPullInRelease.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Hysteretic switching trajectory |
| Smooth portion | Nonlinear pre-pull-in loading |
| Discrete events | Pull-in and release jumps |
| Local oscillation | Weak plateau ripple and release ringing |
| Main challenge | Preserve jumps without erasing adjacent oscillation |

## Parameters

| Parameter | Value | Meaning |
|---|---:|---|
| Pull-in location | $0.42$ | Transition to held state |
| Release location | $0.70$ | Transition to return branch |
| Ring-down rate | $16$ | Post-release decay |
| Ring-down frequency | $34$ cycles/unit | Post-release oscillation |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF174_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF174_python.md)



## Recommended Uses

- Hysteretic switch denoising
- Jump localization with nearby ring-down
- Mixed smooth and discontinuous morphology

## Provenance

This deterministic waveform is inspired by qualitative MEMS pull-in and release behavior. It is not a device-specific electromechanical model.

[← Previous: Transformer Inrush](TF173_TransformerInrush.md) · [Category 9 catalog](index.md) · [Next: Lorenz Wing Switch →](TF175_LorenzWingSwitch.md)
