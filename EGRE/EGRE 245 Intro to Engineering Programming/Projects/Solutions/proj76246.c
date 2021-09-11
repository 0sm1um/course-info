/* Project #7
EGRE245 Fall 2019
J. Hiles */

#include <stdio.h>
#include <stdlib.h>

#define NUM_FILES 9

int initializer(FILE ** fileNames) {//21 Lines  //The purpose of this function is to scan in the first parts of the ppm files, to get each file ready to run in a loop.	
	char fileName[] = "image000.ppm", magicNum[3];
	int height = 0, width = 0, maxColorValue = 0;
	printf("Input Files:\n");
	for (int i = 0; i < NUM_FILES; i++) {
		fileName[7] = i + 49;
		printf("%s,",fileName);
		if ((i + 1) % 3 == 0) {
			printf("\b \n");
		}
		fileNames[i] = fopen(fileName, "r");
	}
	for (int i = 0; i < NUM_FILES; i++) {//This loop is meant to iterate through each of the files in the FILE pointer array, and scan the first bits.
		fscanf(fileNames[i],"%s", magicNum);
		fscanf(fileNames[i],"%d", &height);
		fscanf(fileNames[i],"%d", &width);
		fscanf(fileNames[i],"%d", &maxColorValue);
	}
	fileNames[9] = fopen("image.ppm", "w");
	fprintf(fileNames[9] ,"%s\n%d %d\n%d\n", magicNum, height, width, maxColorValue);
return width * height;  //Width times height equals the number of pixels we must scan in.
}

int cmpfunc (const void * a, const void * b) {//3 Lines //This function came from tutorials point, and is neccisary for qsort to work.
   return ( *(int*)a - *(int*)b );
}

void inputPixel(int red[], int green[], int blue[], FILE ** fileNames) {//9 Lines //This function scans in a single pixel, and sorts each of the RGB arrays
	for (int i = 0; i < NUM_FILES; i++) { //This loop iterates through each of the files, and scans in 3 numbers, representing a single pixel.
		fscanf(fileNames[i],"%d", &red[i]);
		fscanf(fileNames[i],"%d", &green[i]);
		fscanf(fileNames[i],"%d", &blue[i]);
	}
	qsort(red, 9, sizeof(int), cmpfunc);
	qsort(green, 9, sizeof(int), cmpfunc);
	qsort(blue, 9, sizeof(int), cmpfunc);
}

void writeOutput(FILE ** fileNames,int * r, int * g, int * b) {//3 Lines
	fprintf(fileNames[9], "%d %d %d\n", *r, *g, *b); //Make it so it writes the 3 numbers that the pointers r g and b each point to, to image.ppm. With newlines.
}

int main(void) {//10 Lines //Main initializes the variables which will be used in all of our functions.
	printf("EGRE245 Project #8, J. Hiles 12-2019\n");
	int red[NUM_FILES], green[NUM_FILES], blue[NUM_FILES];
	int *r = &red[4],*g = &green[4], *b = &blue[4];//These 3 pointers point to the median of sorted arrays. They should never move.
	FILE *fileNames[NUM_FILES + 1];//FILE * is a data type. It stores pointers files. fopen is a function which returns pointers to files.
	int numPixels = initializer(fileNames);
		for (int i = 0; i < numPixels; i++) {//This loop represents reading in the pixel, deciding what the new pixel should be, and writing it to the output file.
			inputPixel(red, green, blue, fileNames);
			writeOutput(fileNames, r, g, b);
		}
	printf("\nOutput file: image.ppm");
return 0;
}