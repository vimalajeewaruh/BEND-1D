# ArterialPulse

## Overview

The **ArterialPulse** signal contains a rapid systolic upstroke, rounded main peak, dicrotic notch, secondary rebound, and slow diastolic decay. The small notch carries structure that can easily disappear under aggressive smoothing.

## Mathematical Definition

Let

```math
u=(x-x_0)_+,
```

and define the unnormalized pulse component

```math
h(x)=u^p e^{-\alpha u}.
```

Define the normalized pulse

```math
M(x)=\frac{h(x)}{\max_{0\leq t\leq1}h(t)}.
```

Define the dicrotic notch

```math
N(x)=-A_N\exp\left[
-\frac12\left(\frac{x-\mu_N}{s_N}\right)^2
\right],
```

the rebound

```math
R(x)=A_R\exp\left[
-\frac12\left(\frac{x-\mu_R}{s_R}\right)^2
\right],
```

and the decaying tail

```math
D(x)=A_D I(x\geq x_D)e^{-\beta(x-x_D)}.
```

Thus,

```math
f(x)=b_0+A_MM(x)+N(x)+R(x)+D(x).
```

[View ArterialPulse signal](../../assets/images/TF060_ArterialPulse.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth asymmetric pulse with localized notch |
| Pulse onset | $x=x_0$ |
| Dicrotic notch | Centered at $x=\mu_N$ |
| Rebound | Centered at $x=\mu_R$ |
| Main challenge | Preserving the notch and rebound without introducing ringing |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $x_0$ | Pulse onset | 0.07 |
| $p$ | Pulse power | 2.15 |
| $\alpha$ | Main decay rate | 8.8 |
| $b_0$ | Baseline level | 0.065 |
| $A_M$ | Main pulse amplitude | 0.92 |
| $A_N$ | Notch magnitude | 0.115 |
| $\mu_N$ | Notch center | 0.50 |
| $s_N$ | Notch width | 0.012 |
| $A_R$ | Rebound amplitude | 0.060 |
| $\mu_R$ | Rebound center | 0.545 |
| $s_R$ | Rebound width | 0.021 |
| $A_D$ | Tail amplitude | 0.065 |
| $x_D$ | Tail onset | 0.53 |
| $\beta$ | Tail decay rate | 4.8 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF060_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF060_python.md)



## Recommended Uses

- Arterial-pulse denoising
- Dicrotic-notch preservation
- Smooth asymmetric waveform recovery
- Local indentation and rebound detection

## Provenance

**Status:** Arterial-pulse-inspired deterministic physiological surrogate.

---

[← Previous: ECGBeat](TF059_ECGBeat.md) | [Category 5 Catalog](index.md) | [Next: EEGSpindle →](TF061_EEGSpindle.md)

