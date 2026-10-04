# SleepSpindleKComplex


## Overview

The **SleepSpindleKComplex** signal contains a low-frequency background with a large biphasic K-complex followed closely by a localized high-frequency spindle.

## Mathematical Definition

Define the Gaussian profile

```math
G(x;c,w)=
\exp\left[
-\frac{1}{2}
\left(
\frac{x-c}{w}
\right)^2
\right].
```

Define the low-frequency background by

```math
B(x)=
A_B\sin(2\pi f_Bx).
```

Define the biphasic K-complex by

```math
K(x)=
-A_{K1}G(x;c_{K1},w_{K1})
+
A_{K2}G(x;c_{K2},w_{K2}).
```

Define the localized spindle by

```math
S(x)=
A_S
G(x;c_S,w_S)
\sin\left[
2\pi f_S(x-c_S)
\right].
```

The signal is

```math
f(x)=
B(x)+K(x)+S(x).
```

[View Sleep Spindle K-Complex](../../assets/images/TF202_SleepSpindleKComplex.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Neurophysiology |
| Structure | Slow oscillation, biphasic Gaussian K-complex, and localized wave packet |
| K-complex behavior | Large negative deflection followed by a broader positive component |
| Spindle behavior | Localized high-frequency oscillation centered at $c_S$ |
| Regularity | Smooth and strongly multiscale |
| Main challenge | Preserving two nearby structures occupying very different scales |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $A_B$ | Background oscillation amplitude | 0.06 |
| $f_B$ | Background frequency | 2.4 |
| $A_{K1}$ | Negative K-complex amplitude | 0.75 |
| $c_{K1}$ | Negative K-complex center | 0.43 |
| $w_{K1}$ | Negative K-complex width | 0.035 |
| $A_{K2}$ | Positive K-complex amplitude | 0.48 |
| $c_{K2}$ | Positive K-complex center | 0.475 |
| $w_{K2}$ | Positive K-complex width | 0.048 |
| $A_S$ | Spindle amplitude | 0.32 |
| $c_S$ | Spindle center | 0.66 |
| $w_S$ | Spindle width | 0.075 |
| $f_S$ | Spindle frequency | 37 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF202_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF202_python.md)



## Recommended Uses

- EEG event denoising
- Wave-packet preservation
- Adjacent multiscale feature recovery

## Provenance

This is a deterministic benchmark surrogate inspired by neurophysiology measurement morphology. It is not a calibrated physical or clinical simulator.

[← Previous: CGMMealStack](TF201_CGMMealStack.md) · [Category 10 catalog](index.md) · [Next: PupilLightReflex →](TF203_PupilLightReflex.md)

