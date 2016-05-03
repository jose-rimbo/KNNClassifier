function [r]= KDE(x, xV)
    h = 1.06*std(xV)*(length(xV).^(-1/5));
    h = h/2;
    r = 0;
    for i=1:length(xV)
        r = r + (1/h)*K(x, xV(i), h);
    end
    r = r*(1/length(xV));
end
function [r] = K(x, xi, h)
    r = 1/sqrt(2*pi);
    r = r*exp(-(((x-xi)/h).^2 )/2 );
    
end
