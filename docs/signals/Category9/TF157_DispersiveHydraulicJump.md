# TF157 — DispersiveHydraulicJump


## Overview

The **DispersiveHydraulicJump** signal contains a steep front followed by a genuine decaying, changing-frequency dispersive wavetrain.

## Mathematical Definition

Define the smooth step

```math
S(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Define the background trend

```math
B(x)=b_0+mx.
```

Define the hydraulic front

```math
J(x)=
A_JS(x;c_J,w_J).
```

Let

```math
u=(x-c_J)_+.
```

For $x\geq c_J$, define the post-front dispersive wavetrain

```math
D(x)=
A_De^{-\alpha_Du}
\sin\left[
2\pi(f_Du+\beta_Du^2)
\right],
```

with $D(x)=0$ for $x<c_J$.

The signal is

```math
f(x)=B(x)+J(x)+D(x).
```

[View DispersiveHydraulicJump signal](../../assets/images/TF157_DispersiveHydraulicJump.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Steep transition with dispersive wavetrain |
| Background | Slowly increasing linear trend |
| Front | Steep positive transition centered at $c_J$ |
| Post-front structure | Decaying chirped oscillation beginning at $c_J$ |
| Dispersion | Oscillation frequency increases according to $\beta_D$ |
| Main challenge | Avoiding removal of genuine waves as estimator ringing |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.12 |
| $m$ | Linear trend slope | 0.07 |
| $A_J$ | Jump magnitude | 0.64 |
| $c_J$ | Front location | 0.34 |
| $w_J$ | Front transition width | 0.006 |
| $A_D$ | Wavetrain amplitude | 0.22 |
| $\alpha_D$ | Wavetrain decay rate | 7.5 |
| $f_D$ | Initial wavetrain frequency | 17 |
| $\beta_D$ | Quadratic phase coefficient | 12 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF157_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF157_python.md)




## Recommended Uses

- Dispersive-front denoising
- Genuine-ringing preservation
- Phase-coherent tail recovery

## Provenance

**Status:** Dispersive-hydraulic-jump-inspired deterministic surrogate.

---

[← Previous: RiemannShockFan](TF156_RiemannShockFan.md) | [Category 9 Catalog](index.md) | [Next: XAFSEdge →](TF158_XAFSEdge.md)
