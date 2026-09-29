# IceCore

## Overview

The **IceCore** signal represents an isotope, dust, conductivity, or related paleoclimate proxy. It combines long- and short-scale oscillations with a narrow excursion and a finite-duration level change.

## Mathematical Definition

Define

$$
L(x)=A_1\sin(\omega_1x)+A_2\sin(\omega_2x+\delta_2),
$$

$$
H(x)=A_H\sin(\omega_Hx)\left[b_H+c_H\cos(\omega_mx)\right],
$$

$$
E(x)=-A_E\exp\left[-\frac12\left(\frac{x-\mu_E}{s_E}\right)^2\right],
$$

and the finite-duration level component

```math
S(x)=A_S\left[
\frac{1}{1+e^{-k_1(x-x_1)}}
-
\frac{1}{1+e^{-k_2(x-x_2)}}
\right].
```

The signal is

```math
f(x)=L(x)+H(x)+E(x)+S(x).
```

[View IceCore signal](../../assets/images/TF048_IceCore.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiscale climate variability with abrupt event |
| Slow content | Frequencies 1.25 and 3.4 |
| Fine content | Amplitude-modulated frequency 27 |
| Event structure | Narrow negative excursion and temporary level change |
| Main challenge | Preserving a localized event across widely separated scales |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $A_1,A_2$ | Slow-component amplitudes | 0.34, 0.16 |
| $\omega_1,\omega_2$ | Slow angular frequencies | $2.5\pi,6.8\pi$ |
| $\delta_2$ | Slow-component phase shift | 0.7 |
| $A_H$ | Fine-component amplitude | 0.045 |
| $\omega_H$ | Fine angular frequency | $54\pi$ |
| $b_H,c_H$ | Modulation coefficients | 0.7, 0.3 |
| $\omega_m$ | Modulation angular frequency | $2\pi$ |
| $A_E$ | Excursion amplitude | 0.62 |
| $\mu_E$ | Excursion center | 0.58 |
| $s_E$ | Excursion width | 0.018 |
| $A_S$ | Level-change amplitude | 0.20 |
| $x_1,x_2$ | Level-change boundaries | 0.62, 0.76 |
| $k_1,k_2$ | Level-change sharpness | 85, 55 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF048_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF048_python.md)



## Recommended Uses

- Paleoclimate-proxy denoising
- Abrupt-event preservation
- Temporary regime-change recovery
- Widely separated-scale evaluation

## Provenance

**Status:** Ice-core-proxy-inspired deterministic environmental surrogate.

---

[← Previous: TreeRing](TF047_TreeRing.md) | [Category 4 Catalog](index.md) | [Next: Seismogram →](TF049_Seismogram.md)

