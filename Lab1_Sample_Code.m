% ELEC4506
% Student Name: Peter Al Ahmar  
% Student num.: 100961570
% Lab1-Q1
%
% Note/Comments:  "your note goes here!"
%--------------------------------------------------------------------------
clc; close all;  clear all;  %initialization of the matlab environment

%--------------------------------------------------------------------------
% List of the components (netlist):
%--------------------------------------------------------------------------
R1 = 5;  %Ohms
R2 = 5;  %Ohms
R3 = 5;  %Ohms
R4 = 5;  %Ohms
R5 = 1e3;  %Ohms
C1 = 0.319e-6;  %Farads
C2 = 63.72e-12;  %Farads
C3 = 0.319e-6;  %Farads

L1 = 0.799e-9;  %Henry 

J = 1;  %Amper (Phasor of the AC Src at the input)

fmin = 0;  %Hz
fmax = 20e6 ;  %Hz
Nrpt = 1000;  %Number of frequency points

OutputNode = 4;   


%-------------------------------------------------------------------------- 
g1 = 1/R1;
g2 = 1/R2;
g3 = 1/R3;
g4 = 1/R4;
g5 = 1/R5;

b = [J;0;0;0;0];  %You should enter entries of the source column vector b!

%-------------------------------------------------------------------------- 
%FD simulation:
%-------------------------------------------------------------------------- 
F = linspace(fmin, fmax, Nrpt);

for n=1:Nrpt
    w = 2*pi* F(n);
    s = 1i*w;
    
    A = [g1+g2+s*C1         -g2 0 0 1;
        -g2         +g2+s*C2 -s*C2 0 0;
        0 -s*C2 s*C2+g3+g4+s*C3 -g4 0;
        0 0 -g4 g4+g5 0;
        1 0 0 0 -s*L1];
    % The matrix A=(G+s*C) that you have formed in Q1 of the PRELAB goes here!  
    X = A\b;
    Vout(n) = X(OutputNode);  % Here, you are collecting the response ...
                              % at the output node for different frequency ... 
                              % in an array named (Vout)!
end

%Part A
figure('Name','Freq-Response');  
plot(F, abs(Vout),'LineWidth',3);
grid;
title('Frequency Response', 'FontSize',14);
xlabel('Frequency (Hz)','FontSize',20);
ylabel('|V_{out}|  (Volts)','FontSize',20);

%Part C Steady State
 w = 2*pi*10e6;
    s = 1i*w;
    
    A = [g1+g2+s*C1 -g2 0 0 1;
        -g2 +g2-s*C2 s*C2 0 0;
        0 s*C2 -s*C2+g3+g4 -g4 0;
        0 0 -g4 g4+g5 0;
        1 0 0 0 -s*L1];
    X = A\b;
    VoutPartC = X(4);
    
    
    time= linspace(0, 3/10e6, 1000);
   
%-------------------------------------------------------------------------- 
% To plot the magnitude of the output voltage:
%-------------------------------------------------------------------------- 

%Part C
figure('Name','Steady State');
plot(time, abs(VoutPartC)* cos(2*pi*10e6*time+angle(VoutPartC)),'LineWidth',3);
grid;
title('Steady State', 'FontSize',14);
xlabel('Time(s)','FontSize',20);
ylabel('|V_{out}| (Volts)','FontSize',20);

%Plot for part Part D
figure('Name','Current');  
plot(time, cos(2*pi*10e6*time),'LineWidth',3);
grid;
title('Current (A)', 'FontSize',14);
xlabel('time(s)','FontSize',20);
ylabel('Current (A)','FontSize',20);

%-------------------------------------------------------------------------- 
% This is to save the response figure automatically or you can save the ...
% figure manually!
%-------------------------------------------------------------------------- 
FN = 'Lab1-Q1';   
print(gcf, '-dpng', '-r600', FN);   

%end  %End of this file
