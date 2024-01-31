

disp('Compiling Relaxation mex files:');

mex -largeArrayDims multiColorSetup.c 

mex -largeArrayDims MulticolorGaussSeidelSMatTranspose.c CFLAGS='$CFLAGS -fopenmp' LDFLAGS='$LDFLAGS -fopenmp'

mex -largeArrayDims JacobiSMatTranspose.c CFLAGS='$CFLAGS -fopenmp' LDFLAGS='$LDFLAGS -fopenmp'

mex -O -largeArrayDims GaussSeidelSMatTranspose.c

disp('Compiling Utils mex files:');

mex  -O 'CXXOPTIMFLAGS=-DNDEBUG -O3' -largeArrayDims DiagOperate.c

mex  -O 'CXXOPTIMFLAGS=-DNDEBUG -O3' -largeArrayDims GetDiagPreconditioner.c

mex  -O 'CXXOPTIMFLAGS=-DNDEBUG -O3' -largeArrayDims SetOperators.c

disp('Compiling Neighborhood Aggregation mex files:');

mex  -O 'CXXOPTIMFLAGS=-DNDEBUG -O3' -largeArrayDims NeighborhoodAgg.c

mex  -O 'CXXOPTIMFLAGS=-DNDEBUG -O3' -largeArrayDims NeighborhoodAggNew.c

mex  -O 'CXXOPTIMFLAGS=-DNDEBUG -O3' -largeArrayDims NeighborhoodAggOrdered.c

disp('Compiling Bottom-Up Aggregation mex files:');

mex  -O 'CXXOPTIMFLAGS=-DNDEBUG -O3' WeightMatrix.cpp

mex  -O 'CXXOPTIMFLAGS=-DNDEBUG -O3' BUpAgg.cpp

mex  -O 'CXXOPTIMFLAGS=-DNDEBUG -O3' ToRowStarts.c

disp('Compiling Sparsification mex files:')

mex -O 'CXXOPTIMFLAGS=-DNDEBUG -O3' -largeArrayDims SparsifyCollapsedGalerkinMex_new.c CFLAGS='$CFLAGS -fopenmp' LDFLAGS='$LDFLAGS -fopenmp'

mex  -O 'CXXOPTIMFLAGS=-DNDEBUG -O3' -largeArrayDims SparsifyCollapsingMex.c CFLAGS='$CFLAGS -fopenmp' LDFLAGS='$LDFLAGS -fopenmp'





