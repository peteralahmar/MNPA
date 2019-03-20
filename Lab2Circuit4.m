% Lab2Circuit4.m: 
% Description of Circuit 4 (Figure 5)
%
% ELEC4506, Lab-2
% Author:
% Date:
%--------------------------------------------------------------------------
clc; close all;  clear all;  %initialization of the matlab environment

global G C b;

G = zeros(4,4); 
C = zeros(4,4); 
b = zeros(4,1); 

fmin = 3;  %Hz

fmax = 9 ;  %Hz

Nrpt = 50000;  %Number of frequency points

F = logspace(fmin, fmax, Nrpt);

vol(1,0,1);
res(1,2,50);
ind(2,0,0.3176e-6);
cap(2,0,0.319e-6);
ind(2,3,1.59e-6);
cap(3,4,6.372e-9);
res(4,0,50);
cap(4,0,0.319e-6);
ind(4,0,0.3176e-6);

for n=1:Nrpt
    w = 2*pi*F(n);
    s = 1i*w;
    A = (G +s*C);
    X = A\b;
    Vout(n) = X(4);                        
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

