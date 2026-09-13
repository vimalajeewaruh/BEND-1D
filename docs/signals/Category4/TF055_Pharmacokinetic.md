# Pharmacokinetic

## Overview

The **Pharmacokinetic** signal represents absorption followed by biexponential elimination. A smaller delayed shoulder represents a secondary dose, redistribution effect, or meal-related perturbation.

## Mathematical Definition

Let $t=12x$ hours. Define

$$
A(t)=1-e^{-2.2t},
$$

$$
E(t)=0.78e^{-0.24t}+0.22e^{-1.3t},
$$

and, with $u=(t-5.3)_+$,

$$
S(t)=0.16\mathbf{1}_{\{t\geq5.3\}}
\left(1-e^{-2.8u}\right)e^{-0.55u}.
$$

The signal is

$$
f(x)=A(12x)E(12x)+S(12x).
$$

[Pharmacokinetic signal](../../assets/images/TF055_Pharmacokinetic.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Asymmetric absorption and multirate elimination |
| Time interval | 0–12 hours |
| Main decay | Fast and slow exponential components |
| Secondary feature | Delayed shoulder after 5.3 hours |
| Main challenge | Preserving a weak shoulder within a long asymmetric decay |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $2.2$ | Main absorption rate | 2.2 |
| $0.24,1.3$ | Elimination rates | As shown |
| $5.3$ h | Shoulder onset | 5.3 |


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

