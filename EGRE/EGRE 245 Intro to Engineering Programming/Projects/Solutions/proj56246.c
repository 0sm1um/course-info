/* Project #5
EGRE245 Fall 2019
J. Hiles */

#include <stdio.h>
#include <string.h>
#include <math.h>

#define COMMENT_MAX 80
#define MAX_STUDENTS 200
#define MAX_QUESTIONS 10

int main(void) {

printf("Proj. #5; J. Hiles\n\n");

char comment[COMMENT_MAX + 1];
scanf("%[^\n]", comment);          //This block of code reads the first line, and stores it as a a string.
printf("%s\n", comment);

char key[MAX_QUESTIONS + 1];       //It also saves the key for the test, for use later in the code.
scanf(" %[^\n]", key);
int numQuestions = strlen(key);
char response[numQuestions + 1];
printf("%s\n", key);

int grades[MAX_STUDENTS];     //This array contains each student's score. 
float grader(void) {
			int correctAnswers = 0, totalAnswers = numQuestions;
			for (int i = 0; i < numQuestions; i++) {
				if (key[i] == response[i]) {
					correctAnswers++;
				}	
			}
			return (float)correctAnswers / (float)totalAnswers; 
}


int studentID[MAX_STUDENTS];
int numStudents;

	for (int i = 0; i < MAX_STUDENTS; i++) {
		scanf(" %d", &studentID[i]);
		if (studentID[i] == 0) {
			break;
		}
		scanf(" %[^\n]", response);
		grades[i] = round(grader() * numQuestions);
		numStudents++;
	}
	
int bestScore = 0;

	for (int i = 0; i < numStudents; i++) {
		if (grades[i] > bestScore) {
			bestScore = grades[i];
		}
	}
	
int sum = 0;
	for (int i = 0; i < numStudents; i++) {
		sum = sum + grades[i];
	}
	
float averageScore = (float)sum / (float)numStudents;	

printf("# of students: %d\n", numStudents);
printf("average score: %.2f\n", averageScore); 
printf("best score: %d\n", bestScore);
printf(" id  score grade\n");
printf("---- ----- -----\n");
	
	

char letterGrade;
	for (int i = 0; i < numStudents; i++) {
		if (grades[i] >= bestScore - 1) {
			letterGrade = 'A';
		}
		else if (grades[i] == bestScore - 2) {
			letterGrade = 'B';
		}
		else if (grades[i] >= bestScore - 4) {
			letterGrade = 'C';
		}
		else if (grades[i] == bestScore - 5) {
			letterGrade = 'D';
		}
		else {
			letterGrade = 'F';
		}
		printf("%04d  %2d     %c\n", studentID[i], grades[i], letterGrade);
	}
	

return 0;
}