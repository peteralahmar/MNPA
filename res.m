function res(n1,n2,val)
% cap.m:
% Adds stamp for capacitor to the global C-Matrix in circuit representation!
% 
% cap(n1,n2,val):
%                     G=val (Ohm)
%               n1 o---/\/\/\/---o n2   
%
% ELEC4506, Lab-2
% Author: Peter Al Ahmar
% Date: 10-3-2018
%--------------------------------------------------------------------------
% define global variables
global G;

val = 1/val;
if (n1 ~= 0)
    G(n1,n1) = G(n1,n1) + val;
end

if (n2 ~= 0)
    G(n2,n2) = G(n2,n2) + val;
end

if (n1 ~= 0) && (n2 ~= 0)
    G(n1,n2) = G(n1,n2) - val;
    G(n2,n1) = G(n2,n1) - val;
end
%END
