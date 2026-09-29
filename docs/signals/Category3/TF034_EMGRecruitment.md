# EMGRecruitment

## Overview

The **EMGRecruitment** signal represents progressive recruitment of muscle activity. It evolves from low-amplitude oscillation to dense, energetic multiband activity, providing both sparse and nonsparse coefficient regimes within one record.

## Mathematical Definition

Define the Gaussian kernel

```math
G(x;\mu,s)=
\exp\left[
-\frac{1}{2}
\left(\frac{x-\mu}{s}\right)^2
\right].
```

For pulse center $c_k$, define

```math
P_k(x)=
1.05G(x;c_k,s_1)
+0.48G(x;c_k+0.022,0.020)
-0.23G(x;c_k+0.039,s_2)
+0.20G(x;c_k+0.056,0.016).
```

For $k=1,\ldots,K$, define the pulse centers

```math
c_k=c_0+d(k-1),
```

and the slowly varying amplitudes

```math
a_k=
a_0+a_1\sin\left(\frac{2\pi(k-1)}{K}\right).
```

The signal is

```math
f(x)=b+\sum_{k=1}^{K}a_kP_k(x).
```

[View EMGRecruitment signal](../../assets/images/TF034_EMGRecruitment.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Repeated asymmetric multiscale pulses |
| Number of pulses | $K$ |
| Local features | Systolic peak, shoulder, notch, and reflection |
| Beat variability | Slowly varying amplitude |
| Main challenge | Preserving narrow and broad components within each beat |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $K$ | Number of pulses | 9 |
| $c_0$ | First pulse center | 0.07 |
| $d$ | Pulse spacing | 0.115 |
| $s_1$ | Systolic width | 0.010 |
| $s_2$ | Notch width | 0.006 |
| $a_0$ | Mean pulse amplitude | 0.92 |
| $a_1$ | Pulse-amplitude modulation | 0.08 |
| $b$ | Signal baseline | 0.08 |
## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF034_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF034_python.md)



## Recommended Uses

- Nonstationary EMG-like denoising
- Progressive recruitment detection
- Sparse-to-dense regime adaptation
- Multiband oscillation preservation

## Provenance

**Status:** EMG-recruitment-inspired deterministic physiological surrogate.

---

[← Previous: ArterialPulse](TF033_ArterialPulse.md) | [Category 3 Catalog](index.md) | [Next: BearingFault →](TF035_BearingFault.md)
