function [ B_out] = Gaussjordan_mrhs_alt_unb( A, B )
% Solves AX = B for X using Gauss - Jordan elimination method in one sweep.
% Transforms A into an identity matrix.

% B is transformed along with A with the same Gauss - Jordan
% transforms and returned in B_out as the solution X.

% Number of iterations is reduced compared with
% the two-sweep version (GaussJordan_mrhs_part1() and 
% GaussJordan_mrhs_part1()), but computation cost is increased
% as an extra operation is required.


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
    
    a12t = laff_invscal(alpha11, a12t); % extra vs Gaussjordan_mrhs()
    b1t = laff_invscal(alpha11, b1t);
    alpha11 = 1;

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

  B_out = [ BT
            BB ];

end
