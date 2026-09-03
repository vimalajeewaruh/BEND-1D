---
layout: default
title: TF002 — Planck
---

# TF002 — Planck

![Planck signal](../assets/images/TF002_Planck.png)

## Overview

The **Planck** signal is a dimensionless black-body spectral profile. It is smooth but strongly asymmetric, with a steep rise, a single spectral maximum, and a gradually decreasing tail. It tests whether a denoiser can preserve rapidly varying curvature and peak geometry without introducing artificial discontinuities.

## Mathematical Definition

For $0\leq x\leq1$, define

$$
\lambda(x)=0.08+0.92x.
$$

The signal is

$$
f(x)=
\frac{\lambda(x)^{-5}}
{\exp\{2.5/\lambda(x)\}-1}.
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth global structure |
| Continuity | Continuous |
| Differentiability | Smooth on $[0,1]$ |
| Principal features | Steep rise, one maximum, long tail |
| Symmetry | Strongly asymmetric |
| Main challenge | Preserving strongly varying curvature |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.08$ | Lower value of $\lambda(x)$ | 0.08 |
| $0.92$ | Spectral-coordinate range | 0.92 |
| $2.5$ | Exponential shape constant | 2.5 |

## MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
lambda = 0.08 + 0.92*x;
f = lambda.^(-5) ./ expm1(2.5 ./ lambda);

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF002 — Planck'); grid on
exportgraphics(gcf,'TF002_Planck.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
lam = 0.08 + 0.92*x
f = lam**(-5) / np.expm1(2.5/lam)

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF002 — Planck")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF002_Planck.png", dpi=300)
~~~

## Recommended Uses

- Smooth asymmetric peak recovery
- Curvature preservation
- Peak-location and tail estimation
- Detection of artificial ringing or discontinuities

## Provenance

**Status:** Dimensionless Planck-type morphology surrogate. It is intended as a deterministic benchmark profile rather than a physically calibrated radiation spectrum.

---

[← Previous: Percolation](TF001_Percolation.md) | [Signal Catalog](index.md) | [Next: StickSlip →](TF003_StickSlip.md)
