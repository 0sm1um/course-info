/* Project #6
EGRE245 Fall 2019
J. Hiles */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define MAX_NUMBERS 100

int inputData(int []);
int largestTerm(int data[], int size);
bool errorCheck(int data[], int size);
void sorting(int data[], int size);
void reversal(int data[], int i);

int main(void) { //18 Lines
//printf("Proj. #6 - John Hiles\n");
int data[MAX_NUMBERS];
int size = inputData(data);
printf("number of values: %d\nvalues inputted:\n", size); 
	for (int i = 0; i < size; i++) {
		printf("%d ", data[i]);
		if (i + 1 % 10 == 0) {
			printf("\n");
		}
	}
printf("\nReversals:\n");
sorting(data, size - 1);
printf("\nfinal list\n");
	for (int i = 0; i < size; i++) {
		printf("%d ", data[i]);
	}
return 0;
}

int inputData(int data[]) {//19 Lines
	int size = 0;
	for (;;size++) {
		scanf(" %d", &data[size]);
		if (data[size] == -1) {
			break;
		}
		else if (data[size] < 0) {
			printf("WARNING: ignoring input value '%d': it is negative\n", data[size]);
			size--;
		}
		else {
			if (errorCheck(data, size) == true) {
				printf("WARNING: ignoring input value '%d': it is not unique\n", data[size]);
				size--;
			}
		}
	}
return size;
}
bool errorCheck(int data[], int size) { //7 Lines
	for (int i = 0; i < size; i++) {
		if (data[size] == data[i]) {
			return true;
		}
	}
return false;
}
void sorting(int data[], int size) {//21 Lines
int n = 0, newLineCount = 0;
	while (size != 0) {
		n = largestTerm(data, size);
		if (n == 0) {            //If n is at start of array, reverse the entire array
			if (size == 1) { //This stupid line is in there because of a nonsense specification in the program.
				printf("1 ");
			}
			reversal(data, size);
			newLineCount++;
			size--;
		}
		else {   //if n is somewhere in the middle, reverse from zero to n.
			reversal(data, n);
			newLineCount++;
		}
		if (newLineCount == 10) {
			printf("\n");
			newLineCount = 0;
		}
	}
}
int largestTerm(int data[], int size) {//8 lines
int largestNumber = 0, n = 0;
	for (int i = 0; i <= size; i++) {
		if (data[i] > largestNumber) {
			largestNumber = data[i];
			n = i;
		}
	}
return n;
}
void reversal(int data[], int i) { //8 lines
int a = 0;
printf("%d ", i + 1);
	for (int u = 0; u <= i; u++, i--) {//Executes reversal from 0 to i
		a = data[u];
		data[u] = data[i];
		data[i] = a;
	}
}