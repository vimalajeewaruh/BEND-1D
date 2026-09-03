---
layout: default
title: TF044 — PerforationDrift
---

# TF044 — PerforationDrift

![PerforationDrift signal](../../assets/images/TF044_PerforationDrift.png)

## Overview

The **PerforationDrift** signal represents successive perforation spacings or an equivalent registration measurement. It combines slow mechanical misalignment, periodic eccentricity, a fine-scale oscillation, and one sharply localized damaged-pin defect.

## Mathematical Definition

For $0\leq x\leq1$,

$$
\begin{aligned}
f(x)={}&1+0.055(x-0.5)+0.030\sin(16\pi x)\\
&+0.012\sin(62\pi x+0.4)
+0.18\exp\!\left[-\frac12\left(\frac{x-0.63}{0.007}\right)^2\right]\\
&-0.10\exp\!\left[-\frac12\left(\frac{x-0.648}{0.005}\right)^2\right].
\end{aligned}
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Drift and periodic error with localized anomaly |
| Nominal pitch | 1.00 |
| Periodic components | Frequencies 8 and 31 |
| Defect region | Near $x=0.63$–$0.648$ |
| Main challenge | Retaining a high-resolution defect within near-periodic drift |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.055$ | Linear drift coefficient | 0.055 |
| $0.007$ | Positive-defect width | 0.007 |
| $0.005$ | Negative-defect width | 0.005 |

## MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
f = 1+0.055*(x-0.5)+0.030*sin(2*pi*8*x)+0.012*sin(2*pi*31*x+0.4);
f = f+0.18*exp(-0.5*((x-0.63)/0.007).^2) ...
    -0.10*exp(-0.5*((x-0.648)/0.005).^2);
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('f(x)'); title('TF044 — PerforationDrift')
exportgraphics(gcf,'TF044_PerforationDrift.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
f = 1+0.055*(x-0.5)+0.030*np.sin(2*np.pi*8*x)+0.012*np.sin(2*np.pi*31*x+0.4)
f += 0.18*np.exp(-0.5*((x-0.63)/0.007)**2)-0.10*np.exp(-0.5*((x-0.648)/0.005)**2)
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF044 — PerforationDrift")
plt.tight_layout(); plt.savefig("TF044_PerforationDrift.png",dpi=300)
~~~

## Recommended Uses

- Local manufacturing-defect detection
- Drift removal
- Periodic-error preservation
- Fine-scale anomaly recovery

## Provenance

**Status:** Stamp-perforation-inspired deterministic measurement surrogate.

---

[← Previous: StampShadeRun](TF043_StampShadeRun.md) | [Category 4 Catalog](index.md) | [Next: StampReflectance →](TF045_StampReflectance.md)

