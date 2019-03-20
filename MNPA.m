clc; close all;  clear all;  %initialization of the matlab environment

global C G b;


Vin_M = zeros(1, 20);
VO_M = zeros(1, 20);
V3_M = zeros(1, 20);


g1 = 1;
g2 = 2;
C1 = 0.25;
L1 = 0.2;
g3 = 10;
alpha = 100;
g4 = 0.1;
g5 = 1000;

C = zeros(7,7);
G = zeros(7,7);
b = zeros(7,1);

vol(1,0,1);
res(1,2,g1);
cap(1,2,C1);
res(2,0,g2);
ind(2,3,L1);
res(3,0,g3);
vcvs(4,0,3,0,alpha);
res(4,5,g4);
res(5,0,g5);

%Part B - DC sweep

vin = -10;

for i = 1:20
    Vin_M(i) = vin;
    b(1) = Vin_M(i);
    
    Vm = G\b';
    
    VO_M(i) = Vm(7);
    V3_M(i) = Vm(4);
    vin = vin + 1;
end

plot(Vin_M, VO_M);
title('DC sweep of the Input against the Output');
% x = [10;9.5607;0.7749;10;-8.7858e-3;-8.7858e-3];

