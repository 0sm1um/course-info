/* Project #3
EGRE245 Fall 2019
J. Hiles */

#include <stdio.h>
#include <math.h>

int main(void) {
	
printf("Proj. #3 - John Hiles\n\n");
float powerLamp = 0, heightLamp = 0, Ch = 0, distanceApart = 0;
float firstLampPosition = 0, secondLampPosition = 0, thirdLampPosition = 0, fourthLampPosition = 0;
float luminosity = 0, interval = 0;

printf("power of lamps (in watts)? ");
scanf("%f", &powerLamp);
printf("height of lamp (in meters)? ");
scanf("%f", &heightLamp);
Ch = powerLamp * heightLamp;
printf("distance apart (in meters)? ");
scanf("%f", &distanceApart);
printf("\npower: %.2f watts\n", powerLamp);
printf("height: %.2f meters\n", heightLamp);
printf("distance apart: %.2f meters\n\n", distanceApart);


firstLampPosition = 0;
secondLampPosition = 1 * distanceApart;
thirdLampPosition = 2 * distanceApart;
fourthLampPosition = 3 * distanceApart;

interval =  3.0 / 5.0 * distanceApart;

printf("total distance: %.2f meters\n",fourthLampPosition);
printf("interval: %.2f meters\n", interval);


//d = (firstLampPosition - i)
printf("   d      L\n");
printf(" ------ -------\n");
	for (float i = 0; i <= 3.0*distanceApart; i = i + 3.0 / 5.0 * distanceApart) {
		
		luminosity = Ch / (powf(powf(heightLamp, 2.0) + powf(firstLampPosition - i, 2.0), 1.5));
		luminosity = luminosity + Ch / (powf(powf(heightLamp, 2.0) + powf(secondLampPosition - i, 2.0), 1.5));
		luminosity = luminosity + Ch / (powf(powf(heightLamp, 2.0) + powf(thirdLampPosition - i, 2.0), 1.5));
		luminosity = luminosity + Ch / (powf(powf(heightLamp, 2.0) + powf(fourthLampPosition - i, 2.0), 1.5));
		printf("%6.2f  %-7.5f\n", i, luminosity);
		
	}

return 0;
}