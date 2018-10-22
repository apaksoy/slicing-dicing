A = [
    -2     2    -1    -3
    -5    -2    -1     0
    -4     5     3    -1
     4    -5     3     2
]

b = [
     2
     3
    -2
     2
]

[A1, b1] = Gaussjordan_part1(A, b);
[A2, b2] = Gaussjordan_part2(A1, b1);

% This should give b
A * b2

% round() is used to prevent false warnings from the approximation errors by the computer
if ( isequal( round(A * b2,4), b ) )
    disp( 'Gaussjordan_part1 and Gaussjordan_part2 appear to be correct' )
else
    disp( 'Either Gaussjordan_part1 or Gaussjordan_part2 has a problem' )
end
