---
layout: default
title: TF016 — MarketCrash
---

# TF016 — MarketCrash

![MarketCrash signal](../assets/images/TF016_MarketCrash.png)

## Overview

The **MarketCrash** signal combines a speculative precursor, accelerating log-periodic oscillations, an abrupt crash, and an asymmetric recovery. It deliberately places several different morphologies in one record.

## Mathematical Definition

Let the crash time be $x_c=0.72$. Before the crash,

$$
f(x)
=
1.50
-
0.80(x_c-x)^{0.42}
\left[
1+
0.12\cos\{9\log(x_c-x)\}
\right],
\qquad x<x_c.
$$

At $x=x_c$, the signal drops to $0.92$. After the crash,

$$
f(x)
=
0.92
+
0.42
\left[
1-e^{-8(x-x_c)}
\right],
\qquad x\geq x_c.
$$

As $x$ approaches $x_c$ from the left, the oscillations become increasingly rapid while their modulation is multiplied by the shrinking power-law factor $(x_c-x)^{0.42}$.

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Composite and adversarial mixtures |
| Secondary tags | Log-periodic, jump, recovery, changing frequency |
| Crash time | $x_c=0.72$ |
| Pre-crash behavior | Trend with accelerating oscillations |
| At the crash | Abrupt downward structural break |
| Post-crash behavior | Smooth exponential recovery |
| Main challenge | Recovering several interacting morphologies |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $x_c$ | Crash location | 0.72 |
| $0.42$ | Pre-crash power exponent | 0.42 |
| $9$ | Log-periodic frequency | 9 |
| $0.12$ | Oscillation modulation | 0.12 |
| $8$ | Recovery rate | 8 |

## MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
xc = 0.72;
f = zeros(size(x));

before = x < xc;
z = xc-x(before);
f(before) = 1.50-0.80*z.^0.42.*(1+0.12*cos(9*log(z)));

after = x >= xc;
f(after) = 0.92+0.42*(1-exp(-8*(x(after)-xc)));

plot(x,f,'LineWidth',1.3)
xline(xc,'--r','Crash time')
xlabel('x'); ylabel('f(x)');
title('TF016 — MarketCrash'); grid on
exportgraphics(gcf,'TF016_MarketCrash.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
xc = 0.72
f = np.zeros_like(x)

before = x < xc
z = xc-x[before]
f[before] = 1.50-0.80*z**0.42*(1+0.12*np.cos(9*np.log(z)))

after = x >= xc
f[after] = 0.92+0.42*(1-np.exp(-8*(x[after]-xc)))

plt.plot(x, f, linewidth=1.3)
plt.axvline(xc, color="red", linestyle="--", label="Crash time")
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF016 — MarketCrash")
plt.grid(alpha=0.3)
plt.legend()
plt.tight_layout()
plt.savefig("TF016_MarketCrash.png", dpi=300)
~~~

## Recommended Uses

- Composite-morphology stress testing
- Recovery of accelerating oscillations
- Abrupt structural-break preservation
- Post-event recovery estimation
- Evaluation of methods under strongly nonuniform local difficulty

## Provenance

**Status:** Financial-crash-inspired deterministic morphology surrogate, not a calibrated market model.

---

[← Previous: VanHove](TF015_VanHove.md) | [Signal Catalog](index.md)
