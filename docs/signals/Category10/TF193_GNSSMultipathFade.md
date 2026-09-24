# GNSSMultipathFade


## Overview

A slowly varying received-signal baseline contains destructive-interference notches of unequal depth and width, together with localized high-frequency ripple.

## Mathematical Definition

With $G(x;c,w)=e^{-((x-c)/w)^2/2}$,
$$
f(x)=0.65+0.08\sin(3\pi x)+0.035\sin(32\pi x+0.4)
-\sum_{k=1}^{4}a_kG(x;c_k,w_k)
+0.06G(x;0.52,0.08)\sin(66\pi x),
$$
where the fade vectors are listed in the code.

[GNSSMultipathFade signal](../../assets/images/TF193_GNSSMultipathFade.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Application family | Navigation |
| Structure | Smooth baseline minus four Gaussian fades plus ripple |
| Regularity | Smooth with narrow high-curvature depressions |
| Main challenge | Keep deep fades from being treated as isolated outliers |

## Parameters

| Parameter | Value |
|---|---|
| Fade centers | $0.23,0.51,0.73,0.86$ |
| Fade depths | $0.42,0.56,0.34,0.46$ |
| Ripple carrier | $33$ cycles/unit |


## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF193_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF193_python.md)




## Recommended Uses

- Fade-depth preservation
- Multipath morphology recovery
- Localized-ripple denoising

## Provenance

This is a deterministic benchmark surrogate inspired by navigation measurement morphology. It is not a calibrated physical simulator.

[← Previous: FuelCellFloodDry](TF192_FuelCellFloodDry.md) · [Category 10 catalog](index.md) · [Next: RadarMicroDoppler →](TF194_RadarMicroDoppler.md)

