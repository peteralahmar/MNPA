function ind(n1,n2,val)
% cap.m:
% Adds stamp for capacitor to the global C-Matrix in circuit representation!
% 
% cap(n1,n2,val):
%                     i=val (Henry)
%               n1 o---||---o n2   
%
% ELEC4506, Lab-2
% Author:
% Date:
%--------------------------------------------------------------------------
% define global variables
global G b C;

d= size(G,1);
xr = d+1;
b(xr) = 0;

G(xr,xr) = 0;
C(xr,xr) = 0;

if (n1 ~= 0)
    G(n1,xr) = 1;
    G(xr,n1) = 1;
end

if (n2 ~= 0)
    G(n2,xr) = -1;
    G(xr,n2) = -1;  
end
C(xr,xr) = -val;
%END
