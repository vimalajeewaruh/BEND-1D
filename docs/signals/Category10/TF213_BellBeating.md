# BellBeating


## Overview

Two closely spaced modes produce a long-lived beat envelope, while a third higher mode decays much more rapidly.

## Mathematical Definition

The signal is
$$
f(x)=e^{-2.3x}\{\sin(22\pi x)+0.92\sin(23.5\pi x+0.12)\}
+0.35e^{-6.9x}\sin(2\pi27.3x+0.5).
$$

[BellBeating signal](../../assets/images/TF213_BellBeating.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Music/acoustics |
| Structure | Three damped sinusoids with a close-frequency pair |
| Regularity | Smooth, oscillatory, and nonstationary |
| Main challenge | Preserve the perceptually important beat envelope |

## Parameters

| Parameter | Value |
|---|---|
| Close frequencies | $11,11.75$ |
| Shared decay rate | $2.3$ |
| Third frequency/decay | $27.3/6.9$ |

## MATLAB Implementation



## Python Implementation



## Recommended Uses

- Beat-envelope recovery
- Close-mode preservation
- Decaying acoustic-signal denoising

## Provenance

This is a deterministic benchmark surrogate inspired by music/acoustics measurement morphology. It is not a calibrated physical or environmental simulator.

[← Previous: GuitarPluckDualDecay](TF212_GuitarPluckDualDecay.md) · [Category 10 catalog](index.md) · [Next: DrumModePacket →](TF214_DrumModePacket.md)

