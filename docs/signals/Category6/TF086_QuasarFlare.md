# QuasarFlare


## Overview

The **QuasarFlare** signal places a broad asymmetric flare and two smaller excursions on a slowly wandering astronomical baseline.

## Mathematical Definition

Define the Gaussian feature

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

Define the wandering baseline

```math
b(x)=
b_0
+A_1\sin(2\pi f_1x+\delta_1)
+A_2\sin(2\pi f_2x+\delta_2)
+mx.
```

Define the flare-rise component, for $x<c_F$, as

```math
q_{\mathrm{rise}}(x)
=
A_Fg(x;c_F,w_F).
```

Define the flare-decay component, for $x\geq c_F$, as

```math
q_{\mathrm{decay}}(x)
=
A_F e^{-(x-c_F)/\tau_F}.
```

The asymmetric flare is $q(x)=q_{\mathrm{rise}}(x)$ for $x<c_F$ and
$q(x)=q_{\mathrm{decay}}(x)$ for $x\geq c_F$.

Define the secondary-excursion component

```math
E(x)=
A_{E1}g(x;c_{E1},w_{E1})
+
A_{E2}g(x;c_{E2},w_{E2}).
```

The signal is

```math
f(x)=b(x)+q(x)+E(x).
```


[View QuasarFlare signal](../../assets/images/TF086_QuasarFlare.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Wandering baseline with asymmetric flare |
| Principal flare | Centered at $x=c_F$ |
| Flare shape | Gaussian rise followed by exponential decay |
| Secondary features | Small excursions near $c_{E1}$ and $c_{E2}$ |
| Main challenge | Preserving transients without distorting low-frequency variability |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $b_0$ | Baseline level | 0.34 |
| $A_1,A_2$ | Baseline oscillation amplitudes | 0.055, 0.035 |
| $f_1,f_2$ | Baseline oscillation frequencies | 1.4, 3.3 |
| $\delta_1,\delta_2$ | Baseline phase shifts | 0.2, -0.6 |
| $m$ | Linear baseline slope | 0.020 |
| $A_F$ | Principal-flare amplitude | 0.52 |
| $c_F$ | Principal-flare center | 0.56 |
| $w_F$ | Flare rise width | 0.060 |
| $\tau_F$ | Flare decay scale | 0.18 |
| $A_{E1},A_{E2}$ | Secondary-excursion amplitudes | 0.075, 0.055 |
| $c_{E1},c_{E2}$ | Secondary-excursion centers | 0.20, 0.84 |
| $w_{E1},w_{E2}$ | Secondary-excursion widths | 0.018, 0.014 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF086_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF086_python.md)



## Recommended Uses

- Asymmetric-transient denoising
- Baseline-versus-flare separation
- Weak-excursion recovery

## Provenance

**Status:** Quasar-variability-inspired deterministic surrogate.

---

[← Previous: SolarFlare](TF085_SolarFlare.md) | [Category 6 Catalog](index.md) | [Next: PromoDemand →](TF087_PromoDemand.md)
