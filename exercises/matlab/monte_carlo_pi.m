function y=monte_carlo_pi(n)

% Computes an approximation of pi by simulating the act
% of throwing darts at a board with radius 1 meter. The
% the darts will hit a square which is 1 meter by 1 meter.

count=0;
for i=1:n
    x=rand(); y=rand();
    if ((x^2+y^2)<1)
        count=count+1;
    end
end;
y=4*count/n;
