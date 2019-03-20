function vccs(nd1,nd2,ni1,ni2,val)
% vccs.m        
% ELEC4506, Lab-2
% Author:
% Date:
%--------------------------------------------------------------------------
% define global variables
global G;

if (nd1 ~= 0) && (ni1 ~=0)
    G(xr,ni2) = G(xr,ni2) + val;
end
    
if (nd2 ~= 0) && (ni2 ~=0)
    G(xr,ni1) = G(xr,ni1) -val;
end
if (nd1 ~= 0) && (ni2 ~=0)
    G(nd1,xr) = G(nd1,xr) + val;
    
end
if (nd2 ~= 0) && (ni1 ~=0)
    G(nd2,xr) = G(nd2,xr)-val;
    
end

end
%END
