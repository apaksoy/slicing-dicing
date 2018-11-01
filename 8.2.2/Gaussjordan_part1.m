function [ A_out, b_out ] = Gaussjordan_part1( A, b )
% First step in solving a set of linear equations Ax = b for x.

% Transforms A into a diagonal matrix using the Gauss - Jordan method
% and returns it in A_out.

% b is transformed along with A with the same Gauss - Jordan
% transforms and returned in b_out.

% Gaussjordan_part2() can be used as the 2nd step.

  [ ATL, ATR, ...
    ABL, ABR ] = FLA_Part_2x2( A, ...
                               0, 0, 'FLA_TL' );

  [ bT, ...
    bB ] = FLA_Part_2x1( b, ...
                         0, 'FLA_TOP' );

  while ( size( ATL, 1 ) < size( A, 1 ) )

    [ A00,  a01,     A02,  ...
      a10t, alpha11, a12t, ...
      A20,  a21,     A22 ] = FLA_Repart_2x2_to_3x3( ATL, ATR, ...
                                                    ABL, ABR, ...
                                                    1, 1, 'FLA_BR' );

    [ b0, ...
      beta1, ...
      b2 ] = FLA_Repart_2x1_to_3x1( bT, ...
                                    bB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%

    a01 = laff_invscal(alpha11, a01);
    a21 = laff_invscal(alpha11, a21);
    A02 = laff_ger(-1, a01, a12t, A02);
    A22 = laff_ger(-1, a21, a12t, A22);
    b0 = laff_axpy(-beta1, a01, b0);
    b2 = laff_axpy(-beta1, a21, b2);
    a01 = laff_zerov(a01);
    a21 = laff_zerov(a21);

    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

    [ bT, ...
      bB ] = FLA_Cont_with_3x1_to_2x1( b0, ...
                                       beta1, ...
                                       b2, ...
                                       'FLA_TOP' );

  end

  A_out = [ ATL, ATR
            ABL, ABR ];

  b_out = [ bT
            bB ];

return

end
