
%%%%%%%%%%%%%%%%%%%%%%%
%% Mandelbrot Fractal 
%%%%%%%%%%%%%%%%%%%%%%%

% function fractal(), returns the number of iterations till divergence % c: complex value
% Considering a point that does not diverge in 100 iterations is in the set
function it = fractal(c) 
    z = 0; % initial z-value
    n = 0; % counter of number of iterations

    while abs(z)<=2 && n<100
        n = n+1;
        z = z^2 + c;        
    end
    it = n;
end


%%%%%%%%%%%%%%%%%%%%%%%
%% Bisection Method
%%%%%%%%%%%%%%%%%%%%%%%

% function fn(), returns a function that determines whether the point diverges or not along a vertical line at a given x
function fn = indicator_fn_at_x(x)
    fn = @(y) (fractal(x + 1i*y) < 100)*2 - 1; % setting 1 for divergence and -1 for no divergence
end



% function bisection(), returns a point where the point sign of f changes
% approximate the boundary of the fractal
function m = bisection(fn_f, s_y, e_y)

    y = linspace(s_y,e_y,10^3); % vertical vector of 100 points from s to e
    s_idx = 1; % lower bound point index, y
    e_idx = length(y); % upper bound point index, y
    while s_idx + 1 < e_idx
        m_idx = floor((s_idx+e_idx)/2); % get an integer mid value
        if fn_f(y(m_idx)) == 1
            e_idx = m_idx;
        else
            s_idx = m_idx;
        end        
    end
    m = (y(s_idx)+y(e_idx))/2;
end

s_x = -2; e_x = 1; 
s_y = 0; e_y =1.2; % need to change; arbitrary assigned value 
% The Mandelbrot set is symmetric about the real axis (the x-axis). When searching for the upper boundary, you only need to search on one side (e.g., y≥0).
x = linspace(s_x,e_x,10^3); % horizontal vector of 10^3 points for [-2,1]
y = zeros(1,length(x));

for i=1:length(x)
    fn_f = indicator_fn_at_x(x(i));
    m = bisection(fn_f,s_y,e_y);  
    fprintf('(%f,%f)\n',x(i),m); % print the boundary point
    y(i) = m; % put boundary imagine value into y vector
end


%%%%%%%%%%%%%%%%%%%%%%%
%% Polynomial function fitting
%%%%%%%%%%%%%%%%%%%%%%%


% Note: x, y are the data points represeting the fractal boundary

% Discard the left and right points of the fractal
% hand tuning
indices = find(y>0.001);
% Remove the indices corresponding to the discarded points
x_filtered = x(indices);
y_filtered = y(indices);


scatter_y = y_filtered; % original data point of y before putting into the polynomial
order = 15; % set the order of polynomial to 15
p = polyfit(x_filtered,y_filtered,order); % p: set of coefficients; 
y_filtered = polyval(p,x_filtered); % evalueate the polynomial using new x value

figure(1); clf;
hold on; 
plot(x_filtered, y_filtered, 'r-', 'LineWidth', 2); % Plot the polynomial fit
scatter(x_filtered, scatter_y, 10, 'filled')
xlabel('Real Part'); 
ylabel('Imaginary Part'); 
legend('Polynomial Fitting','Boundary Point')
title('Mandelbrot Fractal Boundary'); 
grid on; 




%%%%%%%%%%%%%%%%%%%%%%%
%% Boundary Length
%%%%%%%%%%%%%%%%%%%%%%%

% function poly_len(), returns the curve length of the polynomial l
% find boundary as a function
function l = poly_len(p, s_x, e_x)
    p_prime = polyder(p); % derivative of the polynomial; coefficients of df/dx

    ds = @(x) sqrt(1 + (polyval(p_prime,x)).^2); 

    l = integral(ds,s_x,e_x); % return integration value
end


% Adjust the range of x to consider the filtered part
s_integrate = min(x_filtered); 
e_integrate = max(x_filtered);

l = poly_len(p, s_integrate, e_integrate);

% since fractal is symmetry to that x-axis, to get the total boundary length we mulitpy 2 to the l
final_length = l*2;  








