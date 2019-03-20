function cur(n1,n2,val)
% vol.m:
% Add stamp for voltage source to the global circuit representation
%            
%               Vsrc=val (Volts)
%       n1 o-----(+  -)-----o n2
%               ------->
%                 Isrc
%         
% ELEC4506, Lab-2
% Author:
% Date:
%--------------------------------------------------------------------------
% define global variables
global b;

if (n1 ~= 0)
    b(n1) = val;
end
if (n2 ~= 0)
    b(n2) = -val;
end
%End
