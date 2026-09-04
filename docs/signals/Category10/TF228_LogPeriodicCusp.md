---
layout: default
title: "TF228 — LogPeriodicCusp"
---

# TF228 — LogPeriodicCusp

![LogPeriodicCusp signal](../../assets/images/TF228_LogPeriodicCusp.png)

## Overview

Cusp amplitude and logarithmically compressed oscillation scale change together near one singular point.

## Mathematical Definition

Let $u=x-0.57$ and $a=|u|$. Define
$$
r(x)=a^{0.34}[1+0.62\sin\{10.5\log(a+0.0025)\}].
$$
The sampled signal is centered and normalized:
$$
f_i=\frac{r(x_i)-\bar r}{\max_j|r(x_j)-\bar r|}.
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Critical phenomena |
| Structure | Power cusp with multiplicative log-periodic modulation |
| Regularity | Hölder-like singularity with local frequency compression |
| Main challenge | Adapt simultaneously to changing amplitude and frequency |

## Parameters

| Parameter | Value |
|---|---|
| Center | $0.57$ |
| Cusp exponent | $0.34$ |
| Modulation depth | $0.62$ |
| Log frequency | $10.5$ |

## MATLAB Implementation

~~~matlab
N=1024; x=linspace(0,1,N);
u=x-0.57; au=abs(u);
f=au.^0.34.*(1+0.62*sin(10.5*log(au+0.0025)));
f=f-mean(f); f=f/max(abs(f));
plot(x,f,'LineWidth',1.3); grid on
xlabel('x'); ylabel('f(x)'); title('TF228 — LogPeriodicCusp')
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N=1024
x=np.linspace(0.0,1.0,N)
u=x-0.57; au=np.abs(u)
f=au**0.34*(1+0.62*np.sin(10.5*np.log(au+0.0025)))
f-=np.mean(f); f/=np.max(np.abs(f))
plt.plot(x,f); plt.grid(True)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF228 — LogPeriodicCusp")
plt.show()
~~~

## Recommended Uses

- Log-periodic structure preservation
- Local-regularity adaptation
- Critical-point denoising

## Provenance

This is a deliberately artificial controlled stress test. Its normalization and sampling conventions are part of the definition.

[← Previous: ChirpCuspCollision](TF227_ChirpCuspCollision.md) · [Category 10 catalog](index.md) · [Next: CancellationNeedle →](TF229_CancellationNeedle.md)

