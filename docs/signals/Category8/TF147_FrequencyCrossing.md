# FrequencyCrossing


## Overview

The **FrequencyCrossing** stress test combines an increasing-frequency chirp and a decreasing-frequency chirp whose instantaneous frequencies cross.

## Mathematical Definition

Let

$$
\phi_u(x)=2\pi(8x+20x^2),\qquad
\phi_d(x)=2\pi(28x-20x^2),
$$

and $A(x)=0.75+0.25e^{-((x-0.50)/0.30)^2/2}$. Then

$$
f(x)=A(x)[0.25\sin\phi_u(x)+0.25\sin(\phi_d(x)+0.35)].
$$

[FrequencyCrossing signal](../../assets/images/TF147_FrequencyCrossing.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Two chirps with crossing instantaneous frequencies |
| Phase trends | One increasing and one decreasing |
| Interference | Local reinforcement and cancellation |
| Main challenge | Avoiding false interpretation of interference as signal disappearance |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $20,-20$ | Quadratic phase coefficients | As shown |
| $0.35$ | Relative phase offset | 0.35 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF147_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF147_python.md)


## Recommended Uses

- Crossing-frequency recovery
- Phase-sensitive denoising
- Interference preservation

## Provenance

**Status:** Deliberately artificial MishMash stress test.

---

[← Previous: MultiscaleComb](TF146_MultiscaleComb.md) | [Category 8 Catalog](index.md) | [Next: PhaseResetBurst →](TF148_PhaseResetBurst.md)
