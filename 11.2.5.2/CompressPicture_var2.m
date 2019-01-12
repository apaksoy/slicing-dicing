% Compresses given picture via rank-k approximation 
% in which Cholesky factorization is used in applying 
% the inverse of A' * A

% Close all figures
close all

% Read the picture in building.png into matrix B
[ B, map ] = imread( 'building.png' );

% Show the picture in a figure
imshow( B );

% Choose the (approximate) number of columns you want to use for the 
% aproximation.
k = 10;

% Extract the number of rows and columns in B
[ m, n ] = size( B );
    
% B starts as an integer array.  To do the computations, we need to
% make it into floating point numbers.
    
B = double( B );
    
% Pick A as the matrix consisting of about k equally spaced columns of 
% B. 
stride = round( n / k );
A = B( :, 1:stride:n ); 
    
% Replace the comments below with their respective operations from the notebook
    
% C = A^T A
C= A' * A;
    
% V = A^T B
V = A' * B;

% Overwrite lower triangular part of C with its Cholesky factorization
C = Cholesky_unb_var3(C);

% Extract the unit lower triangular matrix L.
L = tril( C );

% Solve L(L^TX) = V, overwriting V with X
V = L \ V;
V = L' \ V;
    
% Create a new figure in which you show the approximated picture.  Notice
% that A and V are matrices of doubles, which much be converted to unsigned
% 8 byte integers for imshow to work.
figure
imshow( uint8( A * V ) );

% The two figures may be on top of each other.  You may have to move the
% second one next to the first one.
    
% Play around by changing the number of columns you use for the
% approximation!
