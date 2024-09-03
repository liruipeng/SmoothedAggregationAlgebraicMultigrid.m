function demo()
addpath('./Code');
addpath('./Code/MEXfunc');

% FORMING 2D Laplacian operator:
% A = delsq(numgrid('S',513));
%coo = load('laprot30_100.txt');
%coo(:, 1:2) = coo(:, 1:2) + 1;
%A = spconvert(coo);

total_niter = 0;
total_complx = 0;
%DIR = '/Users/li50/workspace/SmoothedAggregationAlgebraicMultigrid.m/Table5/xi-400';
%DIR = '/Users/li50/workspace/SmoothedAggregationAlgebraicMultigrid.m/Table6/theta-512';
DIR = '/Users/li50/Downloads/';

%DIR2 = 'theta-2pi_12-3pi_12';
%DIR2 = 'theta-3pi_12-4pi_12';
%DIR2 = 'theta-6pi_12-7pi_12';

%DIR2 = 'xi-0.005-0.01';
%DIR2 = 'xi-0.01-0.0125';
%DIR2 = 'xi-0.1-0.2';
DIR2 = 'xi100';
k = 0;
for i = 0:9
    k = k + 1;
    fn = sprintf('%s/%s/%d.mat', DIR, DIR2, i);
    mat = load(fn);
    A = mat.A;
    nnzA = nnz(A);
    b1 = rand(size(A,2),1);
    AT = A';clear A;

    [x1,setup_info,results] = SolveLinearSystem(AT,b1);
    disp(['~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~']);
    disp(['~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~']);
    disp('Relative norm of the residual:')
    norm(AT'*x1-b1)/norm(b1)

    %disp('Operator Complexity:')
    total_complx = total_complx + results{1}.NNZ / nnzA;

    total_niter = total_niter + results{1}.niter;
end

fprintf('avg iter %f\n', total_niter / k);
fprintf('op complx %f\n', total_complx / k);

rmpath('Code');
rmpath('Code/MEXfunc');
return;
