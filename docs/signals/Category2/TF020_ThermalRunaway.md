# ThermalRunaway

The **ThermalRunaway** signal is a toy reactor trace containing an accelerating trend, a growing oscillatory instability, a sharp turnover, rapid post-critical cooling, and a small cooling undershoot.

## Mathematical Definition

Let $x_c=0.68$. Before the critical point, define

$$
b(x)=-\log\!\left(1-\frac{x}{x_c+0.035}\right)
$$

and

$$
f_{-}(x)=
b(x)+0.12\left(\frac{x}{x_c}\right)^3\sin(20\pi x),
\qquad x<x_c.
$$

Let

$$
f_c=
-\log\!\left(1-\frac{x_c}{x_c+0.035}\right)
+0.12\sin(20\pi x_c).
$$

The supplied specification states that the post-critical branch begins continuously at $f_c$, decays exponentially with rate 11, and includes a negative Gaussian centered at $x=0.80$. A convenient explicit implementation is

$$
f_{+}(x)=
f_c e^{-11(x-x_c)}
-A_q\exp\!\left[-\left(\frac{x-0.80}{w_q}\right)^2\right]
+A_q\exp\!\left[-\left(\frac{x_c-0.80}{w_q}\right)^2\right]e^{-11(x-x_c)},
$$

for $x\geq x_c$. The last term makes the post-critical branch exactly continuous at $x_c$. This page uses the implementation convention

$$
A_q=0.20,
\qquad
w_q=0.035.
$$

Thus

$$
f(x)=
\begin{cases}
f_{-}(x), & x<x_c,\\
f_{+}(x), & x\geq x_c.
\end{cases}
$$

[ThermalRunaway signal](../../assets/images/TF020_ThermalRunaway.png)

> **Implementation note:** The original description does not specify the undershoot amplitude or width. The values above are explicit defaults and may be replaced by the authoritative values used to generate your reference signal.

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Accelerating trend with instability and quench |
| Signal type | Deterministic and nonstationary |
| Critical point | $x_c=0.68$ |
| Pre-critical behavior | Increasing trend and growing oscillation |
| Post-critical behavior | Rapid decay and negative undershoot |
| Main challenge | Preserving a structural turnover and weak instability together |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $x_c$ | Critical point | 0.68 |
| $11$ | Post-critical decay rate | 11 |
| $A_q$ | Undershoot amplitude | 0.20* |
| $w_q$ | Undershoot width | 0.035* |

\*Implementation convention; not fixed by the supplied definition.

## MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
xc = 0.68;
Aq = 0.20;       % implementation convention
wq = 0.035;      % implementation convention

fc = -log(1-xc/(xc+0.035)) + 0.12*sin(20*pi*xc);

u = x-xc;
continuity = Aq*exp(-((xc-0.80)/wq)^2).*exp(-11*u);
fpost = fc*exp(-11*u) - Aq*exp(-((x-0.80)/wq).^2) + continuity;
f = zeros(size(x));
pre = (x<xc);
bpre = -log(1-x(pre)/(xc+0.035));
f(pre) = bpre + 0.12*(x(pre)/xc).^3.*sin(20*pi*x(pre));
f(~pre) = fpost(~pre);

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF020 — ThermalRunaway'); grid on
exportgraphics(gcf,'TF020_ThermalRunaway.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
xc = 0.68
Aq, wq = 0.20, 0.035  # implementation convention

fc = -np.log(1 - xc/(xc + 0.035)) + 0.12*np.sin(20*np.pi*xc)

u = x - xc
continuity = Aq*np.exp(-((xc-0.80)/wq)**2) * np.exp(-11*u)
fpost = fc*np.exp(-11*u) - Aq*np.exp(-((x-0.80)/wq)**2) + continuity
f = np.empty_like(x)
pre = x < xc
bpre = -np.log(1 - x[pre]/(xc + 0.035))
f[pre] = bpre + 0.12*(x[pre]/xc)**3 * np.sin(20*np.pi*x[pre])
f[~pre] = fpost[~pre]

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF020 — ThermalRunaway")
plt.grid(alpha=0.3); plt.tight_layout()
plt.savefig("TF020_ThermalRunaway.png", dpi=300)
~~~

## Recommended Uses

- Critical-transition denoising
- Weak-instability preservation
- Trend and oscillation separation
- Quench and undershoot recovery

## Provenance

**Status:** Thermal-runaway-inspired deterministic reactor surrogate.

---

[← Previous: WaterHammer](TF019_WaterHammer.md) | [Category 2 Catalog](index.md) | [Next: Diffraction →](TF021_Diffraction.md)
