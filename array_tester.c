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
	int index;								/* Index of current element */
	int newListSize = numElements * 2;		/* Double original capacity */
	int size = 6;							/* Size after adding 6 elements */
	int afterRemoveVal = 3;					/* List length after removing 3 */

	/* Create new list */
	list * testList = createlist(5);

	/* BEGIN INSERT: Insert elements to completely fill the list */
	insert(testList, 1);
	insert(testList, 2);
	insert(testList, 3);
	insert(testList, 4);
	insert(testList, 6); 	
	insert(testList, 5);

	/* Check that we have doubled the list size and there are 6 elements*/
	assert(testList->maxSize == newListSize);
	assert(testList->size == size);

	/* Check that the elements are in order */
	for (index = 0; index < testList->size; index++) {
		assert(testList->sortedList[index] == (index + 1));
	}

	/* END INSERT: Finished test cases for insert */
	printf("Passed test cases for insert.\n");

	/* BEGIN REMOVE_VAL */
	remove_val(testList, 6);
	remove_val(testList, 4);
	remove_val(testList, 5);

	/* List is 1, 2, 3 */
	assert(testList->size == afterRemoveVal);
	for (index = 0; index < testList->size; index++) {
		assert(testList->sortedList[index] == index + 1);
	}

	/* END REMOVE_VAL: Finished tests for remove_val */
	printf("Passed test cases for remove_val.\n");

	/* BEGIN GET_MAX_VALUE: list is 1, 2, 3 */
	assert(get_max_value(testList) == 3);
	remove_val(testList, 3);

	/* list is now 1, 2 */
	assert(get_max_value(testList) == 2);
	remove_val(testList, 2);

	/* list is now 1 */
	assert(get_max_value(testList) == 1);
	remove_val(testList, 1);

	/* list is now empty, return -1 */
	assert(get_max_value(testList) == -1);

	/* END GET_MAX_VALUE */
	printf("Passed test cases for get_max_value.\n");



	/* TODO Delete multiple elements */

	/* TODO Delete from an empty list, return 0 */


    return 0;
}
