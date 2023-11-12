function u = RADECtoVEC(RA,DEC)
% DESCRIPTION: Convert right ascension and declination values to a unit
% vector
%
% INPUTS
% % RA - (Nx1) Vector of right ascention values (radians)
% % DEC - (Nx1) Vector of declination values (radians)
%
% OUTPUTS
% % u - (3xN) - matrix of unit vectors with the i-th unit vector
% % corresponding to the i-th RA-DEC pair
        
        % Project angle values onto the unit sphere
        u = [cos(DEC).*cos(RA); cos(DEC).*sin(RA); sin(DEC)];
end
