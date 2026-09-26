# Klatno

The **Klatno** signal is based on a nonlinear-pendulum separatrix. A weak residual swing and a short post-separatrix oscillation make it a multiscale benchmark. Its dominant feature is a sharply localized but smooth transition, accompanied by two weaker oscillatory components.

## Mathematical Definition

For $0 \leq x \leq 1$, define the separatrix

```math
s(x)=A_s\arctan\left[\exp\{k(x-x_c)\}\right]-\pi.
```

Let $u=x-x_c$. The complete signal is

```math
f(x)=s(x)
+A_1e^{-\alpha_1 x}\sin(\omega_1 x)
+A_2 I(x\geq x_c)e^{-\alpha_2 u}\sin(\omega_2 u),
```

where $I(\cdot)$ is the indicator function.

[View Klatno signal](../../assets/images/TF017_Klatno.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Smooth transitions with localized oscillations |
| Signal type | Deterministic and nonstationary |
| Main transition | Centered at $x=0.48$ |
| Oscillatory scales | Residual global swing and short damped oscillation |
| Continuity | Smooth |
| Main challenge | Preserving weak oscillations without distorting the dominant transition |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $x_c$ | Separatrix center | 0.48 |
| $A_s$ | Separatrix amplitude | 4 |
| $k$ | Transition sharpness | 12 |
| $A_1$ | Residual oscillation amplitude | 0.18 |
| $\alpha_1$ | Residual oscillation decay rate | 2.2 |
| $\omega_1$ | Residual angular frequency | $8\pi$ |
| $A_2$ | Post-transition oscillation amplitude | 0.10 |
| $\alpha_2$ | Post-transition decay rate | 8 |
| $\omega_2$ | Post-transition angular frequency | $36\pi$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF017_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF017_python.md)



## Recommended Uses

- Smooth-transition preservation
- Weak-oscillation recovery
- Multiscale denoising evaluation
- Testing bias near a steep but continuous transition

## Provenance

**Status:** Nonlinear-pendulum-inspired deterministic surrogate.

---

[Category 2 Catalog](index.md) | [Next: Cantilever →](TF018_Cantilever.md)

