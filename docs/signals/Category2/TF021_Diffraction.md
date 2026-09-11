# Diffraction

The **Diffraction** signal combines a dominant central diffraction envelope, double-slit-type fringes, weak sidelobes, and a small displaced satellite order. It tests whether a denoiser can preserve systematic fine structure without exaggerating weak features.

## Mathematical Definition

Let $z=18\pi(x-0.50)$ and define the main envelope $A(x)=\left(\frac{\sin z}{z}\right)^2,$ with the continuous value $\sin z/z=1$ at $z=0$. The fringe modulation is

$$
M(x)=0.18+0.82\cos^2\{15\pi(x-0.50)\}.
$$

For the displaced satellite, let $z_2=34\pi(x-0.67)$ and $S(x)=0.10\left(\frac{\sin z_2}{z_2}\right)^2,$ again using the continuous value 1 for the ratio at $z_2=0$. The benchmark is

$$
f(x)=A(x)M(x)+S(x).
$$

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
| $18\pi$ | Main-envelope scale | $18\pi$ |
| $15\pi$ | Fringe angular frequency | $15\pi$ |
| $34\pi$ | Satellite scale | $34\pi$ |
| $0.10$ | Satellite amplitude | 0.10 |

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

