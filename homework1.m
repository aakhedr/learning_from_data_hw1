clear; close all; clc;

N = 10;
diffs = zeros(1000, 1);
num_trials = zeros(1000, 1);

for i = 1:1000
    [x, y] = buildDataSet(N);
    [pred, iters] = PLA(x, y);
    diffs(i) = size(find(pred ~= y), 1);
    num_trials(i) = iters;
end

fprintf('Average misclassiciations: %d\n', mean(diffs));
fprintf('Average iterations: %d\n', mean(num_trials));
