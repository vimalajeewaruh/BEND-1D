
---
layout: default
title: Black-Body Spectrum
---

# Black-Body Spectrum

![Black-body spectrum](../assets/images/black-body-spectrum.png)

## Overview

The **Black-Body Spectrum** signal is a dimensionless representation of
a Planck-type spectral profile. It is smooth over the entire signal domain
but has a strongly asymmetric shape. The signal initially increases rapidly,
reaches a single spectral maximum, and then decreases more gradually along an
extended tail.

This morphology is useful for evaluating whether a signal-processing method
can preserve strongly varying curvature, peak location, and asymmetric
behavior without introducing artificial discontinuities or oscillations.

The signal is a dimensionless benchmark profile and should not be interpreted
as a physically calibrated black-body radiation spectrum.

## Mathematical Definition

For $0\leq x\leq 1$, define the transformed spectral coordinate

```math
\lambda(x)=0.08+0.92x.
```

The Black-Body Spectrum signal is then defined by

```math
f(x)=
\frac{\lambda(x)^{-5}}
{\exp\left\{2.5/\lambda(x)\right\}-1}.
```

Equivalently, after substituting the expression for $\lambda(x)$,

```math
f(x)=
\frac{(0.08+0.92x)^{-5}}
{\exp\left\{2.5/(0.08+0.92x)\right\}-1}.
```

The transformation maps the normalized domain $0\leq x\leq1$ to

```math
0.08\leq\lambda(x)\leq1.
```

Because $\lambda(x)>0$ throughout the domain, the denominator is strictly
positive and the signal is smooth everywhere on $[0,1]$.

The signal reaches its maximum approximately when

```math
\lambda(x)\approx 0.5035,
```

which corresponds to

```math
x\approx
\frac{0.5035-0.08}{0.92}
\approx 0.46.
```

Thus, the spectral maximum occurs before the midpoint of the domain, giving
the signal its asymmetric shape and relatively long right tail.

## Morphological Characteristics

| Property | Description |
|---|---|
| Signal family | Smooth, asymmetric, and peak-shaped signals |
| Signal type | Deterministic and nonstationary |
| Domain | $0\leq x\leq1$ |
| Transformed domain | $0.08\leq\lambda(x)\leq1$ |
| Continuity | Continuous everywhere |
| Differentiability | Infinitely differentiable on $[0,1]$ |
| Jump discontinuities | None |
| Oscillatory behavior | None |
| Number of principal peaks | One |
| Symmetry | Strongly asymmetric |
| Initial behavior | Steep increase |
| Final behavior | Gradually decreasing tail |
| Main feature | Smooth spectral maximum |
| Primary challenge | Preserving the peak and strongly varying curvature |

## Parameters

A more general version of the signal can be written as

```math
\lambda(x)=\lambda_{\min}+s x
```

and

```math
f(x)=
A\frac{\lambda(x)^{-5}}
{\exp\left\{c/\lambda(x)\right\}-1},
```

where $A$ is an amplitude multiplier, $\lambda_{\min}$ is the lower spectral
bound, $s$ controls the spectral range, and $c$ controls the location and shape
of the spectral maximum.

The default parameter values are:

| Parameter | Description | Default | Allowed values |
|---|---|---:|---|
| `n` | Number of sampled observations | 1024 | Integer $n\geq2$ |
| `lambda_min` | Lower value of $\lambda(x)$ | 0.08 | Positive real number |
| `lambda_scale` | Increase in $\lambda(x)$ over the domain | 0.92 | Positive real number |
| `shape` | Exponential shape parameter | 2.5 | Positive real number |
| `amplitude` | Global amplitude multiplier | 1.0 | Positive real number |

For the default values,

```math
\lambda(x)=\mathtt{lambda\_min}
+\mathtt{lambda\_scale}\,x
=0.08+0.92x.
```

## MATLAB Implementation

```matlab
% Dimensionless Black-Body Spectrum signal
clear;
close all;
clc;

% Signal parameters
n = 1024;
lambdaMin = 0.08;
lambdaScale = 0.92;
shape = 2.5;
amplitude = 1.0;

% Sampling locations
x = linspace(0, 1, n);

% Transformed spectral coordinate
lambda = lambdaMin + lambdaScale * x;

% Generate the signal
% expm1(z) evaluates exp(z)-1 accurately.
f = amplitude * lambda.^(-5) ./ expm1(shape ./ lambda);

% Locate the sampled maximum
[maximumValue, maximumIndex] = max(f);
maximumLocation = x(maximumIndex);

% Plot the signal
figure('Color', 'w');
plot(x, f, 'b-', 'LineWidth', 1.8);
hold on;

plot(maximumLocation, maximumValue, 'ro', ...
    'MarkerFaceColor', 'r', ...
    'MarkerSize', 6);

xline(maximumLocation, '--r', ...
    'Spectral maximum', ...
    'LineWidth', 1.1);

hold off;

xlabel('x');
ylabel('f(x)');
title('Dimensionless Black-Body Spectrum');
grid on;
box on;
xlim([0, 1]);

% Save the image for the GitHub documentation
exportgraphics(gcf, ...
    'black-body-spectrum.png', ...
    'Resolution', 300);
```

Upload the resulting image to:

```text
docs/assets/images/black-body-spectrum.png
```

## Python Implementation

```python
import numpy as np
import matplotlib.pyplot as plt

# Signal parameters
n = 1024
lambda_min = 0.08
lambda_scale = 0.92
shape = 2.5
amplitude = 1.0

# Sampling locations
x = np.linspace(0, 1, n)

# Transformed spectral coordinate
wavelength = lambda_min + lambda_scale * x

# Generate the signal
# np.expm1(z) evaluates exp(z)-1 accurately.
f = (
    amplitude
    * wavelength ** (-5)
    / np.expm1(shape / wavelength)
)

# Locate the sampled maximum
maximum_index = np.argmax(f)
maximum_location = x[maximum_index]
maximum_value = f[maximum_index]

# Plot the signal
plt.figure(figsize=(8, 4))

plt.plot(
    x,
    f,
    color="blue",
    linewidth=1.8,
    label="Black-body spectrum"
)

plt.scatter(
    maximum_location,
    maximum_value,
    color="red",
    s=35,
    zorder=3,
    label="Spectral maximum"
)

plt.axvline(
    maximum_location,
    color="red",
    linestyle="--",
    linewidth=1.1,
    alpha=0.7
)

plt.xlabel("x")
plt.ylabel("f(x)")
plt.title("Dimensionless Black-Body Spectrum")
plt.xlim(0, 1)
plt.grid(True, alpha=0.3)
plt.legend()
plt.tight_layout()

# Save the image for the GitHub documentation
plt.savefig(
    "black-body-spectrum.png",
    dpi=300,
    bbox_inches="tight"
)

plt.show()
```

## Recommended Uses

The Black-Body Spectrum signal can be used to evaluate whether a method can:

- preserve a smooth and asymmetric spectral peak;
- accurately recover the location and height of the maximum;
- preserve rapidly changing curvature;
- distinguish a steep continuous increase from a discontinuity;
- preserve a slowly decreasing tail;
- avoid artificial oscillations near the maximum;
- avoid flattening or shifting the spectral peak; and
- denoise a signal containing substantially different rates of change.

It is particularly useful for studying denoising, peak estimation, spectral
reconstruction, curvature preservation, and adaptive smoothing.

## Provenance

**Status:** Dimensionless Planck-type benchmark signal.

The signal is motivated by the characteristic shape of the black-body
radiation spectrum. The constants have been rescaled to produce a dimensionless
signal on the normalized domain $0\leq x\leq1$.

The signal is intended as a deterministic test morphology rather than a
physically calibrated representation of spectral radiance.

---

[Return to Signal Catalog](index.md)
