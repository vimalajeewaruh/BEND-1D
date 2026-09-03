#  VanHove
The **VanHove** signal contains a regularized logarithmic spectral enhancement embedded in a finite smooth background. A square-root envelope confines the feature to the interval, while the regularization prevents an actual interior divergence.

## Mathematical Definition

```math
f(x)=
-\sqrt{x(1-x)}
\log
\left[
\sqrt{(x-0.57)^2+0.006^2}
\right].
```

The logarithmic factor creates a sharp feature near $x=0.57$, and the factor $\sqrt{x(1-x)}$ forces $f(0)=f(1)=0$.

[View VanHove signal](../../assets/images/TF015_VanHove.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Cusps, corners, and derivative singularities |
| Secondary tags | Regularized near-singularity, spectral peak |
| Continuity | Continuous on $[0,1]$ |
| Interior behavior | Smooth because of the 0.006 regularization |
| Boundary behavior | Square-root envelope |
| Main challenge | Recovering a sharp near-singularity without flattening |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.57$ | Feature location | 0.57 |
| $0.006$ | Logarithmic regularization scale | 0.006 |

## MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
f = -sqrt(x.*(1-x)).*log(sqrt((x-0.57).^2+0.006^2));

plot(x,f,'LineWidth',1.5)
xlabel('x'); ylabel('f(x)');
title('TF015 — VanHove'); grid on
exportgraphics(gcf,'TF015_VanHove.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
f = -np.sqrt(x*(1-x))*np.log(np.sqrt((x-0.57)**2+0.006**2))

plt.plot(x, f, linewidth=1.5)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF015 — VanHove")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF015_VanHove.png", dpi=300)
~~~

## Recommended Uses

- Sharp near-singularity recovery
- Testing bias near a regularized logarithmic peak
- Boundary-envelope preservation
- Detecting peak flattening and spurious oscillations

## Provenance

**Status:** Van-Hove-singularity-inspired deterministic morphology surrogate.

---

[← Previous: ECGBeat](TF014_ECGBeat.md) | [Signal Catalog](index.md) | [Next: MarketCrash →](TF016_MarketCrash.md)
