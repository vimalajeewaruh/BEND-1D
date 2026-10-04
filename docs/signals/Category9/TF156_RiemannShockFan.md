# RiemannShockFan

## Overview

The **RiemannShockFan** signal combines constant states, a continuous rarefaction fan, a contact-like jump, another plateau, and a final shock.

## Mathematical Definition

Let the rarefaction interval be bounded by $c_{R1}$ and $c_{R2}$, with initial level $L_1$ and total decline $A_R$.

For $0\leq x<c_{R1}$,

```math
f(x)=L_1.
```

For $c_{R1}\leq x<c_{R2}$, define the continuous rarefaction fan

```math
f(x)=
L_1-
A_R\frac{x-c_{R1}}{c_{R2}-c_{R1}}.
```

For $c_{R2}\leq x<c_J$,

```math
f(x)=L_2.
```

For $c_J\leq x<c_S$,

```math
f(x)=L_3.
```

For $c_S\leq x\leq1$,

```math
f(x)=L_4.
```

[View RiemannShockFan signal](../../assets/images/TF156_RiemannShockFan.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Flat states, linear fan, and two jumps |
| Initial state | Constant level $L_1$ before the rarefaction |
| Rarefaction | Continuous linear decline from $c_{R1}$ to $c_{R2}$ |
| Intermediate states | Constant plateaus at levels $L_2$ and $L_3$ |
| Contact-like jump | Discontinuity at $c_J$ |
| Final shock | Discontinuity at $c_S$ leading to level $L_4$ |
| Main challenge | Preserving shocks without turning the fan into a staircase |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $L_1$ | Initial state level | 1 |
| $c_{R1}$ | Rarefaction onset | 0.18 |
| $c_{R2}$ | Rarefaction endpoint | 0.40 |
| $A_R$ | Total rarefaction decline | 0.38 |
| $L_2$ | Post-rarefaction plateau level | 0.62 |
| $c_J$ | Contact-like jump location | 0.58 |
| $L_3$ | Intermediate plateau level | 0.40 |
| $c_S$ | Final shock location | 0.76 |
| $L_4$ | Final state level | 0.08 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF156_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF156_python.md)




## Recommended Uses

- Shock-preserving denoising
- Mixed-regularity recovery
- Rarefaction-versus-step evaluation

## Provenance

**Status:** Riemann-problem-inspired deterministic compressible-flow surrogate.

---

[Category 9 Catalog](index.md) | [Next: DispersiveHydraulicJump →](TF157_DispersiveHydraulicJump.md)
