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

[View ActionPotential signal](../assets/images/TF013_ActionPotential.png)

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

~~~matlab
N = 1024;
x = linspace(0,1,N);
depolarization = 1.20./(1+exp(-180*(x-0.23)));
repolarization = 1.05./(1+exp(-55*(x-0.53)));
undershoot = 0.22*exp(-((x-0.67)/0.065).^2);
f = depolarization-repolarization-undershoot;

plot(x,f,'LineWidth',1.5)
xlabel('x'); ylabel('f(x)');
title('TF013 — ActionPotential'); grid on
exportgraphics(gcf,'TF013_ActionPotential.png','Resolution',300);
~~~

## Python Implementation

~~~python
import numpy as np
import matplotlib.pyplot as plt

N = 1024
x = np.linspace(0, 1, N)
depolarization = 1.20/(1+np.exp(-180*(x-0.23)))
repolarization = 1.05/(1+np.exp(-55*(x-0.53)))
undershoot = 0.22*np.exp(-((x-0.67)/0.065)**2)
f = depolarization-repolarization-undershoot

plt.plot(x, f, linewidth=1.5)
plt.xlabel("x"); plt.ylabel("f(x)")
plt.title("TF013 — ActionPotential")
plt.grid(alpha=0.3)
plt.tight_layout()
plt.savefig("TF013_ActionPotential.png", dpi=300)
~~~

## Recommended Uses

- Preservation of fast rise and slower recovery
- Recovery of an after-hyperpolarization feature
- Testing distortion of pulse height and duration
- Multiscale physiological-morphology denoising

## Provenance

**Status:** Action-potential-inspired deterministic morphology surrogate, not a calibrated electrophysiological model.

---

[← Previous: BZPulse](TF012_BZPulse.md) | [Signal Catalog](index.md) | [Next: ECGBeat →](TF014_ECGBeat.md)
