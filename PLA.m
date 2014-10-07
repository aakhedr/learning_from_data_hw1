function [pred, iters] = PLA(x, y)

    %% Perceptron Learning Algorithm (PLA) %%
    % ======================================== %

    % initialize weights and add bias term to x
    x = [ones(size(x, 1), 1) x];	w = zeros(size(x, 2), size(y, 2)); 

    % calculate y predictions according to w
    pred = sign(x * w);

    % identify misclassifications
    [row] = find(pred ~= y);

    if size(x, 1) == 10
        maxIters = 10000;
    elseif size(x, 1) == 100
        maxIters = 5000;
    end

    iters = 0; 					% keep track of num iters
    while iters < maxIters
        iters = iters + 1; 
        index = ceil(rand * length(row)); 
        if index == 0
            break
        end
        w = w + x(index, :)' * y(index);		% update weights
        pred = sign(x * w);
        [row] = find(pred ~= y);
    end
    % fprintf('Num iterations: %d\n', iters);
    % fprintf('Misclassifications: %d\n', numel(find(pred ~= y)));
end
