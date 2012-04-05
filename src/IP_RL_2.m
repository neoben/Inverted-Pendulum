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

% Aggiunta di Poli e Zeri per stabilizzare il sistema %
z1 = 3;
p1 = 0; % polo da inserire per compensare lo zero nell'origine
z2 = 4;
p2 = 50;

% Costruzione del Controllore con Poli e Zeri aggiunti %
numlag = [1 z1];
denlag = [1 p1];
numlead = [1 z2];
denlead = [1 p2];
numc = conv(numlead, numlag);	% numeratore contorollore
denc = conv(denlead, denlag); 	% denominatore contorollore
contr=tf(numc,denc);

% LEGENDA %
% conv -> convoluzione

% Luogo delle Radici (ZOOM NELL'ORIGINE) %
figure
rlocus(contr*pend)
axis([-10 10 -10 10])

% Funzione di Trasferimento a Ciclo Chiuso con Poli e Zeri aggiunti %
[k,poles]=rlocfind(contr*pend) % puntatore ad un punto del luogo delle radici
sys_cl=feedback(pend,k*contr);

% Risposta Impulsiva %
figure
impulse(sys_cl)
axis([0 10 -0.5 0.5]) 