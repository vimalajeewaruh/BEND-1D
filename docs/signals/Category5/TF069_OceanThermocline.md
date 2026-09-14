# OceanThermocline

## Overview

The **OceanThermocline** signal represents a vertical temperature-like profile. A nearly homogeneous mixed layer is followed by a sharp but smooth thermocline and weaker deep-water gradient, with a small inversion and localized fine structure below the principal transition.

## Mathematical Definition

Define

$$
M(x)=1-0.025x,
$$

$$
T(x)=-\frac{0.62}{1+e^{-42(x-0.43)}},
$$

$$
D(x)=-0.14(x-0.46)_+,
$$

$$
I(x)=0.075\exp\!\left[-\frac12\left(\frac{x-0.69}{0.035}\right)^2\right],
$$

and

$$
F(x)=0.015\sin(20\pi x)
\exp\!\left[-\frac12\left(\frac{x-0.46}{0.20}\right)^2\right].
$$

The signal is

$$
f(x)=M(x)+T(x)+D(x)+I(x)+F(x).
$$

[OceanThermocline signal](../../assets/images/TF069_OceanThermocline.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth front with weak secondary ocean structure |
| Thermocline center | $x=0.43$ |
| Deep gradient onset | $x=0.46$ |
| Inversion center | $x=0.69$ |
| Main challenge | Recovering dominant transition and weak secondary features |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $42$ | Thermocline sharpness | 42 |
| $0.035$ | Inversion width | 0.035 |
| $10$ | Fine-structure frequency | 10 |

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

