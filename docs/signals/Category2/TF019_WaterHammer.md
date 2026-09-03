---
layout: default
title: TF019 — WaterHammer
---

# TF019 — WaterHammer

![WaterHammer signal](../assets/images/TF019_WaterHammer.png)

## Overview

The **WaterHammer** signal models a steep hydraulic front followed by damped acoustic ringing. It combines a rapid transition with persistent but decreasing high-frequency structure.

## Mathematical Definition

For $0\leq x\leq1$, let $u=x-0.30$. Then

$$
f(x)=
0.65\left[1+\tanh\{120(x-0.30)\}\right]
+0.38\mathbf{1}_{\{x\geq0.30\}}e^{-6u}\cos(54\pi u).
$$

The indicator $\mathbf{1}_{\{x\geq0.30\}}$ activates the acoustic response at the hydraulic-front location.

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Rapid front with damped resonance |
| Signal type | Deterministic and nonstationary |
| Front location | $x=0.30$ |
| Post-front behavior | Exponentially damped oscillation |
| Continuity | Contains an activated oscillatory component at the front |
| Main challenge | Preserving high-frequency ringing near a steep transition |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $x_c$ | Front location | 0.30 |
| $120$ | Front sharpness | 120 |
| $6$ | Ringing decay rate | 6 |
| $54\pi$ | Ringing angular frequency | $54\pi$ |

## MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
xc = 0.30;
u = x-xc;

f = 0.65*(1+tanh(120*u)) ...
    + 0.38*(x>=xc).*exp(-6*u).*cos(54*pi*u);

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF019 — WaterHammer'); grid on
exportgraphics(gcf,'TF019_WaterHammer.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
xc = 0.30
u = x - xc

f = (0.65 * (1 + np.tanh(120*u))
     + 0.38 * (x >= xc) * np.exp(-6*u) * np.cos(54*np.pi*u))

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF019 — WaterHammer")
plt.grid(alpha=0.3); plt.tight_layout()
plt.savefig("TF019_WaterHammer.png", dpi=300)
~~~

## Recommended Uses

- Front preservation
- Damped-resonance recovery
- Transient oscillation denoising
- Joint edge-and-texture evaluation

## Provenance

**Status:** Hydraulic-transient-inspired deterministic surrogate.

---

[← Previous: Cantilever](TF018_Cantilever.md) | [Category 2 Catalog](index.md) | [Next: ThermalRunaway →](TF020_ThermalRunaway.md)

