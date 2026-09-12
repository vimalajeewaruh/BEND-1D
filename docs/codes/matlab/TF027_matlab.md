~~~matlab
N = 1024;
x = linspace(0,1,N);
scriptFolder = pwd;
ipdFile = fullfile(scriptFolder,'ipd.csv');
usedExactNasonIPD = false;

if exist(ipdFile,'file') == 2
    z = readmatrix(ipdFile);
    z = z(:,end);
    z = z(isfinite(z));
    if numel(z) >= 16
        xx = linspace(0,1,numel(z));
        f = interp1(xx,z(:).',x,'pchip');
        usedExactNasonIPD = true;
    end
end

if ~usedExactNasonIPD
    phaseResp = 2*pi*(10.5*x + 0.20*sin(2*pi*0.75*x));
    normalResp = (0.92 + 0.10*sin(2*pi*0.55*x)).* ...
        (sin(phaseResp) + 0.18*sin(2*phaseResp-0.45));
    wDist = exp(-0.5*((x-0.51)/0.105).^2);
    disturb = 0.48*wDist.*sin(2*pi*(4.1*x+1.6*x.^2)+0.6) ...
        + 0.25*wDist.*sin(2*pi*31*x) ...
        + 0.14*wDist.*sin(2*pi*53*x+0.8);
    f = (1-0.88*wDist).*normalResp + disturb;
end

plot(x,f,'LineWidth',1.4); grid on
xlabel('x'); ylabel('f(x)'); title('TF027 — NasonPleth')
exportgraphics(gcf,'TF027_NasonPleth.png','Resolution',300);
~~~
