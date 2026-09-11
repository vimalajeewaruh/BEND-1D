# Morse

The **Morse** signal is based on the Morse potential for a diatomic molecular bond. It contains a steep repulsive wall, a narrow minimum, and a long dissociation tail, producing a strongly asymmetric smooth benchmark.

## Mathematical Definition

Define $r(x)=0.35+2x.$

With $D_e=1$, $a=2.8$, and $r_e=0.80$,

$$
f(x) =
D_e
\left[
1-\exp\{-a(r(x)-r_e)\}
\right]^2
-D_e.
$$

[View Morse signal](../../assets/images/TF011_Morse.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth global structure |
| Secondary tags | Asymmetric well, steep wall, long tail |
| Continuity | Continuous |
| Differentiability | Smooth |
| Minimum location | Where $r(x)=r_e$ |
| Minimum value | $-D_e$ |
| Main challenge | Preserving highly unequal curvature on two sides |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $D_e$ | Well depth | 1 |
| $a$ | Width/steepness parameter | 2.8 |
| $r_e$ | Equilibrium separation | 0.80 |
| $r(x)$ | Coordinate transformation | $0.35+2x$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF011_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF011_python.md)



## Recommended Uses

- Recovery of asymmetric potential wells
- Preservation of steep walls and long tails
- Minimum-location and depth estimation
- Evaluation of curvature-adaptive smoothing

## Provenance

**Status:** Morse-potential-inspired deterministic benchmark profile.

---

[← Previous: AvoidedCrossing](TF010_AvoidedCrossing.md) | [Signal Catalog](index.md) | [Next: BZPulse →](TF012_BZPulse.md)
