---
layout: default
title: Category 8 Benchmarking Role
---

# Category 8 Benchmarking Role

Category 8 combines fifteen modern sensing surrogates with fifteen adversarial MishMash signals. It is designed to expose oversmoothing, resolution loss, phase distortion, poor local adaptation, and the limitations of judging recovery only through global mean squared error.

## Morphology Summary

| Signal | Benchmark morphology |
|---|---|
| DASFiberEvent | Localized fading chirp and secondary echo |
| PhotoacousticAline | Attenuated bipolar responses with close pair |
| OCTRetinalProfile | Layered reflectors and thin weak layer |
| UltrasoundCrackEcho | Ring-down, weak crack echo, dominant reflector, reverberation |
| WearableGaitIMU | Changing cadence, heel strikes, stumble, and recovery |
| EEGSeizureOnset | Weak precursor, growing episode, and suppression |
| MRFreeInductionDecay | Multiple damped frequencies and relaxation rates |
| ATACChromatinAccessibility | Broad genomic regions containing narrow peaks |
| WindTurbineGustControl | Periodicity, gust, damped control response, and shift |
| EVFastCharge | Nonlinear rise, regime changes, ripple, and saturation |
| GridInverterOscillation | Load disturbance, decaying chirp, and intervention |
| SatelliteReactionWheel | Harmonics, resonance packet, and narrow impulse |
| MicrofluidicDropletTrain | Unequal pulses, doublet, coalescence, and weak event |
| TerahertzLayerEcho | Bipolar echoes, close interfaces, and dispersive tail |
| BridgeStrainEvent | Drift, repeated loads, slip, and ringing |
| MishMashAlpha | Trend, cusp, bump, jump, and chirp |
| MishMashBeta | Oscillation, compression, plateau, spike, and shoulder |
| DoubletOnCliff | Close doublet on steep edge |
| NeedleInChirp | Weak needle embedded in dense chirp |
| DerivativeZoo | Near jump, kink, curvature change, cusp, and smooth bump |
| MultiscaleComb | Three simultaneous peak resolutions |
| FrequencyCrossing | Crossing increasing and decreasing chirps |
| PhaseResetBurst | Phase reset and localized high-frequency packet |
| LacunaryCascade | Alternating geometrically shrinking events |
| SmoothRoughSmooth | Abrupt change in local regularity |
| PeakOnPeak | Hierarchically nested peaks and notch |
| FalseFlat | Weak central structure between high-energy ends |
| SymmetryBreak | Weak perturbation breaking dominant symmetry |
| CompressionStorm | Compressed alternating events and accelerating oscillation |
| GrandMishMash | Comprehensive incompatible local geometries |

## Use in Denoising Experiments

All native functions are defined on $0\le x\le1$. For samples $f_0(x_i)$ and Gaussian noise standard deviation $\sigma$, use centered power-SNR normalization:

$$
\bar f_0=\frac{1}{N}\sum_{i=1}^{N}f_0(x_i),\qquad
P_0=\frac{1}{N}\sum_{i=1}^{N}[f_0(x_i)-\bar f_0]^2,
$$

$$
f(x_i)=\bar f_0+[f_0(x_i)-\bar f_0]
\sqrt{\frac{\mathrm{SNR}_{\mathrm{target}}\,\sigma^2}{P_0}}.
$$

This transformation retains the DC level and morphology while equalizing centered signal power.

## Reporting Guidance

- Use paired noisy realizations when comparing denoisers.
- Report signal-wise errors before global aggregation.
- Prefer relative AMSE and geometric aggregation across heterogeneous signals.
- Include local feature diagnostics for weak or nested structures.
- Report edge, peak-count, phase, or event-localization errors when scientifically relevant.
- State the sampling grid, SNR convention, noise model, boundary handling, and random seed.

---

[← Return to Category 8 Catalog](index.md)
