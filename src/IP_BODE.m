M = .5;
m = 0.2;
b = 0.1;
i = 0.006;
g = 9.8;
l = 0.3;

q = (M+m)*(i+m*l^2)-(m*l)^2;  

num = [m*l/q  0  0];
den = [1  b*(i+m*l^2)/q  -(M+m)*m*g*l/q  -b*m*g*l/q  0];
pendulum = tf(num,den)
figure(1)


numc = conv([1 1.1],[1 5])
denc = [1 0]
k    = 10


contr = k*tf(numc,denc);
loop = contr*pendulum;
set(cstprefs.tbxprefs,'FrequencyUnits','Hz')
bode(loop)

sys_cl = feedback(pendulum,contr);
figure(2)
impulse(sys_cl)

%B-3 0.0234 Hz -> 0.5 sec
T=0.5
fz=c2d(sys_cl,T,'tustin')
figure(3)
rlocus(fz)
figure(4)
impulse(fz)