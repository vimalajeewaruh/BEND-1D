# ActionPotential
The **ActionPotential** signal is a simplified membrane-voltage morphology. Its three components represent rapid depolarization, slower repolarization, and an after-hyperpolarization or undershoot.

## Mathematical Definition

```math
f(x) ={}
\frac{1.20}{1+\exp\{-180(x-0.23)\}} -
\frac{1.05}{1+\exp\{-55(x-0.53)\}} -
0.22
\exp
\left\{
-\left(
\frac{x-0.67}{0.065}
\right)^2
\right\}.
```

[View ActionPotential signal](../../assets/images/TF013_ActionPotential.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Repeated motifs and event trains |
| Secondary tags | Pulse, asymmetric transitions, undershoot |
| Depolarization | Rapid logistic rise |
| Repolarization | Slower logistic decrease |
| After-potential | Broad negative Gaussian |
| Main challenge | Preserving biologically distinct time scales |

## Parameters

| Component | Location | Scale/steepness | Amplitude |
|---|---:|---:|---:|
| Depolarization | 0.23 | 180 | 1.20 |
| Repolarization | 0.53 | 55 | $-1.05$ |
| Undershoot | 0.67 | 0.065 | $-0.22$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF013_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF013_python.md)



## Recommended Uses

- Preservation of fast rise and slower recovery
- Recovery of an after-hyperpolarization feature
- Testing distortion of pulse height and duration
- Multiscale physiological-morphology denoising

## Provenance

**Status:** Action-potential-inspired deterministic morphology surrogate, not a calibrated electrophysiological model.

---

[← Previous: BZPulse](TF012_BZPulse.md) | [Signal Catalog](index.md) | [Next: ECGBeat →](TF014_ECGBeat.md)
