/* Project #1
EGRE245 Fall 2019
J. Hiles */

#include <stdio.h>
int main(void) {
float r1,r2,r3;
printf("Proj. #1 - J. Hiles\n");
printf("Enter the value of 3 resisters connected in parallel (in kohms)\n");
printf(" #1: ");
scanf("%f",&r1);
printf(" value entered: %f\n",r1);
printf(" #2: ");
scanf("%f",&r2);
printf(" value entered: %f\n",r2);
printf(" #3: ");
scanf("%f",&r3);
printf(" value entered: %f\n",r3);
printf("\n");
printf(" |------ %6.2f kohms ------|\n",r1);
printf("----|------ %6.2f kohms ------|----\n",r2);
printf(" |------ %6.2f kohms ------|\n",r3);
printf("\n");
printf("Effective resistance: %f kohms\n",1.0/(1.0/r1 + 1.0/r2 + 1.0/r3));
return 0;
}