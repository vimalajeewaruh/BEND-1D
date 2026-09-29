# Pharmacokinetic

## Overview

The **Pharmacokinetic** signal represents absorption followed by biexponential elimination. A smaller delayed shoulder represents a secondary dose, redistribution effect, or meal-related perturbation.

## Mathematical Definition

Let

```math
t=Tx,
```

where $T$ is the total time interval in hours.

Define the absorption component

```math
A(t)=1-e^{-k_a t}.
```

Define the biexponential elimination component

```math
E(t)=w_1e^{-k_1t}+w_2e^{-k_2t}.
```

With

```math
u=(t-t_s)_+,
```

define the delayed shoulder

```math
S(t)=A_s\left(1-e^{-k_su}\right)e^{-k_du}.
```

The signal is

```math
f(x)=A(Tx)E(Tx)+S(Tx).
```

[View Pharmacokinetic signal](../../assets/images/TF055_Pharmacokinetic.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Asymmetric absorption and multirate elimination |
| Time interval | 0–$T$ hours |
| Main decay | Fast and slow exponential components |
| Secondary feature | Delayed shoulder after $t_s$ hours |
| Main challenge | Preserving a weak shoulder within a long asymmetric decay |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $T$ | Total time interval (hours) | 12 |
| $k_a$ | Main absorption rate | 2.2 |
| $w_1$ | Slow-elimination weight | 0.78 |
| $w_2$ | Fast-elimination weight | 0.22 |
| $k_1$ | Slow elimination rate | 0.24 |
| $k_2$ | Fast elimination rate | 1.3 |
| $t_s$ | Shoulder onset (hours) | 5.3 |
| $A_s$ | Shoulder amplitude | 0.16 |
| $k_s$ | Shoulder rise rate | 2.8 |
| $k_d$ | Shoulder decay rate | 0.55 |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF055_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF055_python.md)



## Recommended Uses

- Pharmacokinetic-curve denoising
- Delayed-shoulder preservation
- Multirate decay recovery
- Smooth asymmetric peak evaluation

## Provenance

**Status:** Pharmacokinetic-inspired deterministic biological surrogate.

---

[← Previous: FractureAE](TF054_FractureAE.md) | [Category 4 Catalog](index.md) | [Next: EpidemicSeasonal →](TF056_EpidemicSeasonal.md)

