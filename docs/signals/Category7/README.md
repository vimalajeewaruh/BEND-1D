# BEND-1D Category 7

This folder contains GitHub Pages documentation for contemporary and artificial smoothing signals **TF101–TF125**.

Upload this folder to:

```text
docs/signals/Category7/
```

Upload the corresponding PNG files to:

```text
docs/assets/images/
```

Each signal page uses an image path such as:

```markdown
![QuantumRamseyDrift signal](../../assets/images/TF101_QuantumRamseyDrift.png)
```

Add this link to `docs/signals/index.md`:

```markdown
[Browse Category 7 Signals](Category7/)
```

The MATLAB source uses the logistic helper

```matlab
S = @(z,c,w) 1./(1+exp(-(z-c)/w));
```

Each page that requires this helper defines it explicitly, making every implementation standalone.
