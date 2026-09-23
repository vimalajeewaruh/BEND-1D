# TF157 — DispersiveHydraulicJump


## Overview

The **DispersiveHydraulicJump** signal contains a steep front followed by a genuine decaying, changing-frequency dispersive wavetrain.

## Mathematical Definition

Let $S(x;c,w)=[1+e^{-(x-c)/w}]^{-1}$ and $u=(x-0.34)_+$. Then

$$
f(x)=0.12+0.07x+0.64S(x;0.34,0.006)
+0.22I(x\ge0.34)e^{-7.5u}\sin[2\pi(17u+12u^2)].
$$

[DispersiveHydraulicJump signal](../../assets/images/TF157_DispersiveHydraulicJump.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Steep transition with dispersive wavetrain |
| Front | Near $x=0.34$ |
| Post-front structure | Decaying chirped oscillation |
| Main challenge | Avoiding removal of genuine waves as estimator ringing |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $0.64$ | Jump magnitude | 0.64 |
| $7.5$ | Wavetrain decay rate | 7.5 |
| $12$ | Quadratic phase coefficient | 12 |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF157_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF157_python.md)




## Recommended Uses

- Dispersive-front denoising
- Genuine-ringing preservation
- Phase-coherent tail recovery

## Provenance

**Status:** Dispersive-hydraulic-jump-inspired deterministic surrogate.

---

[← Previous: RiemannShockFan](TF156_RiemannShockFan.md) | [Category 9 Catalog](index.md) | [Next: XAFSEdge →](TF158_XAFSEdge.md)
