# BEND-1D: Benchmark for Endpoint-Neutral Denoising in One Dimension

We adopt the name **BEND-1D**, standing for **Benchmark for Endpoint-Neutral Denoising in One Dimension**. BEND-1D is a morphology-oriented benchmark bank for one-dimensional signal denoising.

The present collection is referred to as **BEND-1D v1.0 (230 signals)**. The name is intentionally not tied to wavelets, to a particular denoising paradigm, or permanently to the number 230.

A complementary name for the future quantitative feature description is **MorphPrint**. Each signal will eventually receive a compact morphological feature vector, or *MorphPrint*, summarizing properties such as regularity, sparsity, oscillation, localization, multiscale energy, and discontinuity structure. Thus, BEND-1D denotes the signal library, whereas MorphPrint denotes its quantitative characterization.

## Nested Benchmark Cores

A large bank is useful for broad stress testing, but a benchmark also needs small, stable subsets that can be reproduced easily and compared across papers. We therefore propose the following nested architecture:

| Subset | Size | Purpose |
|---|---:|---|
| Core4 | 4 | Historical Donoho–Johnstone anchor set |
| Core12 | 12 | One representative from each morphology family |
| Core24 | 24 | Two representatives from each morphology family |
| Core48 | 48 | Four representatives from each morphology family |
| Core96 | 96 | Eight representatives from each morphology family |
| Full Bank | 230 | Broad scientific, engineering, and diagnostic coverage |

The subsets are nested: $$\mathrm{Core4}\subset\mathrm{Core12}\subset\mathrm{Core24}\subset\mathrm{Core48}\subset\mathrm{Core96}\subset\mathrm{BEND\text{-}1D}.$$

Core4 consists of the classical Blocks, Bumps, Doppler, and HeaviSine signals. These functions provide continuity with the classical wavelet-denoising literature. The larger cores should not be chosen according to which denoising method performs best. Their selection should be based only on signal morphology and coverage of the feature space.

## Twelve Morphology Families

The proposed organization uses twelve broad morphology families. They are intended as structural classes rather than application labels.

1. **Smooth global structure.**  
   Slowly varying trends, broad curvature, and globally smooth shapes.

2. **Piecewise-smooth and plateau structure.**  
   Smooth pieces separated by changes in level, slope, or regime.

3. **Jumps and steps.**  
   Controlled interior discontinuities of known location and magnitude.

4. **Cusps, corners, and derivative singularities.**  
   Continuous signals with localized loss of regularity.

5. **Isolated peaks and spikes.**  
   Sparse localized features spanning a range of widths and amplitudes.

6. **Peak clusters and resolution challenges.**  
   Doublets, multiplets, overlapping peaks, and closely spaced features.

7. **Periodic and quasi-periodic oscillation.**  
   Repeated oscillatory structure, beating, modulation, and recurrent waveforms.

8. **Chirps and evolving frequency.**  
   Signals whose local frequency changes substantially across the domain.

9. **Transients and ring-downs.**  
   Localized events followed by damped or dispersive oscillatory response.

10. **Repeated motifs and event trains.**  
    Pulse trains, physiological cycles, impacts, bursts, and other repeated localized structures.

11. **Multiscale, intermittent, and intrinsically rough structure.**  
    Signals containing important structure simultaneously over several scales, including deterministic roughness and intermittency.

12. **Composite and adversarial mixtures.**  
    Deliberately heterogeneous signals combining several morphologies in one record, including diagnostic and MishMash-type stress tests.

The twelve families need not be regarded as mutually exclusive. A signal may have a primary family and several secondary feature tags. The primary family is useful for constructing balanced benchmark cores; the secondary tags are useful for detailed performance analysis.

## How the Cores Should Be Selected

The benchmark cores should be selected *without reference to denoising performance*. This is essential if the bank is to be viewed as a neutral benchmark rather than as a collection tuned to favor a particular method.

Core12 should contain one representative of each morphology family, with the four classical Donoho–Johnstone signals retained as fixed historical anchors. Core24, Core48, and Core96 should expand each family in a balanced way by adding signals with different widths, scales, regularities, oscillation rates, degrees of sparsity, and feature interactions.

In a later stage, MorphPrint descriptors can be used to quantify similarity among signals. Clustering or space-filling selection in MorphPrint space can then provide an objective way to choose representatives while preserving the nested Core12–Core96 structure.

## What BEND-1D Should Be

BEND-1D should satisfy the following principles.

- **Method agnostic.**  
  The signal definitions must not depend on a particular wavelet, threshold, Bayesian prior, neural network, or denoising algorithm.

- **Defined on a common domain.**  
  Each clean signal is regarded as a deterministic function on $[0,1]$ and may be sampled at an arbitrary integer sample size $N$.

- **Boundary neutral.**  
  The canonical version of every benchmark signal should satisfy $f(0)=f(1)$. This prevents an unintended periodic-boundary jump from becoming part of the denoising problem.

- **Controlled singularities.**  
  If a signal contains a jump, cusp, corner, spike, or other singular feature, it should occur deliberately in the interior of the domain, and its location and strength should be documented.

- **Resolution scalable.**  
  Dyadic sample sizes remain important for classical wavelet experiments, but the bank itself should allow arbitrary $N$, including values such as $N=1000$ or $N=2000$.

- **Native clean signals.**  
  Noise level and SNR normalization should not be built into the signal definition. They belong to the experimental protocol.

- **Reproducible and versioned.**  
  Each function should have a permanent numerical identifier, a short stable name, a deterministic definition, provenance, and a version.

- **Morphology based.**  
  Scientific or engineering labels provide motivation, but classification should ultimately be based on the structural features of the signal.

- **Broad but interpretable.**  
  The full bank should contain enough diversity to expose important strengths and weaknesses of denoisers while keeping every function interpretable and documented.

- **Compatible with paired simulation.**  
  Benchmark comparisons should permit all methods to be applied to the same noisy realization, enabling paired Monte Carlo comparisons.

## What BEND-1D Should Not Be

BEND-1D should *not* be:

- a wavelet-only benchmark;
- a collection selected because a particular proposed method performs well on it;
- a set of visually interesting but undocumented curves;
- a claim that every application-inspired signal is a calibrated mechanistic simulator of the named physical process;
- a collection with accidental jumps created solely by mismatched endpoint values;
- restricted to dyadic sample sizes;
- tied permanently to one noise distribution, one SNR, or one value of $N$; or
- reduced to a single average-MSE leaderboard over hundreds of heterogeneous functions.

The application-inspired functions should therefore be described as deterministic morphology surrogates unless a particular signal is genuinely derived from empirical data or from a calibrated physical model.

## Benchmark Protocol Versus Signal Bank

The *bank* and the *benchmark protocol* should remain separate. BEND-1D defines the clean functions. A benchmark protocol specifies sampling size, noise model, noise level or SNR, Monte Carlo replication, performance measures, and any restrictions on tuning.

This separation permits the same bank to support Gaussian denoising, heavy-tailed noise, heteroscedastic noise, Poisson observations, correlated noise, and future observation models without redefining the clean signals.

The software should support arbitrary $N$, whereas published benchmark tables may use a small set of canonical sample sizes for reproducibility. Likewise, the bank should store signals on their native scale, while a simulation driver may rescale them to a common power SNR.

## Beyond a Single AMSE Ranking

No single numerical summary can adequately describe performance over a heterogeneous morphology bank. The principal signal-by-signal error measure may remain AMSE, but benchmark summaries should eventually include several complementary views: mean or median rank, relative risk, frequency of being near the best method, worst-case or lower-tail performance, and results stratified by morphology family.

For method $A$ and signal $s$, a useful normalized quantity is

```math
R_{A,s}
=
\frac{\mathrm{AMSE}_{A,s}}
     {\min_B \mathrm{AMSE}_{B,s}}.
```

A corresponding performance profile is

```math
P_A(r)
=
\frac{1}{S}
\sum_{s=1}^{S}
I\{R_{A,s}\leq r\},
```

which reports the fraction of benchmark signals on which method $A$ lies within a factor $r$ of the best observed method.

## Planned Second-Stage Standardization

The present consolidation is intentionally conservative: the existing functions, names, and formulas are first placed under one roof. The next stage will standardize the bank systematically. The principal tasks are:

1. make every function callable at arbitrary $N$;
2. enforce the boundary-neutral condition $f(0)=f(1)$;
3. move any unintended boundary discontinuity into a controlled interior feature, or redesign the signal while preserving its intended morphology;
4. assign permanent short names and numerical identifiers;
5. attach primary morphology families and secondary feature tags;
6. define MorphPrint descriptors and compute them for the entire bank;
7. identify redundancies and near-duplicates;
8. select the nested Core12, Core24, Core48, and Core96 subsets objectively;
9. specify canonical Monte Carlo protocols separately from the signal definitions; and
10. freeze a versioned public release of BEND-1D.

The guiding principle is that the benchmark should test a denoiser on *controlled signal morphology*, not on accidental implementation features of the test functions.

[&larr; Home](../README.md) | [Golden Rules](../docs/Rules.md)  | [Signal Catalog &rarr;](../docs/signals/index.md) 
