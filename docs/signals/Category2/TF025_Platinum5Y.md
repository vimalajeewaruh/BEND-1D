# Platinum5Y

The **Platinum5Y** signal is based on 60 monthly World Bank Pink Sheet platinum prices from August 2021 through July 2026, measured in US dollars per troy ounce. Very light smoothing retains short-lived bends, local reversals, the 2025–2026 breakout, overshoot, and subsequent decline.

## Mathematical Definition

Let $P_m$ denote the observed price in month $m$, for $m=1,\ldots,M$. For each interior month, define the lightly smoothed value

```math
\bar{P}_m=
w_{-1}P_{m-1}+w_0P_m+w_{+1}P_{m+1}.
```

The two endpoint observations are retained unchanged.

A shape-preserving piecewise cubic interpolant maps the $M$ monthly values onto $[0,1]$:

```math
f_0(x)=
\mathrm{PCHIP}
\left(
\left\{
\frac{m-1}{M-1},\bar{P}_m
\right\}_{m=1}^{M}
\right)(x).
```

For denoising simulations, the interpolated curve may first be centered and standardized:

```math
f_{\mathrm{std}}(x_i)=
\frac{f_0(x_i)-\bar{f}_0}
{\sqrt{
\frac{1}{N-1}
\sum_{j=1}^{N}
[f_0(x_j)-\bar{f}_0]^2
}}.
```

The common power-SNR normalization can then be applied as described on the [benchmarking page](../benchmarking.md).

> **Data requirement:** Exact reproduction requires the $M=60$ source observations. Store them in `Platinum5Y_monthly.csv` with columns named `Date` and `Price`.

[View Platinum5Y signal](../../assets/images/TF025_Platinum5Y.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Empirical multiscale market structure |
| Signal type | Data-derived and nonstationary |
| Native observations | $M$ monthly prices |
| Smoothing | Three-point weighted smoothing for interior months |
| Interpolation | Shape-preserving piecewise cubic |
| Main challenge | Retaining bends and reversals without fitting observational noise |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of interpolated samples | 1024 |
| $M$ | Number of monthly observations | 60 |
| $w_{-1}$ | Previous-month smoothing weight | $1/8$ |
| $w_0$ | Current-month smoothing weight | $6/8$ |
| $w_{+1}$ | Next-month smoothing weight | $1/8$ |

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

