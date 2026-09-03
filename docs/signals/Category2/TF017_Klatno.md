# Klatno

The **Klatno** signal is based on a nonlinear-pendulum separatrix. A weak residual swing and a short post-separatrix oscillation make it a multiscale benchmark. Its dominant feature is a sharply localized but smooth transition, accompanied by two weaker oscillatory components.

## Mathematical Definition

For $0\leq x\leq1$, define the separatrix

$$
s(x)=4\arctan\!\left[\exp\{12(x-0.48)\}\right]-\pi.
$$

Let $u=x-0.48$. The complete signal is

$$
f(x)=s(x)
+0.18e^{-2.2x}\sin(8\pi x)
+0.10\mathbf{1}_{\{x\geq0.48\}}e^{-8u}\sin(36\pi u),
$$

where $\mathbf{1}_{\{x\geq0.48\}}$ equals 1 when $x\geq0.48$ and 0 otherwise.

[View Klatno signal](../assets/images/TF017_Klatno.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth transitions with localized oscillations |
| Signal type | Deterministic and nonstationary |
| Main transition | Centered at $x=0.48$ |
| Oscillatory scales | Residual global swing and short damped oscillation |
| Continuity | Smooth |
| Main challenge | Preserving weak oscillations without distorting the dominant transition |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $x_c$ | Separatrix center | 0.48 |
| $12$ | Transition sharpness | 12 |
| $8\pi$ | Residual angular frequency | $8\pi$ |
| $36\pi$ | Post-transition angular frequency | $36\pi$ |

## MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
xc = 0.48;
u = x-xc;

s = 4*atan(exp(12*u))-pi;
f = s + 0.18*exp(-2.2*x).*sin(8*pi*x) ...
      + 0.10*(x>=xc).*exp(-8*u).*sin(36*pi*u);

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF017 — Klatno'); grid on
exportgraphics(gcf,'TF017_Klatno.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
xc = 0.48
u = x - xc

s = 4 * np.arctan(np.exp(12 * u)) - np.pi
f = (s + 0.18 * np.exp(-2.2 * x) * np.sin(8 * np.pi * x)
     + 0.10 * (x >= xc) * np.exp(-8 * u) * np.sin(36 * np.pi * u))

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF017 — Klatno")
plt.grid(alpha=0.3); plt.tight_layout()
plt.savefig("TF017_Klatno.png", dpi=300)
~~~

## Recommended Uses

- Smooth-transition preservation
- Weak-oscillation recovery
- Multiscale denoising evaluation
- Testing bias near a steep but continuous transition

## Provenance

**Status:** Nonlinear-pendulum-inspired deterministic surrogate.

---

[Category 2 Catalog](index.md) | [Next: Cantilever →](TF018_Cantilever.md)

