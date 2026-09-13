# CyclicVoltammetry

## Overview

The **CyclicVoltammetry** signal parameterizes current along a forward and reverse potential sweep. Unequal oxidation and reduction peaks occur at different potentials, producing a smooth but highly nonmonotone hysteretic trace.

## Mathematical Definition

The potential sweep is

$$
E(x) =
\begin{cases}
-1 + 4x & 0 \le x \le 0.5 \\\\
3 - 4x & 0.5 < x \le 1
\end{cases}
$$

The current is

$$
f(x)=
\begin{cases}
0.07E(x)+\exp\left[-\dfrac12\left(\dfrac{E(x)-0.36}{0.18}\right)^2\right],
& x\leq0.5, \\
0.07E(x)-0.82\exp\left[-\dfrac12\left(\dfrac{E(x)-0.08}{0.22}\right)^2\right],
& x>0.5.
\end{cases}
$$


[CyclicVoltammetry signal](../../assets/images/TF053_CyclicVoltammetry.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Forward–reverse hysteresis with unequal peaks |
| Forward peak | Oxidation peak near $E=0.36$ |
| Reverse peak | Reduction peak near $E=0.08$ |
| Sweep reversal | $x=0.5$ |
| Main challenge | Preserving two scientifically distinct smooth peaks |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $0.18$ | Oxidation-peak width | 0.18 |
| $0.22$ | Reduction-peak width | 0.22 |
| $0.82$ | Reduction-peak magnitude | 0.82 |


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

