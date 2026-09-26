# Diffraction

The **Diffraction** signal combines a dominant central diffraction envelope, double-slit-type fringes, weak sidelobes, and a small displaced satellite order. It tests whether a denoiser can preserve systematic fine structure without exaggerating weak features.

## Mathematical Definition

Define the main-envelope coordinate

```math
z=k_1(x-x_1),
```

and the main envelope

```math
A(x)=\left(\frac{\sin z}{z}\right)^2,
```

with the continuous value $\sin(z)/z=1$ at $z=0$.

The fringe modulation is

```math
M(x)=a_0+a_1\cos^2[\omega(x-x_1)].
```

For the displaced satellite, define

```math
z_2=k_2(x-x_2),
```

and

```math
S(x)=A_s\left(\frac{\sin z_2}{z_2}\right)^2,
```

again using the continuous value $\sin(z_2)/z_2=1$ at $z_2=0$.

The benchmark is

```math
f(x)=A(x)M(x)+S(x).
```

[View Diffraction signal](../../assets/images/TF021_Diffraction.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Diffraction envelope with fringes and satellite |
| Signal type | Deterministic and oscillatory |
| Dominant feature | Central squared-sinc envelope |
| Fine structure | Cosine-squared fringe modulation |
| Weak feature | Displaced satellite near $x=0.67$ |
| Main challenge | Preserving sidelobes and weak fringes without ringing artifacts |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $x_1$ | Main-envelope center | 0.50 |
| $k_1$ | Main-envelope scale | $18\pi$ |
| $a_0$ | Fringe baseline | 0.18 |
| $a_1$ | Fringe modulation amplitude | 0.82 |
| $\omega$ | Fringe angular frequency | $15\pi$ |
| $x_2$ | Satellite center | 0.67 |
| $k_2$ | Satellite scale | $34\pi$ |
| $A_s$ | Satellite amplitude | 0.10 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF021_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF021_python.md)



## Recommended Uses

- Fine-fringe preservation
- Weak-feature recovery
- Oscillatory sidelobe denoising
- Testing artificial-ringing suppression

## Provenance

**Status:** Optical-diffraction-inspired deterministic surrogate.

---

[← Previous: ThermalRunaway](TF020_ThermalRunaway.md) | [Category 2 Catalog](index.md) | [Next: Titration →](TF022_Titration.md)

