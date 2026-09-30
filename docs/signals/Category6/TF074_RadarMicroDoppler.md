# RadarMicroDoppler

## Overview

The **RadarMicroDoppler** signal combines changing instantaneous frequency, slow phase modulation, a broad amplitude envelope, and a higher-frequency side component.

## Mathematical Definition

Define the primary phase

```math
\phi(x)=2\pi
\left[
f_0x+\beta x^2+A_m\sin(2\pi f_mx)
\right].
```

Define the amplitude envelope

```math
E(x)=b_E+A_E
\exp\left[
-\frac12\left(\frac{x-\mu_E}{s_E}\right)^2
\right].
```

Define the micro-Doppler side component

```math
M(x)=A_M
\sin\left\{
2\pi\left[
f_Mx+\beta_M\sin(2\pi f_{mM}x)
\right]
\right\}.
```

The signal is

```math
f(x)=E(x)\sin\phi(x)+M(x).
```

[View RadarMicroDoppler signal](../../assets/images/TF074_RadarMicroDoppler.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Chirp with micro-Doppler phase modulation |
| Envelope center | $x=\mu_E$ |
| Side component | Nominal frequency $f_M$ |
| Main challenge | Preserving local phase and frequency structure |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $f_0$ | Initial chirp frequency | 12 |
| $\beta$ | Quadratic phase coefficient | 24 |
| $A_m$ | Primary phase-modulation magnitude | 0.50 |
| $f_m$ | Primary modulation frequency | 3 |
| $b_E$ | Envelope baseline | 0.32 |
| $A_E$ | Envelope amplitude | 0.68 |
| $\mu_E$ | Envelope center | 0.58 |
| $s_E$ | Envelope width | 0.30 |
| $A_M$ | Side-component amplitude | 0.16 |
| $f_M$ | Side-component nominal frequency | 62 |
| $\beta_M$ | Side-component phase-modulation magnitude | 3 |
| $f_{mM}$ | Side-component modulation frequency | 2 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF074_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF074_python.md)



## Recommended Uses

- Micro-Doppler denoising
- Time-varying frequency preservation
- Phase-modulation recovery

## Provenance

**Status:** Radar-micro-Doppler-inspired deterministic sensing surrogate.

---

[← Previous: LidarMultiEcho](TF073_LidarMultiEcho.md) | [Category 6 Catalog](index.md) | [Next: MeltPoolInstability →](TF075_MeltPoolInstability.md)

