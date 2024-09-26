% 1. Run the following function with iter=1000000 & record the time
% 2. Parallelize the loop, start a parpool, rerun the code as a
%    batch job, and compare the time taken with the serial version
function [dstats, t] = dice_stats(iter)
% All numbers N for which there exist fair "dice" with N faces 
nsides = [2:22 24:2:32 36 38 48 50 60 62 92 100 120];
% pre-allocate array for stats
dstats = zeros(numel(nsides),4);

tic
for nf = 1:numel(nsides)
    rolls = randi([1,nsides(nf)], [iter, 1], 'uint32');
    mmm = [nsides(nf) mean(double(rolls)) median(rolls) mode(rolls)];
    dstats(nf,:) = mmm;
end

% make dstats results readable
dstats = array2table(dstats, 'VariableNames',{'D','Mean','Median','Mode'});
t=toc;
