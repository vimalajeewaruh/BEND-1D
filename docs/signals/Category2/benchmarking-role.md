# Category 2 Benchmarking Role

The second BEND-1D module deliberately mixes several regularity classes. Many signals contain a dominant low-frequency structure together with a weaker local feature, oscillation, slope defect, transient, or structural change.

## Morphology Summary

| Signal | Benchmarking role |
|---|---|
| [Klatno](TF017_Klatno.md) | Localized smooth transition with weak oscillations |
| [Cantilever](TF018_Cantilever.md) | Multimode smooth structure with a slope defect |
| [WaterHammer](TF019_WaterHammer.md) | Front with damped resonance |
| [ThermalRunaway](TF020_ThermalRunaway.md) | Accelerating trend, instability, and quench |
| [Diffraction](TF021_Diffraction.md) | Dominant peak, fringes, and weak satellite |
| [Titration](TF022_Titration.md) | Multiple unequal transitions with a shoulder |
| [RabiChirp](TF023_RabiChirp.md) | Chirp with decaying amplitude |
| [MuscleTwitch](TF024_MuscleTwitch.md) | Irregular overlapping causal pulses |
| [Platinum5Y](TF025_Platinum5Y.md) | Empirical multiscale market structure |
| [FlashCrash](TF026_FlashCrash.md) | Structural break, rebound, and transient burst |

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
