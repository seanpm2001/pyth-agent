// SortedArray consumes a list of signals and outputs 1 if the list is sorted.

pragma circom 2.0.0;

// By checking an existing sort is correct instead of sorting an unsorted input
// list of signals, we save on intermediate signals and move the work to the
// prover instead.
//
//     a[N] -- List of signals to be checked for sort.
//     b    -- Intermediate list of signals, all are 1 if the input is sorted.

template SortedArray(N) {
    signal input a[N];
    signal       b[N];
    var counter = 0;
    for(var i=1; i<N; i++) {
        b[i] <-- a[i-1] <= a[i];
        b[i] === 1;
    }
}
