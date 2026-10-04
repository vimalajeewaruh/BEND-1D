# LiquidityDrought


## Overview

The **LiquidityDrought** signal represents a gradual deterioration in liquidity followed by an abrupt additional loss and a slow, incomplete nonlinear recovery, with small localized features surrounding the main gap.

## Mathematical Definition

Define the logistic transition

```math
L(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

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

Define the gradual liquidity decline and abrupt loss by

```math
D(x)=
b_0-mx-A_GL(x;c_G,w_G).
```

For $x\geq c_G$, let

```math
u=x-c_G,
```

and define the nonlinear recovery by

```math
R(x)=
A_R
\left(
1-e^{-u/\tau_R}
\right),
```

with $R(x)=0$ for $x<c_G$.

Define the localized features surrounding the gap by

```math
P(x)=
A_PG(x;c_P,w_P)
-
A_NG(x;c_N,w_N).
```

The signal is

```math
f(x)=
D(x)+R(x)+P(x).
```

[View Liquidity Drought](../../assets/images/TF224_LiquidityDrought.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Market microstructure |
| Structure | Trend, sharp logistic loss, slow recovery, and localized features |
| Deterioration behavior | Gradual linear decline before the main liquidity gap |
| Gap behavior | Sharp additional loss centered at $c_G$ |
| Recovery behavior | Slow and incomplete nonlinear recovery after the gap |
| Local behavior | Small positive precursor and negative post-gap features |
| Regularity | Mixed smooth trend and concentrated change point |
| Main challenge | Preserving precursor and post-gap features near the main loss |

## Parameters

| Symbol | Meaning | Default |
|---|---|---:|
| $b_0$ | Initial liquidity level | 0.95 |
| $m$ | Gradual decline coefficient | 0.38 |
| $A_G$ | Gap magnitude | 0.34 |
| $c_G$ | Gap center | 0.61 |
| $w_G$ | Gap transition width | 0.008 |
| $A_R$ | Recovery magnitude | 0.27 |
| $\tau_R$ | Recovery time scale | 0.18 |
| $A_P$ | Pre-gap positive-feature amplitude | 0.07 |
| $c_P$ | Pre-gap feature center | 0.595 |
| $w_P$ | Pre-gap feature width | 0.010 |
| $A_N$ | Post-gap negative-feature magnitude | 0.10 |
| $c_N$ | Post-gap feature center | 0.625 |
| $w_N$ | Post-gap feature width | 0.012 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF224_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF224_python.md)




## Recommended Uses

- Liquidity-gap localization
- Precursor preservation
- Partial-recovery estimation

## Provenance

This is a deterministic benchmark surrogate inspired by market microstructure measurement morphology. It is not a calibrated physical or financial simulator.

[← Previous: IntradayVolatilityU](TF223_IntradayVolatilityU.md) · [Category 10 catalog](index.md) · [Next: YieldShockRecovery →](TF225_YieldShockRecovery.md)

