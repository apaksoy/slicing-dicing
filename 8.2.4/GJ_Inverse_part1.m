function [ A_out, B_out ] = GJ_inverse_part1( A, B )
% First step in finding the inverse of the matrix A.

% Transforms A into a diagonal matrix where AX = B and 
% B is the identity matrix.

% B should be input as the identity matrix of the same size with A.

% A is transformed into a diagonal matrix using the Gauss - Jordan method
% and returned in A_out.

% B is transformed along with A with the same Gauss - Jordan
% transforms and returned in B_out.

% GJ_Inverse_part2() can be used as the 2nd step.

  [ ATL, ATR, ...
    ABL, ABR ] = FLA_Part_2x2( A, ...
                               0, 0, 'FLA_TL' );

  [ BTL, BTR, ...
    BBL, BBR ] = FLA_Part_2x2( B, ...
                               0, 0, 'FLA_TL' );

  while ( size( ATL, 1 ) < size( A, 1 ) )

    [ A00,  a01,     A02,  ...
      a10t, alpha11, a12t, ...
      A20,  a21,     A22 ] = FLA_Repart_2x2_to_3x3( ATL, ATR, ...
                                                    ABL, ABR, ...
                                                    1, 1, 'FLA_BR' );

    [ B00,  b01,    B02,  ...
      b10t, beta11, b12t, ...
      B20,  b21,    B22 ] = FLA_Repart_2x2_to_3x3( BTL, BTR, ...
                                                   BBL, BBR, ...
                                                   1, 1, 'FLA_BR' );

    %------------------------------------------------------------%

    
    a01 = laff_invscal(alpha11, a01);
    a21 = laff_invscal(alpha11, a21);
    A02 = laff_ger(-1, a01, a12t, A02);
    A22 = laff_ger(-1, a21, a12t, A22);
    B00 = laff_ger(-1, a01, b10t, B00);
    B20 = laff_ger(-1, a21, b10t, B20);
    b01 = laff_scal(-1, a01);
    b21 = laff_scal(-1, a21);
    a01 = laff_zerov(a01);
    a21 = laff_zerov(a21);

    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

    [ BTL, BTR, ...
      BBL, BBR ] = FLA_Cont_with_3x3_to_2x2( B00,  b01,    B02,  ...
                                             b10t, beta11, b12t, ...
                                             B20,  b21,    B22, ...
                                             'FLA_TL' );

  end

  A_out = [ ATL, ATR
            ABL, ABR ];

  B_out = [ BTL, BTR
            BBL, BBR ];

end
