# BZPulse
The **BZPulse** signal is a toy excitable chemical-reaction trace. Two logistic components create a rapid autocatalytic rise and slower depletion phase, while a damped oscillatory term represents chemical relaxation.

## Mathematical Definition

Let $u=x-0.55$. Then

$$
f(x)=\frac{1}{1+\exp\{-100(x-0.25)\}}-\frac{1}{1+\exp\{-40(x-0.55)\}}+ 0.20I(x\geq0.55)e^{-9u}\sin(45\pi u),
$$

where $I(\cdot)$ is the indicator function.

[View BZPulse signal](../../assets/images/TF012_BZPulse.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Composite and adversarial mixtures |
| Secondary tags | Excitable pulse, logistic transitions, damped relaxation |
| Rise | Rapid logistic transition near $x=0.25$ |
| Depletion | Slower logistic transition near $x=0.55$ |
| Relaxation | Localized damped oscillation |
| Main challenge | Preserving multiple intrinsic time scales |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $100$ | Rise steepness | 100 |
| $40$ | Depletion steepness | 40 |
| $0.20$ | Relaxation amplitude | 0.20 |
| $9$ | Relaxation decay rate | 9 |
| $45\pi$ | Relaxation frequency coefficient | $45\pi$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF012_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF012_python.md)



## Recommended Uses

- Excitable-pulse recovery
- Preservation of unequal transition rates
- Recovery of damped post-pulse oscillations
- Testing denoising across several intrinsic scales

## Provenance

**Status:** Belousov–Zhabotinsky-type deterministic morphology surrogate, not a full kinetic model.

---

[← Previous: Morse](TF011_Morse.md) | [Signal Catalog](index.md) | [Next: ActionPotential →](TF013_ActionPotential.md)
