/****************************************************************************
													Jonathan Chiu, A12113428
													Adrian Cordova
													10/27/2016
													Fall 2016
													CSE30	
							PA2: Test file
Filename: 		array_tester.c
Description:	Creates a new list of capcity five. Inserts 6 elements into
				the list to ensure that it is capable of resizing. Removes
				elements in the list and prints it out.
****************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "arraysort.h"

/* Test implementation of array-based list */
int main(void)
{	
	int numElements = 5;					/* Initial list capacity */

	/* Create new list */
	printf("Creating list to hold %d elements\n", numElements);
	list * testList = createlist(5);

	/* Insert elements to completely fill the list */
	insert(testList, 1);
	insert(testList, 2);
	insert(testList, 3);
	insert(testList, 4);
	insert(testList, 6); 	

	/* Sort and increase size of list */
	insert(testList, 5);
	printf("The list contains...\n");
	print(testList);

	/* TODO Delete a single element in the front of the list */

	/* Delete a single element in the middle of the list */
	printf("Deleting an element...\n");
	assert(remove_val(testList, 2) == 1);
	print(testList);

	/* TODO Delete a single element in the back of the list */

	/* TODO Delete multiple elements */

	/* TODO Delete from an empty list, return 0 */


    return 0;
}
