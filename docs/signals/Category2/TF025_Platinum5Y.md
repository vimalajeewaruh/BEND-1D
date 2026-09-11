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

[View MATLAB implementation](../../codes/matlab/TF025_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF025_python.md)



## Recommended Uses

- Empirical-signal denoising
- Trend and reversal preservation
- Multiscale financial-series evaluation
- Shape-preserving interpolation studies

## Provenance

**Status:** Data-derived benchmark based on World Bank Pink Sheet monthly platinum prices. Record the exact source file and retrieval date with benchmark results.

---

[← Previous: MuscleTwitch](TF024_MuscleTwitch.md) | [Category 2 Catalog](index.md) | [Next: FlashCrash →](TF026_FlashCrash.md)

