# CryogenicPulse


## Overview

The **CryogenicPulse** signal combines a weak precursor, a sharp thermal-pulse onset with long decay, and a smaller delayed secondary pulse.

## Mathematical Definition

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12
\left(\frac{x-c}{w}\right)^2
\right].
```

Define

```math
u=(x-c_0)_+.
```

For $x\geq c_0$, define the main thermal pulse

```math
P(x)=
A_P
\left[
1-e^{-k_ru}
\right]
e^{-k_du},
```

with $P(x)=0$ for $x<c_0$.

Define the weak precursor

```math
R(x)=A_Rg(x;c_R,w_R).
```

Define the delayed secondary pulse

```math
S(x)=A_Sg(x;c_S,w_S).
```

The signal is

```math
f(x)=P(x)+R(x)+S(x).
```


[View CryogenicPulse signal](../../assets/images/TF112_CryogenicPulse.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Precursor, sharp onset, long decay, and secondary pulse |
| Main onset | Located at $c_0$ with rapid rise and slower decay |
| Precursor | Weak localized feature centered at $c_R$ |
| Secondary pulse | Smaller delayed feature centered at $c_S$ |
| Main challenge | Preserving three components at substantially different scales |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c_0$ | Main-pulse onset location | 0.28 |
| $A_P$ | Main-pulse amplitude coefficient | 0.95 |
| $k_r$ | Main-pulse rise rate | 170 |
| $k_d$ | Main-pulse decay rate | 7 |
| $A_R$ | Precursor amplitude | 0.08 |
| $c_R$ | Precursor center | 0.245 |
| $w_R$ | Precursor width | 0.010 |
| $A_S$ | Secondary-pulse amplitude | 0.18 |
| $c_S$ | Secondary-pulse center | 0.62 |
| $w_S$ | Secondary-pulse width | 0.020 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF112_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF112_python.md)



## Recommended Uses

- Cryogenic-detector denoising
- Weak-precursor recovery
- Long-tail preservation

## Provenance

**Status:** Cryogenic-detector-pulse-inspired deterministic surrogate.

---

[← Previous: ParticlePileup](TF111_ParticlePileup.md) | [Category 7 Catalog](index.md) | [Next: SpaceWeatherStorm →](TF113_SpaceWeatherStorm.md)
