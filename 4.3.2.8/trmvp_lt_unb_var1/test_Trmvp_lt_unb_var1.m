A = randi( [ -2, 2 ], 4, 4 )
x = randi( [ -2, 2 ], 4, 1 )
y = randi( [ -2, 2 ], 4, 1 )

if ( isequal( Trmvp_lt_unb_var1( A, x, y ), tril( A )' * x + y ) )
    disp( 'Trmvp_lt_unb_var1 appears to be correct' )
else
    disp( 'Trmvp_lt_unb_var1 has a problem' )
end

