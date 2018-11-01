function [ A_out, B_out ] = GJ_Inverse_part2( A, B )
% 2nd step in finding the inverse of matrix A

% Solves AX = B for X when A is a diagonal matrix.

% A is transformed to an identity matrix to get the solution
% and returned in A_out.

% B is transformed by the same diagonal matrix transforming A.
% So B is overwritten with the solution for X and returned 
% as B_out.

% Output of GJ_Inverse_part1(), for both A and B, can be used 
% as an input for this routine.

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

    
    b10t = laff_invscal(alpha11, b10t);
    beta11 = laff_invscal(alpha11, beta11);
    b12t = laff_invscal(alpha11, b12t);    
    alpha11 = 1;

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
