# MarketCrash

The **MarketCrash** signal combines a speculative precursor, accelerating log-periodic oscillations, an abrupt crash, and an asymmetric recovery. It deliberately places several different morphologies in one record.

## Mathematical Definition

Let the crash time be $x_c=0.72$. Before the crash,

$$
f(x)= 1.50 -
0.80(x_c-x)^{0.42}
\left[
1+
0.12\cos\{9\log(x_c-x)\}
\right],
\qquad x<x_c.
$$

At $x=x_c$, the signal drops to $0.92$. After the crash,

$$
f(x)
= 0.92
+
0.42
\left[
1-e^{-8(x-x_c)}
\right],
\qquad x\geq x_c.
$$

As $x$ approaches $x_c$ from the left, the oscillations become increasingly rapid while their modulation is multiplied by the shrinking power-law factor $(x_c-x)^{0.42}$.

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
| $0.42$ | Pre-crash power exponent | 0.42 |
| $9$ | Log-periodic frequency | 9 |
| $0.12$ | Oscillation modulation | 0.12 |
| $8$ | Recovery rate | 8 |

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
