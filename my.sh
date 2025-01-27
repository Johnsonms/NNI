mkdir build && cd build
cmake .. -DCUTLASS_NVCC_ARCHS=100a -DCUTLASS_ENABLE_TESTS=OFF -DCUTLASS_UNITY_BUILD_ENABLED=ON
make cutlass_profiler -j64
./tools/profiler/cutlass_profiler --kernels="sm100*bf16"  --m=8192 --n=8192 --k=8192 --A=bf16:row --B=bf16:column --C=void --D=bf16 --dist=gaussian,mean:0.0,stddev:1.0 --raster_order=M,N --swizzle_size=1,2,4,8 --output=results.csv
