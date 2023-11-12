function u = STDMDL5toVEC(dt, r, CAT)
% DESCRIPTION: Using the five parameter astrometric model, load in
% % hipparcos data and transform a unit vector based on a given position and
% % epoch
%
% INPUTS
% % dt - a epoch change from 2000.25 in years
% % r - (3,1) vector describing the position of the observer relative to the
% % solar system barycenter (SSB)
% % CAT - (Nx5) containing the parameters for the 5-parameter astrometric
% % model developed in class. CAT = [right ascension, declination, proper
% % motion in RA-dir, proper motion in DEC-dir, annual parallax] loaded in
% % radians / year, radians or AU
%
% OUTPUTS
% % u - (3xN) - matrix of unit vectors corresponding to the transformed
% % positions of the stars after some time, displacement, proper motion, and
% % parallax

    % Unpack values from CAT
    ra = CAT(:,1);
    dec = CAT(:,2);
    mu_a = CAT(:,3);
    mu_d = CAT(:,4);
    plx = CAT(:,5);
    
    % Generate 2000.25 epoch unit vectors
    u0 = RADECtoVEC(ra',dec');
    % create orthoganal basis vectors to u0 tangent to the celestial sphere
    p = [-sin(ra), cos(ra), zeros(size(ra))];
    q = [-sin(dec).*cos(ra), -sin(dec).*sin(ra), cos(dec)];
    
    % 5 parameter astrometric model defined in Stars and Astrometric Models
    % lecture notes of AE8803
    u_vec = u0' + dt*(mu_a.*q + mu_d.*p) - plx*r';
    u = u_vec'./vecnorm(u_vec'); % generate unit vectors

end 