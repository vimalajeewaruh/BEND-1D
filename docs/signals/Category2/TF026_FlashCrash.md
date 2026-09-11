# FlashCrash

The **FlashCrash** signal combines an almost instantaneous market loss, partial exponential recovery, and a localized high-frequency volatility burst. A slowly varying baseline is retained throughout the interval.

## Mathematical Definition

Define the baseline $b(x)=1+0.12\sqrt{x+0.02}+0.025\sin(10\pi x)$ and let $x_c=0.58$. 

The crash component is

$$
D(x)=-0.31\left[1+\tanh\{180(x-x_c)\}\right].
$$

For $x\geq x_c$, define the recovery $R(x)=0.48\left[1-e^{-22(x-x_c)}\right]$ and the volatility burst $V(x)=0.09e^{-10(x-x_c)}\sin\{65\pi(x-x_c)\}.$

The complete signal is

$$
f(x)=
b(x)+D(x)
+\mathbf{1}_{\{x\geq x_c\}}\left[R(x)+V(x)\right].
$$

[View FlashCrash signal](../../assets/images/TF026_FlashCrash.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Structural break with rebound and transient burst |
| Signal type | Deterministic and nonstationary |
| Crash location | $x_c=0.58$ |
| Recovery | Partial exponential rebound |
| Fine structure | Localized damped high-frequency oscillation |
| Main challenge | Preserving the crash and volatility burst without producing ringing |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $x_c$ | Crash location | 0.58 |
| $180$ | Crash sharpness | 180 |
| $22$ | Recovery rate | 22 |
| $10$ | Volatility decay rate | 10 |
| $65\pi$ | Volatility angular frequency | $65\pi$ |

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

