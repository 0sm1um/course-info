/* Project #4
EGRE245 Fall 2019
J. Hiles */

/* I'm going for greatness here, extra credit baby!"*/

#include <stdio.h>

int main(void) {
printf("\nProj. #4 -- John Hiles\n\n");

int numZones = 0;
int carsPerZone = 0;
scanf("%d", &numZones);       //This variable specifies the vertical dimensions of the array.
scanf("%d", &carsPerZone);    //This variable specifies the horizontal dimensions of the array.

printf("number of zones: %d\n", numZones);
printf("Number of cars checked per zone: %d\n\n", carsPerZone);

int data[numZones][carsPerZone + 2]; 

/*the zeroith term will store the of cars that can be legally parked.
The carsPerZoneth term stores the final car, and the carsPerZone + 1th 
term stores the number of cars which exceed the limit.*/

	for (int j = 0; j <= numZones - 1; j++) { //This loop initializes the far right element to zero
			data[j][carsPerZone + 1] = 0;
	}

	for (int j = 0; j <= numZones - 1; j++) {//The goal of this for loop, is to put a value in the 0th term, then go down one row.
		scanf("%d", &data[j][0]);
		for (int i = 1; i <= carsPerZone; i++) {//The goal of this loop, is to put the values of cars in horizontally.
			scanf("%d", &data[j][i]);
				if (data[j][i] > data[j][0]) {//The goal of this statement, is to populate the final term in the array with the number of cars that went over the limit in the 0th term of the row.
					data[j][carsPerZone + 1] = data[j][carsPerZone + 1] + 1;
				}
		}
	}

/* For personal refrence, I will give a "key" on what each part of the multidimensional array means.
The first column (0) is populated the number of cars that can be legally parked.
Columns 1 through carsPerZone refer to a number of cars
Column carsPerZone + 1 refers to the number of cars exceeding the limit in each zone.*/

printf("Area  Limit  Parking times");
	for (int i = 1; i <= carsPerZone; i++) { //This loop prints a variable amount of underscores
		printf("  ");
	}
	
printf("\bOver Limit\n");
printf("----  -----  ");
	for (int i = 1; i <= carsPerZone; i++) { //This loop prints a variable amount of underscores
		printf("---");
	}
printf("  ----------\n");


	for (int j = 0; j <= numZones - 1; j++) { //The goal of this for loop, is to print the values of the array, row by row.
		j++;
		printf("%-4d  ", j);
		j--;
		printf("%02d     ", data[j][0]);
		for (int i = 1; i <= carsPerZone; i++) {
			printf("%02d ", data[j][i]);
		}
		printf("  %2d\n", data[j][carsPerZone + 1]);
	}



//This penultimate loop computes how many zones need a campaign's attention.

int dangerZones = 0;    //DANGER ZONE!

	for (int j = 0; j <= numZones; j++) {
		if ((float)data[j][carsPerZone + 1] / carsPerZone > 0.5) {
			dangerZones = dangerZones + 1;
		}
	}

/* Finally, this segment of code determines which zones have the highest amount of illegally parked cars.
It decides depending on the size of the amount of zones which needs attention, how many zones to focus on.
If there are only one or two zones, it chooses the greatest. If there are 3 or more, it picks the top 3.
*/

int howManyMoreThan = 0;
int printCounter = 0;

	if (dangerZones == 0) {
		printf("A campaign is not necessary,");
	}
	else if (dangerZones == 1) {
		printf("A campaign is necessary\n");
		printf("Concentrate on area ");
		for (int j = 0; j <= numZones - 1; j++) {
			for (int k = 0; k <= numZones - 1; k++) {
				if (data[j][carsPerZone + 1] < data[k][carsPerZone + 1]) {
					howManyMoreThan = howManyMoreThan + 1;
					if (howManyMoreThan >= 1) {
						break;
					}
				}
			}
			if (howManyMoreThan < 1) {
				j++;
				printf("%d-", j);
				j--;
				break;
			}
			howManyMoreThan = 0;
		}
	}
	else if (dangerZones == 2) {
		printf("A campaign is necessary\n");
		printf("Concentrate on areas ");
		for (int j = 0; j <= numZones - 1; j++) {
			for (int k = 0; k <= numZones - 1; k++) {
				if (data[j][carsPerZone + 1] < data[k][carsPerZone + 1]) {
					howManyMoreThan = howManyMoreThan + 1;
					if (howManyMoreThan >= 2) {
						break;
					}
				}
			}
			if (howManyMoreThan < 2) {
				j++;
				printf("%d and ", j);
				j--;
				printCounter++;
					if (printCounter == 2) {
						printf("\b \b\b \b\b \b\b \b");
						break;
					}
			}
			howManyMoreThan = 0;
		}
	}
	else if (dangerZones == 3) {
		printf("A campaign is necessary\n");
		printf("Concentrate on areas ");
		for (int j = 0; j <= numZones - 1; j++) {
			for (int k = 0; k <= numZones - 1; k++) {
				if (data[j][carsPerZone + 1] < data[k][carsPerZone + 1]) {
					howManyMoreThan = howManyMoreThan + 1;
					if (howManyMoreThan >= 3) {
						break;
					}
				}
			}
			if (howManyMoreThan < 3) {
				j++;
				printf("%d,", j);
				j--;
			}
			howManyMoreThan = 0;
		}
	}
	else {
		printf("A campaign is necessary\n");
		printf("Concentrate on areas ");
		for (int j = 0; j <= numZones - 1; j++) {
			for (int k = 0; k <= numZones - 1; k++) {
				if (data[j][carsPerZone + 1] < data[k][carsPerZone + 1]) {
					howManyMoreThan = howManyMoreThan + 1;
					if (howManyMoreThan >= 3) {
						break;
					}
				}
			}
			if (howManyMoreThan < 3) {
				j++;
				printf("%d,", j);
				j--;
			}
			howManyMoreThan = 0;
		}
	}
	
printf("\b \b\n");
	
return 0;
}