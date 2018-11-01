This is a self-created exercise related with the section 8.2.5 of the course.

Although the total number of operations is the same, the one-sweep version of matrix inversion via Gauss - Jordan elimination appears to be more efficient than the two-sweep version given the fewer number of iterations. 

I wondered if this would also be the case for the general Gauss - Jordan elimination with multiple right-hand sides (MRHS). So I created the one-sweep version of the Gauss - Jordan elimination with MRHS.

Based on the algorithm I found out, it appears that the one-sweep version of the Gauss Jordan elimination with MRHS is not more efficient than the two-sweep original (Gaussjordan_mrhs_part1 and Gaussjordan_mrhs_part2). It might be more practical to have it all in one algorithm or routine and it goes through fewer iterations obviously but the one-sweep algorithm requires an extra operation compared with the two-sweep one.
