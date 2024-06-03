#!/bin/bash

echo "NO AVX"
start_time="$(date -u +%N)"
./multiply_matrix4x4_avx.out
end_time="$(date -u +%N)"
nanotime="$(bc <<<"$end_time-$start_time")"

echo
echo "$nanotime"

echo
echo

echo "AVX"
start_time="$(date -u +%N)"
./multiply_matrix4x4_avx.out
end_time="$(date -u +%N)"
nanotime="$(bc <<<"$end_time-$start_time")"

echo
echo "$nanotime"
