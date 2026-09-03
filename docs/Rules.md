# Golden Rules for Fair Benchmark Comparison

For large benchmark collections such as Core48, Core96, and the full
BEND-1D, publication-space limitations will often make it impractical to
report every signal-by-signal AMSE in the main article.  Global summaries are
therefore necessary, but they must be constructed so that no individual
signal, scale of measurement, or overrepresented morphology class can
dominate the comparison.

We propose the following **Golden Rules**.

---

### GR1. Equalize Signal Power Before Comparing Denoisers

For a clean signal $f=(f_1,\ldots,f_N)$, define its centered power by

```math
P_f=\frac{1}{N}\sum_{i=1}^N(f_i-\bar f)^2.
```

For a prescribed noise standard deviation $\sigma$ and target SNR, rescale the nonconstant component so that

```math
\frac{P_f}{\sigma^2}=\mathrm{SNR}.
```

Thus,

```math
f_i^*
=
\bar f+
(f_i-\bar f)
\sqrt{
\frac{\mathrm{SNR}\,\sigma^2}
{N^{-1}\sum_{k=1}^N(f_k-\bar f)^2}
}.
```

Centered power is preferable to $\sum_i f_i^2$, since an arbitrary DC level should not artificially increase the nominal signal strength.

---

### GR2. Do Not Pool Raw AMSEs Across Heterogeneous Signals

Even after common SNR normalization, different signal morphologies can have very different intrinsic denoising difficulty. Consequently,

```math
\frac{1}{S}\sum_{s=1}^S \mathrm{AMSE}_{A,s}
```

should not be used as the primary global score. A few intrinsically difficult signals could otherwise determine the ranking.

---

### GR3. Give Every Signal One Vote

For method $A$ and a fixed reference method $R$, define the signal-wise relative AMSE as

```math
r_{A,s}
=
\frac{\mathrm{AMSE}_{A,s}}
     {\mathrm{AMSE}_{R,s}}.
```

The corresponding percentage improvement is

```math
I_{A,s}
=
100(1-r_{A,s})\%.
```

Thus, a signal with an AMSE near $0.4$ receives no more weight than a signal with an AMSE near $0.04$.

---

### GR4. Aggregate Relative Risks Geometrically

The natural global relative-AMSE score is

```math
G_A
=
\exp\left\{
\frac{1}{S}
\sum_{s=1}^S
\log r_{A,s}
\right\}.
```

The global improvement relative to the reference is then

```math
\boxed{
\mathrm{Improvement}_A
=
100(1-G_A)\%.
}
```

The geometric mean is preferable to averaging percentage improvements directly. For example, relative risks $1/2$ and $2$ balance exactly on the multiplicative scale.

---

### GR5. Give Every Morphology Class Equal Weight

Let $c=1,\ldots,12$ denote the twelve morphology families, and let $\mathcal S_c$ contain the $n_c$ signals in family $c$. Define the class-specific relative-AMSE score by

```math
G_{A,c}
=
\exp\left\{
\frac{1}{n_c}
\sum_{s\in\mathcal S_c}
\log r_{A,s}
\right\}.
```

The morphology-balanced global score is

```math
G_A^{\mathrm{BEND}}
=
\exp\left\{
\frac{1}{12}
\sum_{c=1}^{12}
\log G_{A,c}
\right\}.
```

Hence, every morphology family receives exactly $1/12$ of the global weight, regardless of how many functions happen to belong to that family.

The corresponding BEND-1D improvement is

```math
\boxed{
\mathrm{BEND\ Improvement}_A
=
100(1-G_A^{\mathrm{BEND}})\%.
}
```

---

### G6. Use Balanced Cores Whenever Possible

Core12, Core24, Core48, and Core96 are designed to contain, respectively, $1$, $2$, $4$, and $8$ representatives from each of the twelve morphology families.

Therefore, for these balanced cores, equal weighting of individual signals automatically gives equal weighting to the morphology families. This is an important advantage of the nested construction

```math
\mathrm{Core12}
\subset
\mathrm{Core24}
\subset
\mathrm{Core48}
\subset
\mathrm{Core96}.
```

---

### GR7. Distinguish Improvement from Relative-to-Best Performance

When a scientifically meaningful fixed reference $R$ is declared in advance, $r_{A,s}$ and $G_A$ may legitimately be interpreted as relative improvement over that reference.

For comparisons among many competing methods, one may instead define

```math
q_{A,s}
=
\frac{\mathrm{AMSE}_{A,s}}
     {\min_B\mathrm{AMSE}_{B,s}}.
```

This measures performance relative to the best observed method for each signal. It should be called a *relative-to-best score*, not percentage improvement, because its denominator changes when the collection of methods changes.

---

### GR8. Report Both Global and Morphology-Specific Performance

For Core48 and larger benchmarks, the main article need not display all signal-by-signal AMSEs. A compact summary should include at least:

- the global morphology-balanced relative-AMSE score;
- the percentage improvement over a fixed reference;
- the twelve morphology-specific scores $G_{A,c}$;
- the number or fraction of signal-wise wins;
- the fraction of signals within a prescribed tolerance of the best method, such as $5\%$; and
- a measure of poor-case performance, such as the worst-performing morphology class or an upper quantile of relative AMSE.

Complete signal-by-signal AMSE tables should remain available in supplementary material or in the benchmark repository.

---

### GR9. Use Paired Monte Carlo Comparisons

Within each signal and Monte Carlo replication, all denoising methods should receive exactly the same noisy realization. Comparisons of AMSE and method-to-method differences should therefore exploit the paired design.

---

### GR10. No Single Signal Should Be Able to Determine the Conclusion

The guiding principle of global BEND-1D evaluation is

```math
\boxed{
\text{one signal, one vote; one morphology family, one fair share}.
}
```

A benchmark should identify methods that perform consistently across different signal structures, rather than methods whose global score is driven by exceptional performance on a small number of high-error functions.

---

These rules separate three distinct issues: normalization of the clean signals, evaluation of a method on each signal, and aggregation of performance across a heterogeneous benchmark.  Keeping these stages separate is essential for a fair and interpretable BEND-1D comparison.



[&larr; Previous (BEND-1D)](../README.md) |
[Return to Signal Catalog](index.md) |
[&rarr; Next (Golden Rules)](../docs/Rules.md)
