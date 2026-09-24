# BubbleLogPeriodic


## Overview

A speculative-bubble surrogate develops accelerating log-periodic oscillations toward a critical time, then crashes abruptly and partially recovers with weak ringing.

## Mathematical Definition

Let $x_c=0.83$ and $t=\max(x_c-x,10^{-5})$. Then
$$
f(x)=1-1.05t^{0.55}[1+0.14\cos\{8.5\log t+0.4\}],
\qquad x<x_c.
$$
For $u=x-x_c\ge0$,
$$
f(x)=0.24+0.42(1-e^{-u/0.12})
+0.03e^{-12u}\sin(36\pi u).
$$

[BubbleLogPeriodic signal](../../assets/images/TF222_BubbleLogPeriodic.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Finance |
| Structure | Critical power law with log-periodicity and post-crash recovery |
| Regularity | Frequency compression followed by a discontinuous regime change |
| Main challenge | Preserve accelerating oscillations immediately before the crash |

## Parameters

| Parameter | Value |
|---|---|
| Critical time $x_c$ | $0.83$ |
| Power $m$ | $0.55$ |
| Log frequency | $8.5$ |
| Modulation depth | $0.14$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF222_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF222_python.md)




## Recommended Uses

- Critical-time signal denoising
- Crash localization
- Log-periodic precursor preservation

## Provenance

This is a deterministic benchmark surrogate inspired by finance measurement morphology. It is not a calibrated physical or financial simulator.

[← Previous: ENSOEnvelope](TF221_ENSOEnvelope.md) · [Category 10 catalog](index.md) · [Next: IntradayVolatilityU →](TF223_IntradayVolatilityU.md)

