# CyclicVoltammetry

## Overview

The **CyclicVoltammetry** signal parameterizes current along a forward and reverse potential sweep. Unequal oxidation and reduction peaks occur at different potentials, producing a smooth but highly nonmonotone hysteretic trace.

## Mathematical Definition

Define the potential sweep by

```math
E(x)
=
(E_0+v_Fx)I(x\leq x_r)
+
(E_1-v_Rx)I(x>x_r).
```


The current is

```math
f(x)=
\begin{cases}
bE(x)+A_O\exp\left[-\frac12\left(\frac{E(x)-\mu_O}{s_O}\right)^2\right],
& x\leq x_r, \\
bE(x)-A_R\exp\left[-\frac12\left(\frac{E(x)-\mu_R}{s_R}\right)^2\right],
& x>x_r.
\end{cases}
```


[View CyclicVoltammetry signal](../../assets/images/TF053_CyclicVoltammetry.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Forward–reverse hysteresis with unequal peaks |
| Forward peak | Oxidation peak near $E=\mu_O$ |
| Reverse peak | Reduction peak near $E=\mu_R$ |
| Sweep reversal | $x=x_r$ |
| Main challenge | Preserving two scientifically distinct smooth peaks |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $E_0$ | Forward-sweep intercept | -1 |
| $E_1$ | Reverse-sweep intercept | 3 |
| $v_F$ | Forward sweep rate | 4 |
| $v_R$ | Reverse sweep rate | 4 |
| $x_r$ | Sweep-reversal location | 0.5 |
| $b$ | Linear background coefficient | 0.07 |
| $A_O$ | Oxidation-peak magnitude | 1 |
| $\mu_O$ | Oxidation-peak center | 0.36 |
| $s_O$ | Oxidation-peak width | 0.18 |
| $A_R$ | Reduction-peak magnitude | 0.82 |
| $\mu_R$ | Reduction-peak center | 0.08 |
| $s_R$ | Reduction-peak width | 0.22 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF053_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF053_python.md)



## Recommended Uses

- Electrochemical-signal denoising
- Hysteresis preservation
- Unequal-peak recovery
- Forward–reverse scan comparison

## Provenance

**Status:** Cyclic-voltammetry-inspired deterministic analytical surrogate.

---

[← Previous: StellarTransitFlare](TF052_StellarTransitFlare.md) | [Category 4 Catalog](index.md) | [Next: FractureAE →](TF054_FractureAE.md)

