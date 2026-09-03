# Titration

The **Titration** signal contains three transitions with distinctly different characteristic widths. A weak Gaussian shoulder between the main equivalence regions represents a small complexation or indicator response.

## Mathematical Definition

For $0\leq x\leq1$,

```math
f(x)= 0.08\log(1+20x)
+0.55\tanh\!\left(\frac{x-0.31}{0.018}\right)+0.32\tanh\!\left(\frac{x-0.69}{0.060}\right)
+0.13\tanh\!\left(\frac{x-0.84}{0.014}\right)+0.07\exp\!\left[-\left(\frac{x-0.50}{0.028}\right)^2\right].
```

[View Titration signal](../../assets/images/TF022_Titration.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiple unequal smooth transitions |
| Signal type | Deterministic and nonstationary |
| Main transitions | Near $x=0.31$, $0.69$, and $0.84$ |
| Transition widths | 0.018, 0.060, and 0.014 |
| Weak feature | Gaussian shoulder near $x=0.50$ |
| Main challenge | Preserving sharp and broad transitions together with a weak shoulder |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.31,0.69,0.84$ | Transition centers | As shown |
| $0.018,0.060,0.014$ | Transition widths | As shown |
| $0.50$ | Shoulder center | 0.50 |
| $0.028$ | Shoulder width | 0.028 |

## MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);

f = 0.08*log(1+20*x) ...
    + 0.55*tanh((x-0.31)/0.018) ...
    + 0.32*tanh((x-0.69)/0.060) ...
    + 0.13*tanh((x-0.84)/0.014) ...
    + 0.07*exp(-((x-0.50)/0.028).^2);

plot(x,f,'LineWidth',1.6)
xlabel('x'); ylabel('f(x)');
title('TF022 — Titration'); grid on
exportgraphics(gcf,'TF022_Titration.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)

f = (0.08*np.log(1 + 20*x)
     + 0.55*np.tanh((x-0.31)/0.018)
     + 0.32*np.tanh((x-0.69)/0.060)
     + 0.13*np.tanh((x-0.84)/0.014)
     + 0.07*np.exp(-((x-0.50)/0.028)**2))

plt.plot(x, f, linewidth=1.6)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF022 — Titration")
plt.grid(alpha=0.3); plt.tight_layout()
plt.savefig("TF022_Titration.png", dpi=300)
~~~

## Recommended Uses

- Unequal-transition preservation
- Weak-shoulder recovery
- Multiscale curvature evaluation
- Smooth edge localization

## Provenance

**Status:** Titration-curve-inspired deterministic surrogate.

---

[← Previous: Diffraction](TF021_Diffraction.md) | [Category 2 Catalog](index.md) | [Next: RabiChirp →](TF023_RabiChirp.md)

