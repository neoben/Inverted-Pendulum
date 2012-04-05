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

% Controllore PID %
Kd = 20;	% componente derivativa -> INCREMENTO CONTROLLO DERIVATIVO
Kp = 100;	% componente proporzionale 
Ki = 1;		% componente integrativa
contr=tf([Kd Kp Ki],[1 0]);	% funzione di trasferimento del controllore

% Funzione di Traferimento a Ciclo Chiuso con Controllore PID %
sys_cl=feedback(pend,contr);

% Risposta Impulsiva a Ciclo Chiuso %
t=0:0.01:5;			% intervallo
impulse(sys_cl,t)		% risposta impulsiva
axis([0, 2.5, -0.2, 0.2])	% settaggio degli assi


