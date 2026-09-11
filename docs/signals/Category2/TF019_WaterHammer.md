# WaterHammer

The **WaterHammer** signal models a steep hydraulic front followed by damped acoustic ringing. It combines a rapid transition with persistent but decreasing high-frequency structure.

## Mathematical Definition

For $0\leq x\leq1$, let $u=x-0.30$. Then

$$
f(x)=
0.65\left[1+\tanh\{120(x-0.30)\}\right]
+0.38\mathbf{1}_{\{x\geq0.30\}}e^{-6u}\cos(54\pi u).
$$

The indicator $\mathbf{1}_{\{x\geq0.30\}}$ activates the acoustic response at the hydraulic-front location.

[View WaterHammer signal](../../assets/images/TF019_WaterHammer.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Rapid front with damped resonance |
| Signal type | Deterministic and nonstationary |
| Front location | $x=0.30$ |
| Post-front behavior | Exponentially damped oscillation |
| Continuity | Contains an activated oscillatory component at the front |
| Main challenge | Preserving high-frequency ringing near a steep transition |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $x_c$ | Front location | 0.30 |
| $120$ | Front sharpness | 120 |
| $6$ | Ringing decay rate | 6 |
| $54\pi$ | Ringing angular frequency | $54\pi$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF019_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF019_python.md)



## Recommended Uses

- Front preservation
- Damped-resonance recovery
- Transient oscillation denoising
- Joint edge-and-texture evaluation

## Provenance

**Status:** Hydraulic-transient-inspired deterministic surrogate.

---

[← Previous: Cantilever](TF018_Cantilever.md) | [Category 2 Catalog](index.md) | [Next: ThermalRunaway →](TF020_ThermalRunaway.md)

