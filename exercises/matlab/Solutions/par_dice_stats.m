function [dstats, t] = par_dice_stats(iter)
% All numbers N for which there exist fair dice with N faces 
nsides = [2:22 24:2:32 36 38 48 50 60 62 92 100 120];
% pre-allocate array for stats
dstats = zeros(numel(nsides),4);

tic
parfor nf = 1:numel(nsides)
    rolls = randi([1,nsides(nf)], [iter, 1], 'uint32');
    mmm = [nsides(nf) mean(double(rolls)) median(rolls) mode(rolls)];
    dstats(nf,:) = mmm;
    % parfor loop requires us to set whole row at once
    % Trying to set a slice of the row results in this Error:
    %   The parfor-loop variable 'dstats' is indexed using the loop variable,
    %   but it is not a valid sliced output variable.
end

% make dstats results readable
dstats = array2table(dstats, 'VariableNames',{'D','Mean','Median','Mode'});
t=toc;
