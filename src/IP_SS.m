% Modellizazzione pendolo inverso - Spazio di Stato %
M = 0.5;    % massa del carrello
m = 0.2;    % massa del pendolo
b = 0.1;    % attrito del carrello
i = 0.006;  % inerzia del pendolo
g = 9.8;    % accelerazione g
l = 0.3;    % lunghezza dal centro di massa del pendolo

p = i*(M+m)+M*m*l^2; 	% denominatore per le matrici A e B

A = [0      1              0           0;
     0 -(i+m*l^2)*b/p  (m^2*g*l^2)/p   0;
     0      0              0           1;
     0 -(m*l*b)/p       m*g*l*(M+m)/p  0]

B = [     0; 
     (i+m*l^2)/p;
          0;
        m*l/p]

C = [1 0 0 0;
     0 0 1 0]

D = [0;
     0]

% Pendolo inverso in Spazio di Sato %
pend=ss(A,B,C,D);

% Risposta a Gradino a Ciclo Aperto %
T=0:0.05:10;
U=1*ones(size(T));
[Y,T,X]=lsim(pend,U,T);	% risposta dinamica del sistema
plot(T,Y)
axis([0 2 0 100])

% LEGENDA GRAFICO %
% LINEA BLU -> posizione del carrello
% LINEA VERDE -> angolo del pendolo