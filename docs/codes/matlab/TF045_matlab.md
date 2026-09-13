# TF045 — MATLAB Implementation

~~~matlab
N = 1024; x = linspace(0,1,N); lambda = 400+300*x;
baseline = 0.72+0.00035*(lambda-550);
band1 = 0.42*exp(-0.5*((lambda-525)/38).^2);
band2 = 0.16*exp(-0.5*((lambda-585)/24).^2);
shoulder = 0.08*exp(-0.5*((lambda-455)/18).^2);
f = baseline-band1-band2-shoulder;
plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('Reflectance'); title('TF045 — StampReflectance')
exportgraphics(gcf,'TF045_StampReflectance.png','Resolution',300);
~~~
