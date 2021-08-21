/* Project #2
EGRE245 Fall 2019
J. Hiles */

#include <stdio.h>
#include <stdlib.h>

int main(void) {
	
float input = 0;
int dollarAmount = 0;
int pennies, nickels, dimes, quarters = 0;
int oneDollarBills = 0;
int fiveDollarBills = 0;
int tenDollarBills = 0;
int twentyDollarBills = 0;

printf("Proj. #2 - John Hiles\n");

/* The following sequence of code, functions to figure out how many of each type of currency is needed
 From top down, the algorithm determines how many of the highest value currency note is needed.
 Then, it subtracts the dollar value of money accounted for, and runs the same operation for the 
 remaining money not accounted for, until no money remains unaccounted for. */

	printf("Amount? ");
	scanf("%f", &input);
	dollarAmount = input * 100;											 //At this point, units for dollarAmount is in Cents
	
	if (dollarAmount < 0) {
	dollarAmount = abs(dollarAmount);                                    //This is in case anyone cheekily inputs a negative value
	printf(" \nNegative money? I can't believe you've done this.\n\n");
	}


	twentyDollarBills = dollarAmount / 2000;
	dollarAmount = dollarAmount - twentyDollarBills * 2000;
	tenDollarBills = dollarAmount / 1000;
	dollarAmount = dollarAmount - tenDollarBills * 1000;
	fiveDollarBills = dollarAmount / 500;
	dollarAmount = dollarAmount - fiveDollarBills * 500;
	oneDollarBills = dollarAmount / 100;
	dollarAmount = (dollarAmount - oneDollarBills * 100);
	quarters = dollarAmount / 25;
	dollarAmount = dollarAmount - quarters * 25;
	dimes = dollarAmount / 10;
	dollarAmount = dollarAmount - dimes * 10;
	nickels = dollarAmount / 5;
	dollarAmount = dollarAmount - (nickels * 5);
	pennies = dollarAmount;
	
//The following sequence prints the amounts calculated above back to the user.

	printf("%d Twenty dollar bills\n", twentyDollarBills);
	printf("%d Ten dollar bills\n", tenDollarBills);
	printf("%d Five dollar bills\n", fiveDollarBills);
	printf("%d One dollar bills\n", oneDollarBills);
	printf("%d Quarters\n", quarters);
	printf("%d Dimes\n", dimes);
	printf("%d Nickels\n", nickels);
	printf("%d Pennies\n", pennies); 

return 0;
}