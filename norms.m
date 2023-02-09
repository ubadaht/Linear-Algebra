clear variables;
clc;
n = input('enter number:');
test=rand(n);


normss = arrayfun(@(i) matrix_norm(test, i), 0:3,'UniformOutput',false);

%test 1
if normss{1}/n <= normss{2} && normss{2}<=sqrt(n)*normss{1}
    disp(' test 1 OK: inf norm and 1-norm are equivalent')
else
    dis('test 1 failed:')
end

%test 2
if normss{4}/sqrt(n) <= normss{1} && normss{1} <= sqrt(n)*normss{4}
    disp(' test 2 OK: inf norm and 2-norm of matrices are equivalent')
else
    dis('test 2 failed:')
end
    

function norm = matrix_norm(A, flag)
switch flag
    case 0
        norm=max(sum(abs(A'))); %infinite norm
    case 1
        norm=max(sum(abs(A),1)); %the 1-norm
    case 2
        norm=sqrt(sum(sum(A .^ 2))); %Frobenius norm
    case 3
        norm=sqrt(sum(A(:).^2)); %Frobenius norm as 2-norm /Euclidean
end
end