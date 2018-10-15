A = [4     1     4     1
     4     2     1     2
     3     4     4     3
     1     2     2     2]

Asymm = tril( A );

if ( isequal( Inv_l_unb_var1( Asymm ) * Asymm, eye(4) ) )
    disp( 'Inv_l_unb_var1 appears to be correct' )
else
    disp( 'Inv_l_unb_var1 has a problem' )
end
