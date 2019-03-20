% Lab2Circuit2.m: 
% Description of Circuit 2 (Figure 2)
%
% ELEC4506, Lab-2
% Author:
% Date:
%--------------------------------------------------------------------------
clc; close all;  clear all;  %initialization of the matlab environment

global G C b;

G = zeros(2,2); 
C = zeros(2,2); 
b = zeros(2,1); 

fmin = 0;  %Hz

fmax = 10e3 ;  %Hz

Nrpt = 1000;  %Number of frequency points

F = linspace(fmin, fmax, Nrpt);

ind(1,2,159.2e-3);

res(2,0,1000);

cap(2,0,159.2e-9);

vol(1,0,1);

for n=1:Nrpt
    w = 2*pi*F(n);
    s = 1i*w;
    A = (G +s*C);
    X = A\b;
    Vout(n) = X(2);                        
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

