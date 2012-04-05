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
pend=tf(num,den)                                        % funzione di trasferimento

% Risposta Impulsiva a Ciclo Aperto %
t=0:0.01:5;         % intervallo
impulse(pend,t)     % risposta impulsiva
axis([0 1 0 60])    % settaggio degli assi