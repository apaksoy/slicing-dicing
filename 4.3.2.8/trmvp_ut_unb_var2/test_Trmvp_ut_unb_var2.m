A = randi( [ -2, 2 ], 4, 4 )
x = randi( [ -2, 2 ], 4, 1 )
y = randi( [ -2, 2 ], 4, 1 )

if ( isequal( Trmvp_ut_unb_var2( A, x, y ), triu( A )' * x + y ) )
    disp( 'Trmvp_ut_unb_var2 appears to be correct' )
else
    disp( 'Trmvp_ut_unb_var2 has a problem' )
end
