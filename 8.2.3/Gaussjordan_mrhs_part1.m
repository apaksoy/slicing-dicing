function [ A_out, B_out ] = Gaussjordan_mrhs_part1( A, B )
% First step in solving sets of linear equations AX = B for X.

% Transforms A into a diagonal matrix using the Gauss - Jordan method
% and returns it in A_out.

% B is transformed along with A with the same Gauss - Jordan
% transforms and returned in B_out.

% Gaussjordan_mrhs_part2() can be used for the 2nd step.

  [ ATL, ATR, ...
    ABL, ABR ] = FLA_Part_2x2( A, ...
                               0, 0, 'FLA_TL' );

  [ BT, ...
    BB ] = FLA_Part_2x1( B, ...
                         0, 'FLA_TOP' );

  while ( size( ATL, 1 ) < size( A, 1 ) )

    [ A00,  a01,     A02,  ...
      a10t, alpha11, a12t, ...
      A20,  a21,     A22 ] = FLA_Repart_2x2_to_3x3( ATL, ATR, ...
                                                    ABL, ABR, ...
                                                    1, 1, 'FLA_BR' );

    [ B0, ...
      b1t, ...
      B2 ] = FLA_Repart_2x1_to_3x1( BT, ...
                                    BB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%

    a01 = laff_invscal(alpha11, a01);
    a21 = laff_invscal(alpha11, a21);
    A02 = laff_ger(-1, a01, a12t, A02);
    A22 = laff_ger(-1, a21, a12t, A22);
    B0 = laff_ger(-1, a01, b1t, B0);
    B2 = laff_ger(-1, a21, b1t, B2);
    a01 = laff_zerov(a01);
    a21 = laff_zerov(a21);

    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

    [ BT, ...
      BB ] = FLA_Cont_with_3x1_to_2x1( B0, ...
                                       b1t, ...
                                       B2, ...
                                       'FLA_TOP' );

  end

  A_out = [ ATL, ATR
            ABL, ABR ];

  B_out = [ BT
            BB ];

end
