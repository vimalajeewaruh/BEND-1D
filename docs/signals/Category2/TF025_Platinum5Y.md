# Platinum5Y

The **Platinum5Y** signal is based on 60 monthly World Bank Pink Sheet platinum prices from August 2021 through July 2026, measured in US dollars per troy ounce. Very light smoothing retains short-lived bends, local reversals, the 2025–2026 breakout, overshoot, and subsequent decline.

## Mathematical Definition

Let $P_m$ denote the observed price in month $m$. For each interior month, define the lightly smoothed value 

```math 
\widetilde{P}_m=\frac{P_{m-1}+6P_m+P_{m+1}}{8}.
```

The two endpoint observations are retained unchanged. A shape-preserving piecewise cubic interpolant maps the 60 monthly values onto $[0,1]$:

```math
f_0(x)=
\mathrm{PCHIP}\!\left(
\left\{\frac{m-1}{59},\widetilde P_m\right\}_{m=1}^{60}
\right)(x).
```

For denoising simulations, the interpolated curve may first be centered and standardized:

$$
f_{\mathrm{std}}(x_i)=
\frac{f_0(x_i)-\overline{f_0}}
{\sqrt{N^{-1}\sum_{j=1}^{N}\left[f_0(x_j)-\overline{f_0}\right]^2}}.
$$

The common power-SNR normalization can then be applied as described on the [benchmarking page](benchmarking-role.md).

> **Data requirement:** Exact reproduction requires the 60 source observations. Store them in `Platinum5Y_monthly.csv` with columns named `Date` and `Price`.

[View Platinum5Y signal](../../assets/images/TF025_Platinum5Y.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Empirical multiscale market structure |
| Signal type | Data-derived and nonstationary |
| Native observations | 60 monthly prices |
| Smoothing | Three-point weights $(1,6,1)/8$ for interior months |
| Interpolation | Shape-preserving piecewise cubic |
| Main challenge | Retaining bends and reversals without fitting observational noise |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of interpolated samples | 1024 |
| $60$ | Number of monthly observations | 60 |
| $1/8,6/8,1/8$ | Interior smoothing weights | As shown |
| Aug. 2021–Jul. 2026 | Observation interval | 60 months |

## MATLAB Implementation

~~~matlab
N = 1024;
T = readtable('Platinum5Y_monthly.csv');
P = T.Price(:);
assert(numel(P)==60, 'Expected exactly 60 monthly prices.');

Ps = P;
Ps(2:end-1) = (P(1:end-2)+6*P(2:end-1)+P(3:end))/8;

xm = linspace(0,1,60);
x = linspace(0,1,N);
f0 = pchip(xm,Ps,x);

fstd = (f0-mean(f0))/sqrt(mean((f0-mean(f0)).^2));

plot(x,f0,'LineWidth',1.6); hold on
plot(xm,P,'o','MarkerSize',3)
xlabel('x'); ylabel('US dollars per troy ounce');
title('TF025 — Platinum5Y'); grid on
legend('Lightly smoothed PCHIP','Monthly observations','Location','best')
exportgraphics(gcf,'TF025_Platinum5Y.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.interpolate import PchipInterpolator

N = 1024
table = pd.read_csv("Platinum5Y_monthly.csv")
P = table["Price"].to_numpy(dtype=float)
if P.size != 60:
    raise ValueError("Expected exactly 60 monthly prices.")

Ps = P.copy()
Ps[1:-1] = (P[:-2] + 6*P[1:-1] + P[2:]) / 8

xm = np.linspace(0, 1, 60)
x = np.linspace(0, 1, N)
f0 = PchipInterpolator(xm, Ps)(x)

fstd = (f0-f0.mean()) / np.sqrt(np.mean((f0-f0.mean())**2))

plt.plot(x, f0, linewidth=1.6, label="Lightly smoothed PCHIP")
plt.plot(xm, P, "o", markersize=3, label="Monthly observations")
plt.xlabel("x"); plt.ylabel("US dollars per troy ounce")
plt.title("TF025 — Platinum5Y")
plt.grid(alpha=0.3); plt.legend(); plt.tight_layout()
plt.savefig("TF025_Platinum5Y.png", dpi=300)
~~~

## Recommended Uses

- Empirical-signal denoising
- Trend and reversal preservation
- Multiscale financial-series evaluation
- Shape-preserving interpolation studies

## Provenance

**Status:** Data-derived benchmark based on World Bank Pink Sheet monthly platinum prices. Record the exact source file and retrieval date with benchmark results.

---

[← Previous: MuscleTwitch](TF024_MuscleTwitch.md) | [Category 2 Catalog](index.md) | [Next: FlashCrash →](TF026_FlashCrash.md)

