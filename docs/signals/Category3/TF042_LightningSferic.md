# LightningSferic

## Overview

The **LightningSferic** signal is a multiscale atmospheric electromagnetic transient. It contains a sharp bipolar front, a slower unipolar component, damped oscillations on two frequency scales, and a weak delayed arrival.

## Mathematical Definition

Let $t_0=0.285$, $s_0=0.0032$, and $u_0=(x-t_0)/s_0$. The primary bipolar front is

$$
P(x)=1.25u_0e^{-u_0^2/2}.
$$

For $u=x-t_0$, define

$$
S(x)=0.36\mathbf{1}_{\{u\geq0\}}\left(e^{-10u}-e^{-65u}\right)
$$

and

$$
R(x)=\mathbf{1}_{\{u\geq0\}}e^{-23u}
\left[0.34\sin(144\pi u)+0.14\sin(48\pi u+0.55)\right].
$$

For the delayed arrival, let $t_d=0.475$, $s_d=0.0045$, and $u_d=(x-t_d)/s_d$:

$$
D(x)=0.20u_de^{-u_d^2/2}.
$$

The complete signal is

$$
f(x)=P(x)+S(x)+R(x)+D(x).
$$

[LightningSferic signal](../../assets/images/TF042_LightningSferic.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Multiscale impulsive transient |
| Primary arrival | Sharp bipolar event at $x=0.285$ |
| Post-arrival content | Slow component and two damped frequencies |
| Delayed arrival | Weak bipolar event at $x=0.475$ |
| Main challenge | Retaining small structured ringing near a dominant impulse |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $t_0$ | Primary arrival time | 0.285 |
| $s_0$ | Primary width | 0.0032 |
| $t_d$ | Delayed arrival time | 0.475 |
| $s_d$ | Delayed width | 0.0045 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF042_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF042_python.md)



## Recommended Uses

- Multiscale impulse denoising
- Delayed-arrival recovery
- Damped-ringing preservation
- Atmospheric-transient analysis

## Provenance

**Status:** Lightning-sferic-inspired deterministic atmospheric surrogate.

---

[← Previous: SonarMultipath](TF041_SonarMultipath.md) | [Category 3 Catalog](index.md)

