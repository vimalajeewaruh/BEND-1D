# UltrasoundCrackEcho


## Overview

The **UltrasoundCrackEcho** signal begins with transducer ring-down, followed by a small crack echo close to a much larger back-wall reflection and a weaker late reverberation.

## Mathematical Definition

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Let

```math
u=(x-c_R)_+.
```

For $x\geq c_R$, define the ring-down component

```math
R(x)=
A_R e^{-\alpha_R u}
\sin(2\pi f_Ru),
```

with $R(x)=0$ for $x<c_R$.

Define the crack echo

```math
C(x)=
A_C g(x;c_C,w_C).
```

Define the back-wall reflection

```math
B(x)=
A_B g(x;c_B,w_B).
```

Define the secondary echo

```math
E(x)=
A_E g(x;c_E,w_E).
```

The signal is

```math
f(x)=R(x)+C(x)+B(x)+E(x).
```

[View UltrasoundCrackEcho signal](../../assets/images/TF129_UltrasoundCrackEcho.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Ring-down and unequal nearby echoes |
| Ring-down | Damped oscillation beginning at $c_R$ |
| Crack echo | Small narrow peak centered at $c_C$ |
| Back-wall reflection | Dominant peak centered at $c_B$ |
| Secondary echo | Broader peak centered at $c_E$ |
| Main challenge | Preserving the small crack echo beside a dominant reflector |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $c_R$ | Ring-down onset location | 0.08 |
| $A_R$ | Ring-down amplitude | 0.32 |
| $\alpha_R$ | Ring-down decay rate | 35 |
| $f_R$ | Ring-down frequency | 68 |
| $A_C$ | Crack-echo amplitude | 0.14 |
| $c_C$ | Crack-echo center | 0.58 |
| $w_C$ | Crack-echo width | 0.008 |
| $A_B$ | Back-wall reflection amplitude | 0.78 |
| $c_B$ | Back-wall reflection center | 0.62 |
| $w_B$ | Back-wall reflection width | 0.016 |
| $A_E$ | Secondary-echo amplitude | 0.16 |
| $c_E$ | Secondary-echo center | 0.79 |
| $w_E$ | Secondary-echo width | 0.022 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF129_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF129_python.md)



## Recommended Uses

- Ultrasonic NDE denoising
- Weak-echo recovery
- Close-reflector resolution

## Provenance

**Status:** Ultrasonic crack-detection-inspired deterministic surrogate.

---

[← Previous: OCTRetinalProfile](TF128_OCTRetinalProfile.md) | [Category 8 Catalog](index.md) | [Next: WearableGaitIMU →](TF130_WearableGaitIMU.md)
