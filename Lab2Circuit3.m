% Lab2Circuit3.m: 
% Description of Circuit 3 (Figure 4)
%
% ELEC4506, Lab-2
% Author:
% Date:
%--------------------------------------------------------------------------
clc; close all;  clear all;  %initialization of the matlab environment

global G C b;

G = zeros(7,7); 
C = zeros(7,7); 
b = zeros(7,1); 

fmin = 0;  %Hz

fmax = 10e3 ;  %Hz

Nrpt = 1000;  %Number of frequency points

F = linspace(fmin, fmax, Nrpt);

vol(1,0,1);
res(1,2,1000);
cap(2,3,159.2e-9);
res(3,4,1000);
res(4,5,1000);
cap(6,0,159.2e-9);
res(5,6,1000);
res(6,0,1000);
vcvs(5,0,2,4,1e8);
vcvs(3,0,6,4,1e8);
vcvs(7,0,6,7,1e8);

for n=1:Nrpt
    w = 2*pi*F(n);
    s = 1i*w;
    A = (G +s*C);
    X = A\b;
    Vout(n) = X(7);                        
end

figure('Name','Freq-Response');  
plot(F, abs(Vout),'LineWidth',3);
grid;
title('Frequency Response', 'FontSize',14);
xlabel('Frequency (Hz)','FontSize',20);
ylabel('|V_{out}|  (Volts)','FontSize',20);

figure('Name','Freq-Response');  
semilogx(F, 20*log(abs(Vout)),'LineWidth',3);
grid;
title('Frequency Response', 'FontSize',14);
xlabel('Frequency (Hz)','FontSize',20);
ylabel('|V_{out}|  (Volts)','FontSize',20);

