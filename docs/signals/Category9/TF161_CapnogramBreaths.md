# Capnogram Breaths

## Overview

The **CapnogramBreaths** signal consists of five recurrent smooth-gated capnogram breaths, with a steeper shark-fin morphology in the fourth breath and a localized cleft.

## Mathematical Definition

Define the smooth logistic transition

```math
L(x;c,w)=
\left[1+e^{-(x-c)/w}\right]^{-1}.
```

Let the breath start times be

```math
\mathbf{t}
=
(0.010,\,0.205,\,0.400,\,0.595,\,0.790).
```

For each breath, define the upstroke and downstroke locations

```math
r_k=t_k+\delta_r,
```

```math
d_k=t_k+\delta_d.
```

The smooth gate for the $k$th breath is

```math
G_k(x)=
L(x;r_k,w_G)-L(x;d_k,w_G).
```

For $k\ne4$, define the plateau profile

```math
p_k(x)=
A_P+
m_P\frac{x-r_k}{d_k-r_k}.
```

For the fourth breath, define the shark-fin plateau profile

```math
p_4(x)=
A_4+
m_4\frac{x-r_4}{d_4-r_4}.
```

Define the localized cleft

```math
C(x)=
-A_C
\exp\left[
-\frac12
\left(
\frac{x-c_C}{w_C}
\right)^2
\right].
```

The signal is

```math
f(x)=
\sum_{k=1}^{K}G_k(x)p_k(x)+C(x),
\qquad 0\leq x\leq1.
```

[View Capnogram Breaths](../../assets/images/TF161_CapnogramBreaths.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Recurrent pulse morphology |
| Signal type | Smooth gated plateaus with a localized defect |
| Main structure | $K$ repeated capnogram breaths |
| Breath timing | Upstroke and downstroke locations determined by $\delta_r$ and $\delta_d$ |
| Typical plateaus | Initial level $A_P$ with slope controlled by $m_P$ |
| Local anomaly | Shark-fin fourth plateau controlled by $A_4$ and $m_4$, with a small localized cleft |
| Main challenge | Preserving a weak abnormality within repeated structure |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of breaths | 5 |
| $\mathbf{t}$ | Breath start times | $(0.010,\,0.205,\,0.400,\,0.595,\,0.790)$ |
| $\delta_r$ | Start-to-upstroke delay | 0.045 |
| $\delta_d$ | Start-to-downstroke delay | 0.145 |
| $w_G$ | Gate transition width | 0.0035 |
| $A_P$ | Typical plateau initial level | 0.80 |
| $m_P$ | Typical plateau increase | 0.12 |
| $A_4$ | Fourth-breath plateau initial level | 0.70 |
| $m_4$ | Fourth-breath plateau increase | 0.34 |
| $A_C$ | Cleft magnitude | 0.12 |
| $c_C$ | Cleft center | 0.685 |
| $w_C$ | Cleft width | 0.009 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF160_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF160_python.md)



## Recommended Uses

- Recurrent pulse denoising
- Preservation of plateau slopes and fast transitions
- Detection of a weak local defect in a periodic record

## Provenance

This is a deterministic, application-oriented surrogate inspired by time-domain capnography. It is not a physiological simulator or a clinical reference trace.

[← Previous: Fresnel Occultation](TF160_FresnelOccultation.md) · [Category 9 catalog](index.md) · [Next: Diffusion MRI IVIM →](TF162_DiffusionMRIIVIM.md)
