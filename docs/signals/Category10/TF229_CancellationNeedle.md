# CancellationNeedle


## Overview

The **CancellationNeedle** signal contains two order-one broad components that nearly cancel, leaving a fragile residual background on which a narrow biphasic feature is superimposed.

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

Define the first broad component by

```math
g_1(x)=
A_BG(x;c_B,w_B)
+
A_O\sin(2\pi f_Ox).
```

Define the second, closely matched component by

```math
g_2(x)=
\gamma g_1(x)
+
A_PG(x;c_P,w_P).
```

Define the narrow biphasic feature by

```math
\eta(x)=
G(x;c_{N1},w_{N1})
-
\rho_NG(x;c_{N2},w_{N2}).
```

The near-cancellation residual is

```math
r(x)=
g_1(x)
-
\gamma_Cg_2(x)
+
A_N\eta(x).
```

For sampled points $x_i$, define the max-normalized signal by

```math
f_i=
\frac{r(x_i)}
{\max_j \lvert r(x_j)\rvert}.
```

[View Cancellation Needle](../../assets/images/TF229_CancellationNeedle.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Interference |
| Structure | Near-cancellation residual plus weak biphasic needle |
| Broad behavior | Two order-one smooth components nearly cancel |
| Residual behavior | Small background remains after subtraction of the broad components |
| Needle behavior | Narrow positive-negative localized feature centered near $c_{N1}$ and $c_{N2}$ |
| Regularity | Smooth but numerically delicate and highly localized |
| Main challenge | Preserving a weak feature when the total signal is a small residual |

## Parameters

| Symbol | Meaning | Default |
|---|---|---:|
| $A_B$ | Broad Gaussian amplitude | 1.10 |
| $c_B$ | Broad Gaussian center | 0.50 |
| $w_B$ | Broad Gaussian width | 0.18 |
| $A_O$ | Broad oscillation amplitude | 0.22 |
| $f_O$ | Broad oscillation frequency | 2 |
| $\gamma$ | Scaling of $g_1$ in $g_2$ | 1.004 |
| $A_P$ | Additional broad perturbation amplitude | 0.018 |
| $c_P$ | Additional broad perturbation center | 0.44 |
| $w_P$ | Additional broad perturbation width | 0.10 |
| $c_{N1}$ | Positive needle center | 0.635 |
| $w_{N1}$ | Positive needle width | 0.006 |
| $\rho_N$ | Negative-to-positive needle amplitude ratio | 0.62 |
| $c_{N2}$ | Negative needle center | 0.648 |
| $w_{N2}$ | Negative needle width | 0.009 |
| $\gamma_C$ | Cancellation coefficient applied to $g_2$ | 0.995 |
| $A_N$ | Biphasic needle weight | 0.16 |
| $\max_j \lvert r(x_j)\rvert$ | Normalization factor | Computed from samples |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF229_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF229_python.md)




## Recommended Uses

- Weak-needle preservation
- Cancellation-residual denoising
- Global-error failure diagnostics

## Provenance

This is a deliberately artificial controlled stress test. Its normalization and sampling conventions are part of the definition.

[← Previous: LogPeriodicCusp](TF228_LogPeriodicCusp.md) · [Category 10 catalog](index.md) · [Next: RegularityQuilt →](TF230_RegularityQuilt.md)

