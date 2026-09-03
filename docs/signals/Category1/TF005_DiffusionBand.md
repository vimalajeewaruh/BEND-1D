---
layout: default
title: TF005 — DiffusionBand
---

# TF005 — DiffusionBand

![DiffusionBand signal](../assets/images/TF005_DiffusionBand.png)

## Overview

The **DiffusionBand** signal represents a finite band bounded by two smooth diffusive interfaces. The left boundary is sharper than the right boundary, mimicking a concentration or temperature band whose interfaces have experienced different amounts of diffusion.

## Mathematical Definition

$$
f(x)
=
\frac{1}{2}
\left\{
\operatorname{erf}
\left(
\frac{x-0.28}{0.025}
\right)
-
\operatorname{erf}
\left(
\frac{x-0.72}{0.070}
\right)
\right\}.
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Piecewise-smooth and plateau structure |
| Secondary tags | Smooth interfaces, asymmetric edges, finite band |
| Continuity | Continuous |
| Differentiability | Smooth |
| Left transition width | 0.025 |
| Right transition width | 0.070 |
| Main challenge | Preserving two edges with different sharpness |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $\mu_L$ | Left-interface location | 0.28 |
| $w_L$ | Left-interface width | 0.025 |
| $\mu_R$ | Right-interface location | 0.72 |
| $w_R$ | Right-interface width | 0.070 |

## MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
f = 0.5*(erf((x-0.28)/0.025) - erf((x-0.72)/0.070));

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF005 — DiffusionBand'); grid on
exportgraphics(gcf,'TF005_DiffusionBand.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
from scipy.special import erf

N = 1024
x = np.linspace(0, 1, N)
f = 0.5*(erf((x-0.28)/0.025) - erf((x-0.72)/0.070))

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF005 — DiffusionBand")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF005_DiffusionBand.png", dpi=300)
~~~

## Recommended Uses

- Recovery of smooth plateau boundaries
- Comparison of sharp and diffuse transition preservation
- Testing edge-location bias
- Detection of artificial steps near smooth interfaces

## Provenance

**Status:** Diffusion-inspired deterministic morphology surrogate.

---

[← Previous: RingDown](TF004_RingDown.md) | [Signal Catalog](index.md) | [Next: Fano →](TF006_Fano.md)
