# Category 2 Benchmarking Role

The second BEND-1D module deliberately mixes several regularity classes. Many signals contain a dominant low-frequency structure together with a weaker local feature, oscillation, slope defect, transient, or structural change.

## Morphology Summary

| Signal | Benchmarking role |
|---|---|
| Klatno | Localized smooth transition with weak oscillations |
| Cantilever | Multimode smooth structure with a slope defect |
| WaterHammer | Front with damped resonance |
| ThermalRunaway | Accelerating trend, instability, and quench |
| Diffraction | Dominant peak, fringes, and weak satellite |
| Titration | Multiple unequal transitions with a shoulder |
| RabiChirp | Chirp with decaying amplitude |
| MuscleTwitch | Irregular overlapping causal pulses |
| Platinum5Y | Empirical multiscale market structure |
| FlashCrash | Structural break, rebound, and transient burst |

## Power-SNR Normalization

All functions are defined on $0\leq x\leq1$ in native form. For a native signal $f_0$ and Gaussian noise standard deviation $\sigma$, the common power-SNR normalization is

$$
f(x_i)=
f_0(x_i)
\sqrt{
\frac{
\mathrm{SNR}_{\mathrm{target}}\,\sigma^2
}{
N^{-1}\sum_{j=1}^{N}f_0(x_j)^2
}
}.
$$

This transformation preserves morphology while placing signals on a common nominal signal-to-noise scale.

> If arbitrary DC offsets should not contribute to signal strength, use centered power instead: replace $f_0(x_i)$ inside the power calculation by $f_0(x_i)-\overline{f_0}$ and restore the desired mean after scaling.

## Reproducibility Notes

- Use the same sampling grid and sample count for all methods.
- Generate one noisy realization per Monte Carlo replication and give that same realization to every method.
- Record all parameter values and any implementation conventions.
- Keep native-signal generation separate from power-SNR normalization.
- For Platinum5Y, archive the exact 60 monthly source observations and their provenance.

---

[← Return to Category 2 Catalog](index.md)
