---
layout: default
title: TF070 — WellLog
---

# TF070 — WellLog

![WellLog signal](../../assets/images/TF070_WellLog.png)

## Overview

The **WellLog** signal contains several instrument-smoothed stratigraphic level changes, slow within-layer variation, and a narrow thin-bed anomaly. The thin bed can easily disappear under aggressive smoothing.

## Mathematical Definition

Define the smooth step

$$
S(x;c,w)=\frac{1}{1+e^{-(x-c)/w}}.
$$

The background and principal strata are

$$
\begin{aligned}
B(x)={}&0.48+0.10x+0.025\sin(6\pi x)\\
&+0.30S(x;0.18,0.004)-0.40S(x;0.39,0.005)\\
&+0.26S(x;0.64,0.0045)-0.20S(x;0.82,0.004).
\end{aligned}
$$

The thin-bed feature is

$$
T(x)=0.24\left[S(x;0.515,0.0028)-S(x;0.548,0.0028)\right].
$$

The signal is

$$
f(x)=B(x)+T(x)+0.020\mathbf{1}_{\{0.18<x<0.82\}}\sin(34\pi x).
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Instrument-smoothed strata with thin-bed anomaly |
| Major boundaries | $x=0.18,0.39,0.64,0.82$ |
| Thin bed | Approximately $0.515<x<0.548$ |
| Within-layer variation | Slow trend and restricted oscillation |
| Main challenge | Preserving sharp boundaries and a much narrower layer |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.0028$ | Thin-bed edge width | 0.0028 |
| $0.24$ | Thin-bed magnitude | 0.24 |
| $17$ | Within-layer oscillation frequency | 17 |

## MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N);
s = @(z,c,w) 1./(1+exp(-(z-c)/w));
f = 0.48+0.10*x+0.025*sin(2*pi*3*x);
f = f+0.30*s(x,0.18,0.004)-0.40*s(x,0.39,0.005) ...
    +0.26*s(x,0.64,0.0045)-0.20*s(x,0.82,0.004);
thin = 0.24*(s(x,0.515,0.0028)-s(x,0.548,0.0028));
f = f+thin+0.020*sin(2*pi*17*x).*(x>0.18 & x<0.82);
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('Log response'); title('TF070 — WellLog')
exportgraphics(gcf,'TF070_WellLog.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N)
step = lambda c,w: 1/(1+np.exp(-(x-c)/w))
f = 0.48+0.10*x+0.025*np.sin(2*np.pi*3*x)
f += 0.30*step(0.18,0.004)-0.40*step(0.39,0.005)
f += 0.26*step(0.64,0.0045)-0.20*step(0.82,0.004)
thin = 0.24*(step(0.515,0.0028)-step(0.548,0.0028))
f += thin+0.020*np.sin(2*np.pi*17*x)*((x>0.18)&(x<0.82))
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("Log response"); plt.title("TF070 — WellLog")
plt.tight_layout(); plt.savefig("TF070_WellLog.png",dpi=300)
~~~

## Recommended Uses

- Well-log denoising
- Stratigraphic boundary preservation
- Thin-bed resolution
- Smooth-edge and within-layer variation recovery

## Provenance

**Status:** Geophysical-well-log-inspired deterministic measurement surrogate.

---

[← Previous: OceanThermocline](TF069_OceanThermocline.md) | [Category 5 Catalog](index.md)

