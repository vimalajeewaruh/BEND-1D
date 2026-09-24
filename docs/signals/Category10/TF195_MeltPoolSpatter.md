# MeltPoolSpatter


## Overview

A broad thermal envelope carries sparse positive and negative spatter events and weak local oscillation. The spikes are legitimate signal features rather than contamination.

## Mathematical Definition

With $G(x;c,w)=e^{-((x-c)/w)^2/2}$,
$$
f(x)=0.12+0.72G(x;0.55,0.22)
+\sum_{k=1}^{6}a_kG(x;c_k,w_k)
+0.05G(x;0.58,0.20)\sin(36\pi x),
$$
where the signed event parameters are given in the code.

[MeltPoolSpatter signal](../../assets/images/TF195_MeltPoolSpatter.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Additive manufacturing |
| Structure | Gaussian background with sparse multiscale events |
| Regularity | Smooth but with extremely narrow high-curvature peaks |
| Main challenge | Preserve rare physical events without fitting noise |

## Parameters

| Parameter | Value |
|---|---|
| Envelope center/width | $0.55/0.22$ |
| Event centers | $0.21,0.37,0.49,0.58,0.74,0.79$ |
| Event widths | $0.0025$–$0.004$ |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF195_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF195_python.md)




## Recommended Uses

- Sparse-event preservation
- Thermal-envelope smoothing
- Outlier-versus-signal discrimination

## Provenance

This is a deterministic benchmark surrogate inspired by additive manufacturing measurement morphology. It is not a calibrated physical simulator.

[← Previous: RadarMicroDoppler](TF194_RadarMicroDoppler.md) · [Category 10 catalog](index.md) · [Next: CavitationCollapse →](TF196_CavitationCollapse.md)

