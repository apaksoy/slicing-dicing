A = [
    -2     2    -1    -3
    -5    -2    -1     0
    -4     5     3    -1
     4    -5     3     2
]

B = eye(4)

[A1, B1] = GJ_Inverse_part1(A, B)
[A2, B2] = GJ_Inverse_part2(A1, B1)

% This should give B
A * B2

% round() is used to prevent false warnings from the approximation errors by the computer
if ( isequal( round(A * B2,4), B ) )
    disp( 'GJ_Inverse_part1 and GJ_Inverse_part2 appear to be correct' )
else
    disp( 'Either GJ_Inverse_part1 or GJ_Inverse_part2 has a problem' )
end
