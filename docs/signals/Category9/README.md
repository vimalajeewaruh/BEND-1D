# BEND-1D Category 9

This folder contains GitHub Pages documentation for scientific, mechanism-inspired, and controlled diagnostic signals **TF156–TF180**.

Upload this folder to:

```text
docs/signals/Category9/
```

Upload the corresponding PNG files to:

```text
docs/assets/images/
```

Each signal page uses an image path such as:

```markdown
![RiemannShockFan signal](../../assets/images/TF156_RiemannShockFan.png)
```

Add this link to `docs/signals/index.md`:

```markdown
[Browse Category 9 Signals](Category9/)
```

The MATLAB source uses the logistic helper

```matlab
S = @(z,c,w) 1./(1+exp(-(z-c)/w));
```

Each page that requires this helper defines it explicitly. Most examples use `N = 1024`. TF176 uses `N = 4096` because its specified sample indices extend to 3203 and are designed to test dyadic-grid alignment.
