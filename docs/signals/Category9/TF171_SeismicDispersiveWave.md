# Seismic Dispersive Wave


## Overview

This seismological surrogate combines a quiet low-frequency baseline, a small early arrival, a broad dispersive wave packet, and a weak late coda. Its physically meaningful components differ substantially in amplitude, duration, and instantaneous frequency.

## Mathematical Definition

Let $u_a(x)=(x-a)_+$ and $I_a(x)=1$ when $x\ge a$ and $0$ otherwise. Then

$$
\begin{aligned}
f(x)={}&0.015\sin(6\pi x)
+0.10e^{-\frac12((x-0.24)/0.025)^2}\sin(84\pi x)\\
&+0.48I_{0.39}(x)e^{-\frac12((x-0.64)/0.16)^2}
\sin\{2\pi[34u_{0.39}(x)-10u_{0.39}(x)^2]\}\\
&+0.10I_{0.72}(x)e^{-9u_{0.72}(x)}\sin\{96\pi u_{0.72}(x)\}.
\end{aligned}
$$

[Seismic Dispersive Wave](../../assets/images/TF171_SeismicDispersiveWave.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Localized dispersive oscillation |
| Components | Baseline, early packet, main packet, coda |
| Frequency behavior | Decreasing frequency in the main packet |
| Amplitude hierarchy | Strong main arrival with weak precursor and coda |
| Main challenge | Preserve dispersion and low-amplitude arrivals |

## Parameters

| Feature | Location/onset | Scale |
|---|---:|---|
| Early arrival | $0.24$ | Gaussian width $0.025$ |
| Main packet | $0.39$ onward | Envelope centered at $0.64$ |
| Coda | $0.72$ onward | Decay rate $9$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF171_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF171_python.md)



## Recommended Uses

- Dispersive packet denoising
- Arrival-time and phase preservation
- Weak-coda recovery

## Provenance

This deterministic signal is inspired by qualitative seismic arrivals and dispersion. It is not a propagation simulation or recorded seismogram.

[← Previous: Van der Pol Relaxation](TF170_VanDerPolRelaxation.md) · [Category 9 catalog](index.md) · [Next: Tertiary Creep Failure →](TF172_TertiaryCreepFailure.md)
