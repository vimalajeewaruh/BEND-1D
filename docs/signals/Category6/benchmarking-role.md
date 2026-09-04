---
layout: default
title: Category 6 Benchmarking Role
---

# Category 6 Benchmarking Role

Category 6 deliberately mixes modern application domains and signal regularity classes. Its purpose is not to simulate complete systems, but to test whether denoising and smoothing methods preserve small, localized, multiscale, or scientifically meaningful morphology.

## Morphology Summary

| Signal | Benchmark morphology |
|---|---|
| PowerGridFault | Periodic carrier, sag, transient, and ring-down |
| GearboxDefect | Modulated vibration and recurring impacts |
| LidarMultiEcho | Unequal echoes and close-return resolution |
| RadarMicroDoppler | Chirp with phase/frequency modulation |
| MeltPoolInstability | Drift, process oscillation, spatter, and regime change |
| FiberOTDR | Decay, narrow reflectors, and attenuation step |
| NetworkTrafficBursts | Broad high-load periods with nested short bursts |
| LatencyIncident | Congestion ramp, irregular spike cluster, and recovery |
| CacheThrash | Finite rapid-switching regime |
| TrainingLossSchedule | Multirate decay, discrete improvements, and spikes |
| ExoplanetTransitSpots | Broad transit with weak internal anomaly |
| PulsarProfile | Sharp pulse, precursor, asymmetric tail, and interpulse |
| GravitationalWaveChirp | Accelerating chirp and damped ring-down |
| MicrolensingPlanet | Broad smooth peak with weak planetary perturbation |
| SolarFlare | Precursors, impulsive rise, and multirate decay |
| QuasarFlare | Wandering baseline and asymmetric transient |
| PromoDemand | Trend, seasonality, promotion, stockout, and carry-over |
| ProductLaunch | Sigmoidal adoption with viral burst and saturation |
| AdstockCampaign | Overlapping causal campaign responses |
| MarketFlashCrash | Abrupt loss, partial rebound, aftershock, and normalization |
| InventoryStockout | Smooth trajectory interrupted by a plateau |
| PercussiveAttackDecay | Sharp attack, multirate decay, and ringing |
| VibratoTone | Frequency and amplitude modulation |
| ChordBeating | Multitone interference and beat envelope |
| SpeechFormantTransition | Multiple moving oscillatory bands |
| AudioIntro | Layered tonal, rhythmic, and transient structure |
| MilankovitchCycles | Quasiperiodic cycles plus finite regime event |
| TurbiditeSequence | Repeated sharp onsets and graded decays |
| CavefishNeuromast | Onset, sustained adaptation, and off-response |
| NeuralBurstAdaptation | Decreasing-amplitude, increasing-width burst train |

## Use in Denoising Experiments

All native functions are defined on $0\le x\le1$. For samples $f_0(x_i)$ and Gaussian noise standard deviation $\sigma$, a centered power-SNR normalization is recommended:

$$
\bar f_0=\frac{1}{N}\sum_{i=1}^{N}f_0(x_i),\qquad
P_0=\frac{1}{N}\sum_{i=1}^{N}[f_0(x_i)-\bar f_0]^2,
$$

$$
f(x_i)=\bar f_0+[f_0(x_i)-\bar f_0]
\sqrt{\frac{\mathrm{SNR}_{\mathrm{target}}\,\sigma^2}{P_0}}.
$$

This retains the DC level and morphology while equalizing the centered signal power. If the benchmark protocol instead prescribes uncentered power, state that choice explicitly so results remain reproducible.

## Reporting Guidance

- Use the same noisy realization for all methods within each Monte Carlo replication.
- Report signal-wise errors before aggregation.
- Prefer relative AMSE and geometric aggregation over pooling raw AMSEs across heterogeneous signals.
- Include morphology-specific results so strong performance on a few high-error functions cannot dominate the conclusion.
- Keep all sampling, SNR, noise, boundary-handling, and random-seed choices explicit.

---

[← Return to Category 6 Catalog](index.md)
