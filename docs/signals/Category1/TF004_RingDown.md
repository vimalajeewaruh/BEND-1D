---
layout: default
title: TF004 — RingDown
---

# TF004 — RingDown

![RingDown signal](../assets/images/TF004_RingDown.png)

## Overview

The **RingDown** signal is a localized underdamped response beginning at $x=0.28$. Its oscillation amplitude decreases exponentially after onset. Similar morphology occurs in mechanical vibration, acoustic decay, resonant circuits, and magnetic-resonance transients.

## Mathematical Definition

$$
f(x)
=
I(x\geq0.28)
\exp\{-7(x-0.28)\}
\sin\{32\pi(x-0.28)\},
$$

where $I(\cdot)$ is the indicator function.

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Transients and ring-downs |
| Secondary tags | Localized, oscillatory, damped |
| Onset location | $x=0.28$ |
| Continuity | Continuous at onset |
| Envelope | Exponential decay |
| Main challenge | Preserving localization, phase, and decreasing amplitude |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $x_0$ | Onset location | 0.28 |
| $7$ | Exponential decay rate | 7 |
| $32\pi$ | Angular-frequency coefficient | $32\pi$ |

## MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
x0 = 0.28;
f = zeros(size(x));
idx = x >= x0;
u = x(idx)-x0;
f(idx) = exp(-7*u).*sin(32*pi*u);

plot(x,f,'LineWidth',1.4)
xlabel('x'); ylabel('f(x)');
title('TF004 — RingDown'); grid on
exportgraphics(gcf,'TF004_RingDown.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
x0 = 0.28
f = np.zeros_like(x)
idx = x >= x0
u = x[idx] - x0
f[idx] = np.exp(-7*u)*np.sin(32*np.pi*u)

plt.plot(x, f, linewidth=1.4)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF004 — RingDown")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF004_RingDown.png", dpi=300)
~~~

## Recommended Uses

- Localized oscillation recovery
- Estimation of onset, frequency, and damping
- Testing preservation of low-amplitude late oscillations
- Detection of phase distortion and artificial ringing

## Provenance

**Status:** Application-inspired deterministic morphology surrogate.

---

[← Previous: StickSlip](TF003_StickSlip.md) | [Signal Catalog](index.md) | [Next: DiffusionBand →](TF005_DiffusionBand.md)
