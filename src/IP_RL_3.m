% Modellizazzione pendolo inverso - Funzione di Trasferimento %
M = 0.5;    % massa del carrello
m = 0.2;    % massa del pendolo
b = 0.1;    % attrito del carrello
i = 0.006;  % inerzia del pendolo
g = 9.8;    % accelerazione g
l = 0.3;    % lunghezza dal centro di massa del pendolo

q = (M+m)*(i+m*l^2)-(m*l)^2;    % input semplificato

% Funzione di Trasferimento a Ciclo Aperto %
num = [m*l/q  0];                                       % numeratore della FDT
den = [1  b*(i+m*l^2)/q  -(M+m)*m*g*l/q  -b*m*g*l/q];   % denominatore della FDT
pend=tf(num,den)    

k=945
contr=tf([1 20 100],[1 0])

% LEGENDA %
% conv -> convoluzione


sys_cl=feedback(pend,k*contr);

figure(2)
impulse(sys_cl)

%B-3 3.87 Hz -> 0.0043 sec
T=0.003
fz=c2d(sys_cl,T,'tustin')
figure(3)
rlocus(fz)
figure(4)
impulse(fz)