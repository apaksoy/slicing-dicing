A = [
    -2     2    -1    -3
    -5    -2    -1     0
    -4     5     3    -1
     4    -5     3     2
]

B = [
     2 -1
     3 4
    -2 0
     2 2
]

X = Gaussjordan_mrhs_alt_unb(A, B);

% This should give B
A * X

% round() is used to prevent false warnings from the approximation errors by the computer
if ( isequal( round(A * X,4), B ) )
    disp( 'Gaussjordan_mrhs_alt_unb appears to be correct' )
else
    disp( 'Either Gaussjordan_mrhs_alt_unb appears to have a problem' )
end
