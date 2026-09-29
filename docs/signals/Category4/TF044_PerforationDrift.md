# PerforationDrift


## Overview

The **PerforationDrift** signal represents successive perforation spacings or an equivalent registration measurement. It combines slow mechanical misalignment, periodic eccentricity, a fine-scale oscillation, and one sharply localized damaged-pin defect.

## Mathematical Definition

For $0\leq x\leq1$,

$$
f(x)=b_0+\beta(x-x_0)
+A_1\sin(\omega_1x)
+A_2\sin(\omega_2x+\delta)
+A_+\exp\left[-\frac12\left(\frac{x-x_+}{s_+}\right)^2\right]
-A_-\exp\left[-\frac12\left(\frac{x-x_-}{s_-}\right)^2\right].
$$

[View PerforationDrift signal](../../assets/images/TF044_PerforationDrift.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Drift and periodic error with localized anomaly |
| Nominal pitch | $b_0$ |
| Periodic components | Frequencies 8 and 31 cycles per unit interval |
| Defect region | Near $x=x_+$ to $x=x_-$ |
| Main challenge | Retaining a high-resolution defect within near-periodic drift |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $b_0$ | Nominal pitch | 1.00 |
| $\beta$ | Linear drift coefficient | 0.055 |
| $x_0$ | Drift reference location | 0.5 |
| $A_1$ | First periodic amplitude | 0.030 |
| $\omega_1$ | First angular frequency | $16\pi$ |
| $A_2$ | Second periodic amplitude | 0.012 |
| $\omega_2$ | Second angular frequency | $62\pi$ |
| $\delta$ | Second-component phase shift | 0.4 |
| $A_+$ | Positive-defect amplitude | 0.18 |
| $x_+$ | Positive-defect center | 0.63 |
| $s_+$ | Positive-defect width | 0.007 |
| $A_-$ | Negative-defect amplitude | 0.10 |
| $x_-$ | Negative-defect center | 0.648 |
| $s_-$ | Negative-defect width | 0.005 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF044_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF044_python.md)



## Recommended Uses

- Local manufacturing-defect detection
- Drift removal
- Periodic-error preservation
- Fine-scale anomaly recovery

## Provenance

**Status:** Stamp-perforation-inspired deterministic measurement surrogate.

---

[← Previous: StampShadeRun](TF043_StampShadeRun.md) | [Category 4 Catalog](index.md) | [Next: StampReflectance →](TF045_StampReflectance.md)

