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

[A1, B1] = Gaussjordan_mrhs_part1(A, B)
[A2, B2] = Gaussjordan_mrhs_part2(A1, B1)
% round() is used to prevent false warnings from the approximation errors by the computer
round(A * B2 - B, 4)

if ( isequal( round(A * B2,4), B ) )
    disp( 'Gaussjordan_mrhs_part1 and Gaussjordan_mrhs_part2 appear to be correct' )
else
    disp( 'Either Gaussjordan_mrhs_part1 or Gaussjordan_mrhs_part2 has a problem' )
end
