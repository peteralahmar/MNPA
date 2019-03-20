% Lab2Circuit1.m: 
% Description of Circuit 1 (Figure 1)
%
% ELEC4506, Lab-2
% Author:
% Date:
%--------------------------------------------------------------------------
clc; close all;  clear all;  %initialization of the matlab environment

global G C b; %define global variables

G = zeros(4,4); % Define G, 4 node circuit (do not include additional variables)
C = zeros(4,4); % Define C, 4 node circuit (do not include additional variables)
b = zeros(4,1); % Define b, 4 node circuit (do not include additional variables)

%--------------------------------------------------------------------------
% List of the components (netlist):
%--------------------------------------------------------------------------
cur(0,1,1e-3); % add current source between nodes 0 and 1 (1 mA)
res(1,0,1200); % add 1200 ohm resistor between nodes 1 and 0
cap(1,0,10e-9);
ind(1,2,2e-9);
res(1,2,1010);
cap(2,0,20e-9);
ind(2,3,3e-9);
res(2,3,1140);
cap(3,0,20e-9);
ind(3,4,3e-9);
cap(3,4,10e-9);
res(3,4,1450);
cap(4,0,10e-9);
res(4,0,1540);
%END
