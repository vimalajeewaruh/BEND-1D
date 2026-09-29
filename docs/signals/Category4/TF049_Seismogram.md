# Seismogram

## Overview

The **Seismogram** signal begins with a quiet baseline. A smaller localized chirped packet represents the P-wave arrival, a later stronger packet represents the S wave, and a decaying multifrequency tail represents the seismic coda.

## Mathematical Definition

Define the P-wave envelope

```math
w_P(x)=
\exp\left[
-\frac12\left(\frac{x-\mu_P}{s_P}\right)^2
\right],
```

and the P-wave component

```math
P(x)=A_Pw_P(x)\sin[2\pi(f_Px+\beta_Px^2)].
```

Define the S-wave envelope

```math
w_S(x)=
\exp\left[
-\frac12\left(\frac{x-\mu_S}{s_S}\right)^2
\right],
```

and

```math
S(x)=w_S(x)[\sin(\omega_{S1}x)+A_{S2}\sin(\omega_{S2}x+\delta_S)].
```

With $u=x-\mu_C$, define the coda

```math
C(x)=A_C I(x\geq\mu_C)e^{-\alpha_Cu}
[\sin(\omega_{C1}u)+A_{C2}\sin(\omega_{C2}u+\delta_C)].
```

Thus

```math
f(x)=A_b\sin(\omega_bx)+P(x)+S(x)+C(x).
```

[View Seismogram signal](../../assets/images/TF049_Seismogram.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiple arrivals and decaying coda |
| P-wave center | $x=\mu_P$ |
| S-wave center | $x=\mu_S$ |
| Coda onset | $x=\mu_C$ |
| Main challenge | Preserving arrivals across several amplitude and frequency scales |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $\mu_P$ | P-wave center | 0.25 |
| $s_P$ | P-wave width | 0.028 |
| $A_P$ | P-wave amplitude | 0.42 |
| $f_P,\beta_P$ | P-wave phase coefficients | 38, 24 |
| $\mu_S$ | S-wave center | 0.43 |
| $s_S$ | S-wave width | 0.055 |
| $\omega_{S1},\omega_{S2}$ | S-wave angular frequencies | $48\pi,102\pi$ |
| $A_{S2}$ | Secondary S-wave amplitude | 0.28 |
| $\delta_S$ | S-wave phase shift | 0.5 |
| $\mu_C$ | Coda onset | 0.47 |
| $A_C$ | Coda amplitude | 0.40 |
| $\alpha_C$ | Coda decay rate | 4.8 |
| $\omega_{C1},\omega_{C2}$ | Coda angular frequencies | $62\pi,118\pi$ |
| $A_{C2}$ | Secondary coda amplitude | 0.35 |
| $\delta_C$ | Coda phase shift | 0.6 |
| $A_b$ | Baseline amplitude | 0.01 |
| $\omega_b$ | Baseline angular frequency | $8\pi$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF049_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF049_python.md)



## Recommended Uses

- Seismic-arrival detection
- Coda preservation
- Localized chirp denoising
- Multiple-amplitude-scale evaluation

## Provenance

**Status:** Seismogram-inspired deterministic measurement surrogate.

---

[← Previous: IceCore](TF048_IceCore.md) | [Category 4 Catalog](index.md) | [Next: VolcanicTremor →](TF050_VolcanicTremor.md)

