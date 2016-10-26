// Put your name(s) and PID(s) here and a quick summary of what this does here

#include <stdio.h>
#include <stdlib.h>

#include "arraysort.h"

int main(void)
{	
	int numElements = 5;

	/* Create new list */
	printf("Creating list to hold %d elements\n", numElements);
	list * testList = createlist(5);

	/* Insert elements in the list */
	insert(testList, 1);
	insert(testList, 2);
	insert(testList, 3);
	insert(testList, 4);
	insert(testList, 6);
	insert(testList, 5);

	printf("The list contains...\n");
	print(testList);

    return 0;
}
