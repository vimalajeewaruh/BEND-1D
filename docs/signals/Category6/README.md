# BEND-1D Category 6

This folder contains GitHub Pages documentation for modern cross-disciplinary signals **TF071–TF100**.

Upload this folder to:

```text
docs/signals/Category6/
```

Upload the PNG files to:

```text
docs/assets/images/
```

Each page uses an image path such as:

```markdown
![PowerGridFault signal](../../assets/images/TF071_PowerGridFault.png)
```

Add this link to `docs/signals/index.md`:

```markdown
[Browse Category 6 Signals](Category6/)
```

The MATLAB source uses the common helper

```matlab
sigmoid = @(z,c,w) 1./(1+exp(-(z-c)/w));
```

Each relevant page defines this helper explicitly so its example is standalone.

