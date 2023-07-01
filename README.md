# Project README

## Project Purpose
The purpose of this project is to implement the 'Insertsort' sorting algorithm in Assembly language and optimize the program using the WinMIPS64 Instruction Set Architecture simulator software.

## Functional Specification
Insertsort is an iterative sorting algorithm that, at each step i, divides the array into a sorted destination sequence a[0],..., a[i-1] and an unsorted source sequence a[i],..., a[n-1]. The goal is to insert the value contained in a[i] at the correct position in the destination sequence by sliding it backwards, thus reducing the source sequence by one element.

## 3.1 Assembly Program: "insertsort.s"
The code consists of four labels, each representing a portion of the code in C language.

1) Start:
- Load the number of elements in the array, indicated by the variable 'n'.
- Initialize the counter variable 'i' to 1.
- Allocate space for the decimal numbers array.

2) For:
- Check the continuation condition of the first 'for' loop: i < n.
- If the condition is false, the algorithm terminates.
- Initialize the counter variable 'j' to i - 1.
- Load the element in a[i] into a register.

3) Loop:
- Initialize the counter variable 'j' to j + 1.
- Check if the counter variable 'j' is less than 0.
- If the condition is true, jump to the 'Cont' label.
- Load the element in a[j] into a register.
- Compare the elements in a[j] and a[i].
  - If a[j] < a[i], no swapping is performed, and jump to the 'Cont' label.
  - If a[j] > a[i], perform the swap: a[j+1] and a[j].
- Decrement the counter variable 'j'.
- Jump back to the loop to continue comparing other elements.

4) Cont:
- Store the value in a[i] in memory.
- Increment the counter variable 'i'.
- Jump back to the 'For' loop to check the program exit condition.

5) End:
- Print the values of the sorted array in the appropriate registers.

## File Versions:
- **n1.s**:
  - Applied total loop unrolling optimization.
- **n.2.s**
  - Applied register renaming and instruction reordering to the fully unrolled loop version.
- **n.3.s**
  - Applied partial loop unrolling optimization.
  - Multiple versions were created to demonstrate the functionality of the program with either even or odd number of elements in the vector.
- **n.4.s**
  - Applied register renaming and instruction reordering to the partially unrolled loop version.
- **n.5.s**
  - Applied partial loop unrolling optimization to the inner 'for' loop for all elements contained within it, eliminating the branch from the previous version.
  - This reduces the number of stalls caused solely by the specific jump instruction.

Please refer to the individual files for the detailed code implementation of each version.
