# TF014 — MATLAB Implementation

~~~matlab
function f = ECGBeatSignal(x,rLocations,beatScales)
% rLocations and beatScales must each contain two values.

offsets = [-0.15 -0.025 0 0.025 0.16];
amplitudes = [0.15 -0.12 1 -0.25 0.32];
widths = [0.035 0.010 0.008 0.012 0.060];
f = zeros(size(x));

for j = 1:2
    for ell = 1:5
        mu = rLocations(j)+offsets(ell);
        f = f + beatScales(j)*amplitudes(ell)* ...
            exp(-(x-mu).^2/(2*widths(ell)^2));
    end
end
end
~~~
