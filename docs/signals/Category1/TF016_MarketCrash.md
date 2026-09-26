# MarketCrash

The **MarketCrash** signal combines a speculative precursor, accelerating log-periodic oscillations, an abrupt crash, and an asymmetric recovery. It deliberately places several different morphologies in one record.

## Mathematical Definition

Let $x_c$ denote the crash time. For $x<x_c$, define

```math
f(x)=A-B(x_c-x)^\beta
\left[1+C\cos\{\omega\log(x_c-x)\}\right].
```

At $x=x_c$, the signal drops to $f_c$. For $x\geq x_c$, define

```math
f(x)=f_c+R\left[1-e^{-\lambda(x-x_c)}\right].
```

As $x$ approaches $x_c$ from the left, the oscillations become increasingly rapid while their modulation is multiplied by the shrinking power-law factor $(x_c-x)^\beta$.

[View MarketCrash signal](../../assets/images/TF016_MarketCrash.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Composite and adversarial mixtures |
| Secondary tags | Log-periodic, jump, recovery, changing frequency |
| Crash time | $x_c=0.72$ |
| Pre-crash behavior | Trend with accelerating oscillations |
| At the crash | Abrupt downward structural break |
| Post-crash behavior | Smooth exponential recovery |
| Main challenge | Recovering several interacting morphologies |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $x_c$ | Crash location | 0.72 |
| $A$ | Pre-crash baseline | 1.50 |
| $B$ | Pre-crash power-law amplitude | 0.80 |
| $\beta$ | Pre-crash power exponent | 0.42 |
| $C$ | Oscillation modulation | 0.12 |
| $\omega$ | Log-periodic frequency | 9 |
| $f_c$ | Post-crash starting level | 0.92 |
| $R$ | Recovery amplitude | 0.42 |
| $\lambda$ | Recovery rate | 8 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF016_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF016_python.md)



## Recommended Uses

- Composite-morphology stress testing
- Recovery of accelerating oscillations
- Abrupt structural-break preservation
- Post-event recovery estimation
- Evaluation of methods under strongly nonuniform local difficulty

## Provenance

**Status:** Financial-crash-inspired deterministic morphology surrogate, not a calibrated market model.

---

[← Previous: VanHove](TF015_VanHove.md) | [Signal Catalog](index.md)
