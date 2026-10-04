# IntradayVolatilityU


## Overview

The **IntradayVolatilityU** signal contains a deterministic U-shaped volatility profile with elevated endpoint microstructure oscillation and four isolated event spikes.

## Mathematical Definition

Define the Gaussian profile

```math
G(x;c,w)=
\exp\left[
-\frac{1}{2}
\left(
\frac{x-c}{w}
\right)^2
\right].
```

Define the broad U-shaped volatility profile by

```math
U(x)=
b_0+
A_U(x-c_U)^2.
```

Define the endpoint-weighted microstructure oscillation by

```math
R(x)=
A_R
\left[
1+\gamma_R|x-c_U|
\right]
\sin(2\pi f_Rx).
```

Define the localized event component by

```math
E(x)=
\sum_{k=1}^{K}
a_kG(x;c_k,w_k).
```

Let the event centers be

```math
\mathbf{c}
=
(0.08,\,0.32,\,0.71,\,0.93).
```

The signal is

```math
f(x)=
U(x)+R(x)+E(x).
```

[View Intraday Volatility U](../../assets/images/TF223_IntradayVolatilityU.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Finance |
| Structure | Quadratic envelope plus endpoint-weighted ripple and Gaussian events |
| Volatility behavior | Broad U-shaped profile centered at $c_U$ |
| Microstructure behavior | High-frequency oscillation whose amplitude increases toward the endpoints |
| Event behavior | Four narrow localized spikes superimposed on the volatility profile |
| Regularity | Smooth with narrow localized events |
| Main challenge | Recovering both the broad U shape and fine endpoint structure |

## Parameters

| Symbol | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline volatility level | 0.16 |
| $A_U$ | U-shape coefficient | 2.2 |
| $c_U$ | Center of the U-shaped profile | 0.5 |
| $A_R$ | Base ripple amplitude | 0.025 |
| $\gamma_R$ | Endpoint ripple-weighting coefficient | 2.5 |
| $f_R$ | Ripple frequency | 45 |
| $K$ | Number of localized events | 4 |
| $\mathbf{c}$ | Event centers | $(0.08,\,0.32,\,0.71,\,0.93)$ |
| $\mathbf{a}$ | Event amplitudes | Specified in implementation |
| $\mathbf{w}$ | Event widths | Specified in implementation |
## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF223_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF223_python.md)




## Recommended Uses

- Envelope-plus-event denoising
- Endpoint microstructure preservation
- Volatility-profile smoothing

## Provenance

This is a deterministic benchmark surrogate inspired by finance measurement morphology. It is not a calibrated physical or financial simulator.

[← Previous: BubbleLogPeriodic](TF222_BubbleLogPeriodic.md) · [Category 10 catalog](index.md) · [Next: LiquidityDrought →](TF224_LiquidityDrought.md)

