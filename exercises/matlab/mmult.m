function C = mmult_timed(A,B)
tic
C = A*B;
toc
disp("Resulting matrix size: "+string(mat2str(size(C))))
end
