# Percolation

The **Percolation** signal represents a critical onset at a specified threshold. It is zero below the threshold and follows a fractional power law above it. The signal is continuous at the threshold but has a singular derivative there, distinguishing it from both a jump and a smooth transition.

## Mathematical Definition

For $0\leq x\leq1$,

$$
f(x)=(x-p_c)_+^\beta,
\qquad
p_c=0.38,
\qquad
\beta=0.41,
$$

where

$$
(u)_+=\max(u,0).
$$

Equivalently,

$$
f(x)=
\begin{cases}
0, & x\leq p_c,\\
(x-p_c)^\beta, & x>p_c.
\end{cases}
$$

Because $0<\beta<1$, the signal is continuous at $p_c$, but its right derivative becomes unbounded as $x\downarrow p_c$.

[View Percolation signal](../assets/images/TF001_Percolation.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Cusps, corners, and derivative singularities |
| Signal type | Deterministic and nonstationary |
| Critical threshold | $p_c=0.38$ |
| Critical exponent | $\beta=0.41$ |
| Continuity | Continuous |
| Differentiability | Singular derivative at $p_c$ |
| Main challenge | Preserving the onset and local regularity |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $p_c$ | Critical threshold | 0.38 |
| $\beta$ | Critical exponent | 0.41 |

## MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
pc = 0.38;
beta = 0.41;
f = max(x-pc,0).^beta;

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF001 — Percolation'); grid on
exportgraphics(gcf,'TF001_Percolation.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
pc, beta = 0.38, 0.41
f = np.maximum(x-pc, 0)**beta

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF001 — Percolation")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF001_Percolation.png", dpi=300)
~~~

## Recommended Uses

- Critical-onset detection
- Derivative-singularity preservation
- Local-regularity estimation
- Distinguishing a continuous onset from a jump

## Provenance

**Status:** Percolation-inspired deterministic critical-onset surrogate.

---

[Signal Catalog](index.md) | [Next: Planck →](TF002_Planck.md)
