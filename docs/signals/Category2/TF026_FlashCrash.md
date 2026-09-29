# FlashCrash

The **FlashCrash** signal combines an almost instantaneous market loss, partial exponential recovery, and a localized high-frequency volatility burst. A slowly varying baseline is retained throughout the interval.

## Mathematical Definition

Define the baseline

```math
b(x)=b_0+A_b\sqrt{x+\delta}+B_b\sin(\omega_b x),
```

and let $x_c$ denote the crash location.

The crash component is

```math
D(x)=-A_c[1+\tanh\{k_c(x-x_c)\}].
```

For $x\geq x_c$, define the recovery component

```math
R(x)=A_r[1-e^{-\lambda_r(x-x_c)}],
```

and the volatility burst

```math
V(x)=A_v e^{-\lambda_v(x-x_c)}
\sin[\omega_v(x-x_c)].
```

The complete signal is

```math
f(x)=b(x)+D(x)+I(x\geq x_c)[R(x)+V(x)],
```

where $I(\cdot)$ is the indicator function.

[View FlashCrash signal](../../assets/images/TF026_FlashCrash.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Structural break with rebound and transient burst |
| Signal type | Deterministic and nonstationary |
| Crash location | $x=x_c$ |
| Recovery | Partial exponential rebound |
| Fine structure | Localized damped high-frequency oscillation |
| Main challenge | Preserving the crash and volatility burst without producing ringing |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $b_0$ | Baseline level | 1 |
| $A_b$ | Square-root trend amplitude | 0.12 |
| $\delta$ | Square-root offset | 0.02 |
| $B_b$ | Baseline oscillation amplitude | 0.025 |
| $\omega_b$ | Baseline angular frequency | $10\pi$ |
| $x_c$ | Crash location | 0.58 |
| $A_c$ | Crash amplitude | 0.31 |
| $k_c$ | Crash sharpness | 180 |
| $A_r$ | Recovery amplitude | 0.48 |
| $\lambda_r$ | Recovery rate | 22 |
| $A_v$ | Volatility-burst amplitude | 0.09 |
| $\lambda_v$ | Volatility decay rate | 10 |
| $\omega_v$ | Volatility angular frequency | $65\pi$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF026_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF026_python.md)



## Recommended Uses

- Structural-break preservation
- Abrupt-loss and recovery analysis
- Transient volatility denoising
- Composite trend, edge, and oscillation evaluation

## Provenance

**Status:** Flash-crash-inspired deterministic financial surrogate.

---

[← Previous: Platinum5Y](TF025_Platinum5Y.md) | [Category 2 Catalog](index.md)

