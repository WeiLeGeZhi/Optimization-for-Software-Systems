/**
 * Copyright (c) 2012 MIT License by 6.172 Staff
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 **/

#include "./util.h"
#include "./isort.h"

// Function prototypes
static void merge_f(data_t* A, int p, int q, int r, data_t* temp);

void sort_after_mem_alloc(data_t* A, int p, int r, data_t* temp){
    if (p < r) {
    // 当数组长度小于等于3时，使用插入排序
    if (r - p + 1 <= 3) {
      isort(A + p, A + r);
    } else {
      int q = (p + r) / 2;
      sort_after_mem_alloc(A, p, q, temp);
      sort_after_mem_alloc(A, q + 1, r, temp);
      merge_f(A, p, q, r, temp);
    }
  }
}

// A basic merge sort routine that sorts the subarray A[p..r]
void sort_f(data_t* A, int p, int r) {
  assert(A);
  data_t *temp = 0;
  const int mem_size = (p + r) / 2 - p + 1;
  mem_alloc(&temp, 2 * (mem_size + 1));
  if (temp == NULL)
  {
      mem_free(&temp);
      return;
  }
  sort_after_mem_alloc(A, p, r, temp);
  mem_free(&temp);
}

// A merge routine. Merges the subarrays A[p..q] and A[q + 1..r].
// Uses pointers instead of arrays.
static void merge_f(data_t* A, int p, int q, int r, data_t* temp) {
  assert(A);
  assert(p <= q);
  assert((q + 1) <= r);
  int n1 = q - p + 1;
  int n2 = r - q;

  int i = 0;
  int j = 0;

  // Copy the elements to the temporary array
  for (int k = 0; k < n1 + n2; k++) {
    temp[k] = A[p + k];
  }

  // Merge the two halves back into the original array
  int k = p;
  while (i < n1 && j < n2) {
    if (temp[i] <= temp[n1 + j]) {
      A[k] = temp[i];
      i++;
    } else {
      A[k] = temp[n1 + j];
      j++;
    }
    k++;
  }

  // Copy the remaining elements of left, if any
  while (i < n1) {
    A[k] = temp[i];
    i++;
    k++;
  }

  // Copy the remaining elements of right, if any
  while (j < n2) {
    A[k] = temp[n1 + j];
    j++;
    k++;
  }
}

// No need for the copy function in this case

