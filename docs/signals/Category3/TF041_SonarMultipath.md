# SonarMultipath

## Overview

The **SonarMultipath** signal combines a localized frequency-modulated ping, two weaker delayed replicas, and a damped low-amplitude reverberation tail. It contains a strong amplitude hierarchy and multiscale propagation structure.

## Mathematical Definition

Let

$$
C(x;c,s,f_0,f_1,A)=\mathrm{chirp\_packet}(x,c,s,f_0,f_1,A)
$$

denote the project-specific localized chirp-packet helper. The supplied source defines the direct and multipath components as

$$
P(x)=C(x;0.22,0.030,28,145,1.00)
+C(x;0.405,0.036,28,120,0.48)
+C(x;0.545,0.043,26,105,0.28).
$$

Let $u=x-0.56$. The reverberation tail is

$$
R(x)=0.18\mathbf{1}_{\{u\geq0\}}e^{-5.5u}
\left[\sin(36\pi u)+0.35\sin(86\pi u+0.5)\right].
$$

The signal is

$$
f(x)=P(x)+R(x).
$$

> **Required dependency:** The supplied MATLAB block calls `chirp_packet` but does not include its definition. Add the authoritative helper to reproduce the reference signal exactly. This page does not invent a replacement formula.

[SonarMultipath signal](../../assets/images/TF041_SonarMultipath.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Localized chirp with multipath and reverberation |
| Direct arrival | Centered at $x=0.22$ |
| Delayed arrivals | Centered at $x=0.405$ and $x=0.545$ |
| Reverberation onset | $x=0.56$ |
| Main challenge | Preserving delayed weak copies and diffuse oscillatory tail |

## Parameters

| Component | Center | Width | Frequency arguments | Amplitude |
|---|---:|---:|---:|---:|
| Direct ping | 0.220 | 0.030 | 28, 145 | 1.00 |
| First path | 0.405 | 0.036 | 28, 120 | 0.48 |
| Second path | 0.545 | 0.043 | 26, 105 | 0.28 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF040_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF040_python.md)

The exact Python implementation also requires a translation of the authoritative `chirp_packet` helper. Once that function is available, the supplied construction is:



## Recommended Uses

- Multipath-arrival separation
- Localized chirp denoising
- Reverberation-tail preservation
- Strong-to-weak amplitude-hierarchy evaluation

## Provenance

**Status:** Sonar-multipath-inspired deterministic acoustic surrogate; exact generation requires the project helper `chirp_packet`.

---

[← Previous: WhaleClicks](TF040_WhaleClicks.md) | [Category 3 Catalog](index.md) | [Next: LightningSferic →](TF042_LightningSferic.md)

