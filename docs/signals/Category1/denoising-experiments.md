# Use of Signal Category 01 in Denoising Experiments

For a native test function $f_0$ and noise standard deviation $\sigma$, a common power-SNR normalization is

```math
f = f_0
\sqrt{
\frac{
\mathrm{SNR}_{\mathrm{target}}\sigma^2
}{
N^{-1}\sum_{i=1}^N f_0(t_i)^2
}
}.
```

This normalization preserves the morphology of each test function while placing the sixteen signals on a common signal-to-noise scale.

The library is intentionally heterogeneous. It includes jumps, derivative discontinuities, cusps, near-singularities, smooth asymmetric spectra, localized oscillations, multiscale resonances, pulse-like behavior, repeated impacts, and abrupt structural changes. It therefore provides a complementary application-oriented benchmark to the classical Donoho–Johnstone test signals.

> **Protocol note:** If arbitrary DC offsets should not contribute to signal power, use the centered-power normalization specified in the BEND-1D evaluation guidelines.

---

[← Return to Signal Catalog 01](index.md)
