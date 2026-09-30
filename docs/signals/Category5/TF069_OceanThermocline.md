# OceanThermocline

## Overview

The **OceanThermocline** signal represents a vertical temperature-like profile. A nearly homogeneous mixed layer is followed by a sharp but smooth thermocline and weaker deep-water gradient, with a small inversion and localized fine structure below the principal transition.

## Mathematical Definition

Define the background trend

```math
M(x)=b_0-mx.
```

Define the thermocline transition

```math
T(x)=-A_T\left[1+e^{-k_T(x-x_T)}\right]^{-1}.
```

Define the deep-gradient component

```math
D(x)=-m_D(x-x_D)_+.
```

Define the localized inversion

```math
I(x)=A_I\exp\left[
-\frac12\left(\frac{x-\mu_I}{s_I}\right)^2
\right].
```

Define the localized fine-structure component

```math
F(x)=A_F\sin(2\pi f_Fx)
\exp\left[
-\frac12\left(\frac{x-\mu_F}{s_F}\right)^2
\right].
```

The signal is

```math
f(x)=M(x)+T(x)+D(x)+I(x)+F(x).
```

[View OceanThermocline signal](../../assets/images/TF069_OceanThermocline.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth front with weak secondary ocean structure |
| Thermocline center | $x=x_T$ |
| Deep gradient onset | $x=x_D$ |
| Inversion center | $x=\mu_I$ |
| Main challenge | Recovering dominant transition and weak secondary features |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $b_0$ | Background level | 1 |
| $m$ | Background slope | 0.025 |
| $A_T$ | Thermocline magnitude | 0.62 |
| $k_T$ | Thermocline sharpness | 42 |
| $x_T$ | Thermocline center | 0.43 |
| $m_D$ | Deep-gradient slope | 0.14 |
| $x_D$ | Deep-gradient onset | 0.46 |
| $A_I$ | Inversion amplitude | 0.075 |
| $\mu_I$ | Inversion center | 0.69 |
| $s_I$ | Inversion width | 0.035 |
| $A_F$ | Fine-structure amplitude | 0.015 |
| $f_F$ | Fine-structure frequency | 10 |
| $\mu_F$ | Fine-structure center | 0.46 |
| $s_F$ | Fine-structure width | 0.20 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF069_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF069_python.md)



## Recommended Uses

- Thermocline-profile denoising
- Smooth-front preservation
- Weak inversion detection
- Localized fine-structure recovery

## Provenance

**Status:** Ocean-thermocline-inspired deterministic measurement surrogate.

---

[← Previous: RadioAstronomyLine](TF068_RadioAstronomyLine.md) | [Category 5 Catalog](index.md) | [Next: WellLog →](TF070_WellLog.md)

