---
layout: default
title: TF023 — RabiChirp
---

# TF023 — RabiChirp

![RabiChirp signal](../assets/images/TF023_RabiChirp.png)

## Overview

The **RabiChirp** signal is a toy population probability for a chirped two-level quantum system. Its instantaneous oscillation frequency increases with $x$, while decoherence causes its amplitude to decrease. Fine-scale structure is therefore weakest where a denoising method is most likely to remove it.

## Mathematical Definition

For $0\leq x\leq1$,

$$
f(x)=
e^{-0.9x}
\sin^2\!\left[2\pi(3x+7x^2)\right].
$$

The phase is

$$
\theta(x)=2\pi(3x+7x^2),
$$

so its derivative increases linearly:

$$
\theta'(x)=2\pi(3+14x).
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Chirp with decaying amplitude |
| Signal type | Deterministic, oscillatory, and nonstationary |
| Frequency behavior | Increases with $x$ |
| Amplitude behavior | Decreases as $e^{-0.9x}$ |
| Continuity | Smooth |
| Main challenge | Retaining weak high-frequency structure late in the interval |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.9$ | Decoherence rate | 0.9 |
| $3$ | Linear phase coefficient | 3 |
| $7$ | Quadratic phase coefficient | 7 |

## MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);

f = exp(-0.9*x).*sin(2*pi*(3*x+7*x.^2)).^2;

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF023 — RabiChirp'); grid on
exportgraphics(gcf,'TF023_RabiChirp.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
f = np.exp(-0.9*x) * np.sin(2*np.pi*(3*x + 7*x**2))**2

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF023 — RabiChirp")
plt.grid(alpha=0.3); plt.tight_layout()
plt.savefig("TF023_RabiChirp.png", dpi=300)
~~~

## Recommended Uses

- Chirp denoising
- Time-varying frequency recovery
- Weak fine-scale preservation
- Decohering-oscillation analysis

## Provenance

**Status:** Chirped two-level-system-inspired deterministic surrogate.

---

[← Previous: Titration](TF022_Titration.md) | [Category 2 Catalog](index.md) | [Next: MuscleTwitch →](TF024_MuscleTwitch.md)

