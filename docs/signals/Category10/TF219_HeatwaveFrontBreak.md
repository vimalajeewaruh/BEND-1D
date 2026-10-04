# HeatwaveFrontBreak


## Overview

The **HeatwaveFrontBreak** signal represents a gradual temperature rise toward a high plateau with increasingly visible diurnal oscillation, followed by a rapid collapse associated with a frontal passage.

## Mathematical Definition

Define the logistic transition

```math
L(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the large-scale temperature trend by

```math
T(x)=
b_0
+
A_R L(x;c_R,w_R)
-
A_F L(x;c_F,w_F).
```

Define the varying oscillation amplitude by

```math
A(x)=
A_0+
A_1L(x;c_A,w_A).
```

The diurnal oscillatory component is

```math
D(x)=
A(x)\sin(2\pi f_Dx).
```

The signal is

```math
f(x)=
T(x)+D(x).
```

[View Heatwave Front Break](../../assets/images/TF219_HeatwaveFrontBreak.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Climate |
| Structure | Two unequal logistic transitions plus amplitude-varying oscillation |
| Rise behavior | Gradual warming toward a high-temperature plateau |
| Oscillatory behavior | Diurnal oscillation becomes stronger as the heatwave develops |
| Break behavior | Rapid temperature collapse centered at $c_F$ |
| Regularity | Smooth long trend with one sharp macroscopic break |
| Main challenge | Preserving the abrupt break and low-amplitude diurnal structure |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline temperature level | 0.18 |
| $A_R$ | Heatwave-rise magnitude | 0.72 |
| $c_R$ | Rise center | 0.28 |
| $w_R$ | Rise transition width | 0.075 |
| $A_F$ | Frontal-break magnitude | 0.82 |
| $c_F$ | Break center | 0.79 |
| $w_F$ | Break transition width | 0.012 |
| $A_0$ | Initial oscillation amplitude | 0.02 |
| $A_1$ | Oscillation-amplitude increase | 0.05 |
| $c_A$ | Oscillation-amplitude transition center | 0.35 |
| $w_A$ | Oscillation-amplitude transition width | 0.08 |
| $f_D$ | Diurnal oscillation frequency | 9 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF219_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF219_python.md)



## Recommended Uses

- Regime-break localization
- Trend-plus-cycle denoising
- Climate-extreme morphology recovery

## Provenance

This is a deterministic benchmark surrogate inspired by climate measurement morphology. It is not a calibrated physical or environmental simulator.

[← Previous: AtmosphericRiver](TF218_AtmosphericRiver.md) · [Category 10 catalog](index.md) · [Next: DroughtRecovery →](TF220_DroughtRecovery.md)

