# StickSlip

The **StickSlip** signal models repeated linear loading followed by abrupt release. It is a deterministic sawtooth-like waveform motivated by frictional stress accumulation, fault slip, and atomic-force microscope loading traces.

## Mathematical Definition

Let the break points and loading amplitudes be $b=(0,0.16,0.34,0.52,0.73,1)$ and $h=(0.80,1.15,0.75,1.35,0.95).$

For $k=1,\ldots,5$,

$$
f(x)=
h_k\frac{x-b_k}{b_{k+1}-b_k},
\qquad
b_k\leq x<b_{k+1}.
$$

At each new segment, the signal is reset to zero. The endpoint is set to $f(1)=0$.

[View StickSlip signal](../../assets/images/TF003_StickSlip.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Jumps and steps |
| Secondary tags | Piecewise linear, repeated motifs, sawtooth |
| Continuity | Discontinuous at interior break points |
| Within-segment behavior | Linear loading |
| Number of loading segments | Five |
| Main challenge | Preserving ramps and abrupt releases simultaneously |

## Parameters

| Parameter | Meaning | Default |
|---|---|---|
| $N$ | Number of samples | 1024 |
| $b$ | Segment break points | $(0,0.16,0.34,0.52,0.73,1)$ |
| $h$ | Segment amplitudes | $(0.80,1.15,0.75,1.35,0.95)$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF003_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF003_python.md)



## Recommended Uses

- Recovery of piecewise-linear loading
- Detection and preservation of abrupt releases
- Testing oversmoothing near repeated jumps
- Evaluation of methods on unequal segment lengths and amplitudes

## Provenance

**Status:** Deterministic stick-slip morphology surrogate rather than a calibrated mechanical simulator.

---

[← Previous: Planck](TF002_Planck.md) | [Signal Catalog](index.md) | [Next: RingDown →](TF004_RingDown.md)
