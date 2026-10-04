# NestedWavePackets


## Overview

The **NestedWavePackets** signal explicitly nests a broad low-frequency packet, a shorter intermediate-frequency packet, and a very short high-frequency burst.

## Mathematical Definition

Define the Gaussian function

```math
g(x;c,w)=
\exp\left[
-\frac12\left(\frac{x-c}{w}\right)^2
\right].
```

For $k=1,\ldots,K$, define the oscillatory packet

```math
P_k(x)=
A_k g(x;c_k,w_k)
\sin(2\pi f_kx).
```

The signal is

```math
f(x)=
\sum_{k=1}^{K}P_k(x).
```

The packet amplitudes, centers, widths, and frequencies are

```math
\mathbf{A}=(0.30,\,0.24,\,0.17),
```

```math
\mathbf{c}=(0.50,\,0.56,\,0.59),
```

```math
\mathbf{w}=(0.22,\,0.080,\,0.022),
```

```math
\mathbf{f}=(8,\,28,\,85).
```

[View NestedWavePackets signal](../../assets/images/TF124_NestedWavePackets.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Explicitly nested oscillatory packets |
| Packet widths | $0.22$, $0.080$, and $0.022$ |
| Packet frequencies | $8$, $28$, and $85$ cycles per unit interval |
| Packet centers | $0.50$, $0.56$, and $0.59$ |
| Main challenge | Retaining the shortest packet without fragmenting broad structure |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $K$ | Number of oscillatory packets | 3 |
| $\mathbf{A}$ | Packet amplitudes | $(0.30,\,0.24,\,0.17)$ |
| $\mathbf{c}$ | Packet centers | $(0.50,\,0.56,\,0.59)$ |
| $\mathbf{w}$ | Packet widths | $(0.22,\,0.080,\,0.022)$ |
| $\mathbf{f}$ | Packet frequencies | $(8,\,28,\,85)$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF124_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF124_python.md)


## Recommended Uses

- Multiscale packet denoising
- Local frequency preservation
- Nested-structure recovery

## Provenance

**Status:** Deliberately artificial nested-wave-packet stress test.

---

[← Previous: HiddenNeedle](TF123_HiddenNeedle.md) | [Category 7 Catalog](index.md) | [Next: CancellationTrap →](TF125_CancellationTrap.md)
