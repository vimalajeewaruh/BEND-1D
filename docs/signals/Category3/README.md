# BEND-1D Category 3

This folder contains the GitHub Pages documentation for signals **TF027–TF042**.

## Repository placement

Upload this folder to:

```text
docs/signals/Category3/
```

Upload the corresponding PNG files to:

```text
docs/assets/images/
```

Each page therefore uses an image path of the form:

```markdown
![Signal name](../../assets/images/TF027_NasonPleth.png)
```

Add this link to `docs/signals/index.md`:

```markdown
[Browse Category 3 Signals](Category3/)
```

The expected image filenames are listed in `index.md`.

## Reproducibility notes

- `TF027_NasonPleth` uses `ipd.csv` when it is available and otherwise uses the documented deterministic fallback.
- `TF041_SonarMultipath` depends on a MATLAB helper named `chirp_packet`. The supplied source did not include that helper, so its page identifies this dependency explicitly.

