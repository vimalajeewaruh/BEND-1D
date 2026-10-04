# CalciumTransientTrain


## Overview

The **CalciumTransientTrain** signal contains six causal fast-rise, slow-decay responses. Two nearby events overlap, and the final small event is intentionally difficult to preserve.

## Mathematical Definition

Let the event centers and amplitudes be

```math
\mathbf{c}
=
(0.16,\,0.29,\,0.43,\,0.455,\,0.67,\,0.82),
```

```math
\mathbf{a}
=
(0.28,\,0.52,\,0.72,\,0.45,\,0.35,\,0.18).
```

For each event, define

```math
u_k=(x-c_k)_+.
```

For $x\geq c_k$, define the causal transient

```math
T_k(x)=
a_k
\left[
1-e^{-k_ru_k}
\right]
e^{-k_du_k},
```

with $T_k(x)=0$ for $x<c_k$.

Define the slowly varying baseline

```math
B(x)=b_0+mx.
```

The signal is

```math
f(x)=B(x)+\sum_{k=1}^{K}T_k(x).
```

[View CalciumTransientTrain signal](../../assets/images/TF105_CalciumTransientTrain.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Sparse overlapping asymmetric transients |
| Rise and decay | Rapid rise governed by $k_r$ and slower decay governed by $k_d$ |
| Close pair | Events centered at $c_3=0.43$ and $c_4=0.455$ |
| Weak event | Final event at $c_6=0.82$ has the smallest amplitude |
| Main challenge | Resolving overlap while preserving the weak final event |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.05 |
| $m$ | Baseline slope | 0.01 |
| $K$ | Number of transient events | 6 |
| $\mathbf{c}$ | Event centers | $(0.16,\,0.29,\,0.43,\,0.455,\,0.67,\,0.82)$ |
| $\mathbf{a}$ | Event amplitudes | $(0.28,\,0.52,\,0.72,\,0.45,\,0.35,\,0.18)$ |
| $k_r$ | Rise rate | 120 |
| $k_d$ | Decay rate | 10 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF105_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF105_python.md)


## Recommended Uses

- Calcium-imaging trace denoising
- Overlapping-transient resolution
- Weak-event preservation

## Provenance

**Status:** Calcium-transient-inspired deterministic neural-imaging surrogate.

---

[← Previous: TokamakDisruption](TF104_TokamakDisruption.md) | [Category 7 Catalog](index.md) | [Next: NanoporeCurrent →](TF106_NanoporeCurrent.md)
