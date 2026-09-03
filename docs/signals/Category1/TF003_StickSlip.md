# StickSlip

## Overview

The **StickSlip** signal models repeated linear loading followed by abrupt release. It is a deterministic sawtooth-like waveform motivated by frictional stress accumulation, fault slip, and atomic-force microscope loading traces.

## Mathematical Definition

Let the break points and loading amplitudes be

$$
b=(0,0.16,0.34,0.52,0.73,1)
$$

and

$$
h=(0.80,1.15,0.75,1.35,0.95).
$$

For $k=1,\ldots,5$,

$$
f(x)=
h_k\frac{x-b_k}{b_{k+1}-b_k},
\qquad
b_k\leq x<b_{k+1}.
$$

At each new segment, the signal is reset to zero. The endpoint is set to $f(1)=0$.

[View StickSlip signal](../assets/images/TF003_StickSlip.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Jumps and steps |
| Secondary tags | Piecewise linear, repeated motifs, sawtooth |
| Continuity | Discontinuous at interior break points |
| Within-segment behavior | Linear loading |
| Number of loading segments | Five |
| Main challenge | Preserving ramps and abrupt releases simultaneously |

## Parameters

| Parameter | Meaning | Default |
|---|---|---|
| $N$ | Number of samples | 1024 |
| $b$ | Segment break points | $(0,0.16,0.34,0.52,0.73,1)$ |
| $h$ | Segment amplitudes | $(0.80,1.15,0.75,1.35,0.95)$ |

## MATLAB Implementation

~~~matlab
N = 1024;
x = linspace(0,1,N);
b = [0 0.16 0.34 0.52 0.73 1];
h = [0.80 1.15 0.75 1.35 0.95];
f = zeros(size(x));

for k = 1:numel(h)
    idx = (x >= b(k)) & (x < b(k+1));
    f(idx) = h(k)*(x(idx)-b(k))/(b(k+1)-b(k));
end
f(end) = 0;

plot(x,f,'LineWidth',1.4)
xlabel('x'); ylabel('f(x)');
title('TF003 — StickSlip'); grid on
exportgraphics(gcf,'TF003_StickSlip.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
b = np.array([0, 0.16, 0.34, 0.52, 0.73, 1.0])
h = np.array([0.80, 1.15, 0.75, 1.35, 0.95])
f = np.zeros_like(x)

for k in range(len(h)):
    idx = (x >= b[k]) & (x < b[k+1])
    f[idx] = h[k]*(x[idx]-b[k])/(b[k+1]-b[k])
f[-1] = 0.0

plt.plot(x, f, linewidth=1.4)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF003 — StickSlip")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF003_StickSlip.png", dpi=300)
~~~

## Recommended Uses

- Recovery of piecewise-linear loading
- Detection and preservation of abrupt releases
- Testing oversmoothing near repeated jumps
- Evaluation of methods on unequal segment lengths and amplitudes

## Provenance

**Status:** Deterministic stick-slip morphology surrogate rather than a calibrated mechanical simulator.

---

[← Previous: Planck](TF002_Planck.md) | [Signal Catalog](index.md) | [Next: RingDown →](TF004_RingDown.md)
