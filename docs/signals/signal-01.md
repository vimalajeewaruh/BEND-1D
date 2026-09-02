---
layout: default
title: Signal 1
permalink: /signals/signal-01/
---

# Signal 1

![Signal 1]({{ "/assets/images/signal-01.png" | relative_url }})

## Overview

Signal 1 is a smooth, slowly varying signal designed to evaluate how
well a statistical or signal-processing method preserves gradual
changes without introducing artificial oscillations.

## Mathematical Definition

For \(0 \leq t \leq 1\), define

\[
f(t)=\sin(2\pi \omega t+\phi),
\]

where:

- \(\omega\) is the frequency;
- \(\phi\) is the phase;
- \(t\) is the normalized time index.

## Morphological Characteristics

| Property | Description |
|---|---|
| Family | Smooth and oscillatory |
| Continuity | Continuous |
| Differentiability | Infinitely differentiable |
| Discontinuities | None |
| Localized features | None |
| Oscillatory behavior | Yes |
| Primary challenge | Preserving amplitude and phase |

## Parameters

| Parameter | Description | Default |
|---|---|---:|
| `n` | Number of observations | 1024 |
| `frequency` | Number of oscillations | 3 |
| `phase` | Phase shift | 0 |
| `amplitude` | Amplitude multiplier | 1 |

## MATLAB Example

```matlab
n = 1024;
t = linspace(0,1,n);
frequency = 3;
x = sin(2*pi*frequency*t);

plot(t,x,'LineWidth',1.5)
xlabel('Time')
ylabel('Amplitude')
title('Signal 1')
grid on
