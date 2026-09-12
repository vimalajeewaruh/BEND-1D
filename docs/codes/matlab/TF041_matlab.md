# TF041 — MATLAB Implementation

~~~matlab
% Requires the project's authoritative chirp_packet.m helper.
N = 1024; x = linspace(0,1,N);
f = chirp_packet(x,0.22,0.030,28,145,1.00) ...
  + chirp_packet(x,0.405,0.036,28,120,0.48) ...
  + chirp_packet(x,0.545,0.043,26,105,0.28);
u = x-0.56; ind = u>=0; rev = zeros(size(x));
rev(ind) = 0.18*exp(-5.5*u(ind)).*(sin(2*pi*18*u(ind)) ...
    + 0.35*sin(2*pi*43*u(ind)+0.5));
f = f+rev;
plot(x,f,'LineWidth',1.1); grid on
xlabel('x'); ylabel('f(x)'); title('TF041 — SonarMultipath')
exportgraphics(gcf,'TF041_SonarMultipath.png','Resolution',300);
~~~
