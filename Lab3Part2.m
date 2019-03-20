% Lab2Circuit2.m: 
% Description of Circuit 2 (Figure 2)
%
% Lab2Circuit3.m: 
% Description of Circuit 3 (Figure 4)
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

fmin = 0;  %Hz
% ind2 = 2.66481e-6 * (0.05/100);
fmax = 50e6 ;  %Hz
fcurious=10e6;

Nrpt = 1000;  %Number of frequency points

F = linspace(fmin, fmax, Nrpt);

vol(1,0,1);
res(1,2,50);
ind(2,3,2.66481e-6);
cap(3,0,2.28e-10);
ind(4,3,2.66481e-6);
res(4,0,50);

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
