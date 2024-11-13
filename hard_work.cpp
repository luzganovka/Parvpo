#include <iostream>
#include <cstdlib> // Для rand() и srand()
#include <ctime>   // Для time()
#include <omp.h>    // for timing only

int findmax (int *arr, const int size){
    int max = -1;                ///< The maximal element

    // Find the maximal element
    for (int i = 0; i < size; ++i) {
        if (arr[i] > max) {
            max = arr[i];
        }
    }
    return max;
}

int main() {
    const int size = 1e6; // 10^6 array size
    const int repeats = 5000;    // number of arrays
    const int first_seed = 87359;
    const int seed_step = 1583;
    double begin=0, end=0, spent=0;
    
    // Timing
    begin = omp_get_wtime();

    for (int i = 0; i < repeats; ++i){
        int arr[size];
        int max = -1;

        // random initialisation
        int cur_seed = first_seed + seed_step * i;
        std::srand(cur_seed);

        // fill the array
        for (int i = 0; i < size; ++i) {
            arr[i] = std::rand();
        }

        max = findmax(arr, size);

        //printf("max element:\t%d\n", max);
        //std::cout << "max element: " << max << std::endl;
        //free(arr);
    }

    // Timing
    end = omp_get_wtime();
    spent = (double) (end - begin);
    std::cout << spent << std::endl;

    return 0;
}
