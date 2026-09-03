---
layout: default
title: TF029 — PVCTrain
---

# TF029 — PVCTrain

![PVCTrain signal](../../assets/images/TF029_PVCTrain.png)

## Overview

The **PVCTrain** signal represents a sequence of normal P–QRS–T complexes interrupted by a premature ventricular contraction. The abnormal beat occurs early, is wider than the normal complexes, and is followed by a compensatory pause.

## Mathematical Definition

Let

$$
G(x;\mu,s)=\exp\!\left[-\frac12\left(\frac{x-\mu}{s}\right)^2\right].
$$

For a normal beat centered at $c$, define

$$
\begin{aligned}
B(x;c)={}&0.12G(x;c-0.036,0.012)
-0.14G(x;c-0.008,0.0045)\\
&+G(x;c,0.0055)-0.26G(x;c+0.010,0.0060)\\
&+0.30G(x;c+0.042,0.018).
\end{aligned}
$$

The normal centers and amplitudes are

$$
c=(0.09,0.22,0.35,0.48,0.76,0.89),
$$

$$
a=(1.00,0.98,1.03,1.00,0.97,1.02).
$$

With $c_P=0.595$, the premature ventricular contraction is

$$
P(x)=1.05G(x;c_P-0.006,0.012)
-0.72G(x;c_P+0.011,0.015)
+0.42G(x;c_P+0.045,0.028).
$$

Thus

$$
f(x)=\sum_{j=1}^{6}a_jB(x;c_j)+P(x).
$$

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Repeated sharp complexes with one abnormal event |
| Normal beats | Six P–QRS–T complexes |
| Abnormal beat | Broad premature contraction near $x=0.595$ |
| Timing feature | Compensatory pause |
| Main challenge | Preserving sharp peaks and a localized morphology change |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $c$ | Normal-beat centers | $(0.09,0.22,0.35,0.48,0.76,0.89)$ |
| $c_P$ | PVC center | 0.595 |
| $0.0055$ | Normal R-wave width | 0.0055 |

## MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N); f = zeros(size(x));
c = [0.09 0.22 0.35 0.48 0.76 0.89];
a = [1.00 0.98 1.03 1.00 0.97 1.02];
for j = 1:numel(c)
    f = f + a(j)*(0.12*exp(-0.5*((x-(c(j)-0.036))/0.012).^2) ...
      -0.14*exp(-0.5*((x-(c(j)-0.008))/0.0045).^2) ...
      +exp(-0.5*((x-c(j))/0.0055).^2) ...
      -0.26*exp(-0.5*((x-(c(j)+0.010))/0.0060).^2) ...
      +0.30*exp(-0.5*((x-(c(j)+0.042))/0.018).^2));
end
cp = 0.595;
f = f + 1.05*exp(-0.5*((x-(cp-0.006))/0.012).^2) ...
    -0.72*exp(-0.5*((x-(cp+0.011))/0.015).^2) ...
    +0.42*exp(-0.5*((x-(cp+0.045))/0.028).^2);
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('f(x)'); title('TF029 — PVCTrain')
exportgraphics(gcf,'TF029_PVCTrain.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt
N = 1024; x = np.linspace(0,1,N); f = np.zeros_like(x)
centers = np.array([0.09,0.22,0.35,0.48,0.76,0.89])
amps = np.array([1.00,0.98,1.03,1.00,0.97,1.02])
G = lambda mu,s: np.exp(-0.5*((x-mu)/s)**2)
for c,a in zip(centers,amps):
    f += a*(0.12*G(c-0.036,0.012)-0.14*G(c-0.008,0.0045)
            +G(c,0.0055)-0.26*G(c+0.010,0.0060)+0.30*G(c+0.042,0.018))
cp = 0.595
f += 1.05*G(cp-0.006,0.012)-0.72*G(cp+0.011,0.015)+0.42*G(cp+0.045,0.028)
plt.plot(x,f,linewidth=1.4); plt.grid(alpha=0.3)
plt.xlabel("x"); plt.ylabel("f(x)"); plt.title("TF029 — PVCTrain")
plt.tight_layout(); plt.savefig("TF029_PVCTrain.png",dpi=300)
~~~

## Recommended Uses

- ECG morphology preservation
- Premature-event detection
- Sharp-peak denoising
- Local timing-disruption analysis

## Provenance

**Status:** ECG-inspired deterministic physiological surrogate.

---

[← Previous: VasospasmTCD](TF028_VasospasmTCD.md) | [Category 3 Catalog](index.md) | [Next: CheyneStokes →](TF030_CheyneStokes.md)
