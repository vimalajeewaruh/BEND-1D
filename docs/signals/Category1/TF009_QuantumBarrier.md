# QuantumBarrier

The **QuantumBarrier** signal represents transmission through a rectangular barrier. It combines tunneling behavior below the barrier with oscillatory transmission resonances above it.

## Mathematical Definition

Let the barrier height be $V_0=1$, the dimensionless width be $a=7$, and $E(x)=0.15+1.70x.$ 

For $E<V_0$,

$$
T(E)=
\left[
1+
\frac{
V_0^2\sinh^2\{a\sqrt{V_0-E}\}
}{
4E(V_0-E)
}
\right]^{-1}.
$$

For $E>V_0$,

$$
T(E) =
\left[
1+
\frac{
V_0^2\sin^2\{a\sqrt{E-V_0}\}
}{
4E(E-V_0)
}
\right]^{-1}.
$$

The test function is $f(x)=T(E(x))$. At $E=V_0$, the continuous limiting value is

$$
T(V_0)=\left(1+\frac{V_0a^2}{4}\right)^{-1}.
$$

[View QuantumBarrier signal](../../assets/images/TF009_QuantumBarrier.png)

## Morphological Characteristics

| Property | Description |
|---|---|
| Primary family | Composite and adversarial mixtures |
| Secondary tags | Smooth transition, resonances, evolving behavior |
| Barrier energy | $V_0=1$ |
| Energy range | $0.15\leq E\leq1.85$ |
| Below barrier | Tunneling-type behavior |
| Above barrier | Oscillatory resonances |
| Main challenge | Preserving transition and resonance structure |

## Parameters

| Parameter | Meaning | Default |
|---|---|---:|
| $N$ | Number of samples | 1024 |
| $V_0$ | Barrier height | 1 |
| $a$ | Dimensionless barrier width | 7 |
| $E(x)$ | Energy map | $0.15+1.70x$ |

## MATLAB Implementation

[View MATLAB implementation](../../codes/matlab/TF009_matlab.md)

## Python Implementation

[View Python implementation](../../codes/python/TF009_python.md)



## Recommended Uses

- Recovery of oscillatory resonances
- Preservation of tunneling-to-resonance transitions
- Testing amplitude distortion near narrow transmission maxima
- Evaluating denoising across changing local morphology

## Provenance

**Status:** Rectangular-quantum-barrier-inspired deterministic morphology surrogate.

---

[← Previous: ImpactSpring](TF008_ImpactSpring.md) | [Signal Catalog](index.md) | [Next: AvoidedCrossing →](TF010_AvoidedCrossing.md)
