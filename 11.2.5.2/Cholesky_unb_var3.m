function [ A_out ] = Cholesky_unb_var3( A )
% Factors A into its Cholesky form, i.e. A = L(LT).
% Only lower part of A is overwrittent with L, the lower triangular 
% Cholesky matrix.
% See the video in section 8.4.2 "Solving Ax=b ..." for its development 
% and 10.5.1, "Solving the Normal Equations", for its usage.
% The code in this file is same as the one provided in the course. 
% Only the comments are extra.


  [ ATL, ATR, ...
    ABL, ABR ] = FLA_Part_2x2( A, ...
                               0, 0, 'FLA_TL' );

  while ( size( ATL, 1 ) < size( A, 1 ) )

    [ A00,  a01,     A02,  ...
      a10t, alpha11, a12t, ...
      A20,  a21,     A22 ] = FLA_Repart_2x2_to_3x3( ATL, ATR, ...
                                                    ABL, ABR, ...
                                                    1, 1, 'FLA_BR' );

    %------------------------------------------------------------%

    alpha11 = sqrt( alpha11 );
    a21 = laff_invscal( alpha11, a21 );
    A22 = laff_syr( 'Lower triangular', -1, a21, A22 );
    
    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

  end

  A_out = [ ATL, ATR
            ABL, ABR ];

return
