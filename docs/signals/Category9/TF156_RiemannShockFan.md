# RiemannShockFan

## Overview

The **RiemannShockFan** signal combines constant states, a continuous rarefaction fan, a contact-like jump, another plateau, and a final shock.

## Mathematical Definition

$$
f(x)=
\begin{cases}
1, & 0\le x<0.18,\\
1-0.38\dfrac{x-0.18}{0.22}, & 0.18\le x<0.40,\\
0.62, & 0.40\le x<0.58,\\
0.40, & 0.58\le x<0.76,\\
0.08, & 0.76\le x\le1.
\end{cases}
$$

[RiemannShockFan signal](../../assets/images/TF156_RiemannShockFan.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Flat states, linear fan, and two jumps |
| Rarefaction | Continuous decline over 0.18–0.40 |
| Discontinuities | At $x=0.58$ and $x=0.76$ |
| Main challenge | Preserving shocks without turning the fan into a staircase |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.18,0.40$ | Rarefaction boundaries | As shown |
| $0.58$ | Contact-like jump | 0.58 |
| $0.76$ | Final shock | 0.76 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF0156_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF0156_python.md)




## Recommended Uses

- Shock-preserving denoising
- Mixed-regularity recovery
- Rarefaction-versus-step evaluation

## Provenance

**Status:** Riemann-problem-inspired deterministic compressible-flow surrogate.

---

[Category 9 Catalog](index.md) | [Next: DispersiveHydraulicJump →](TF157_DispersiveHydraulicJump.md)
