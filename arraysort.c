#include <stdio.h>
#include <stdlib.h>

#include "arraysort.h"

/**
 * This function creates an empty list, with space allocated for an array of
 * maxElements ints (pointed to by int *sortedList) and returns a pointer to the
 * list.
 */
list* createlist(int maxElements)
{	

	/* Allocate spcace for list */
	list * listPointer = malloc(sizeof(list));
	
	/* Initialize size and capacity */	
	listPointer->size = 0;
	listPointer->maxSize = maxElements;
	listPointer->sortedList = malloc(sizeof(int) * maxElements);
	
	/* return pointer to list */
	return listPointer;

}



/**
 * This function takes a pointer to the list and an integer value as input. It
 * should insert the value 'val' into sortedList, update the number of elements
 * in the list and return the index where the element was inserted. If the list
 * is full before inserting the element, it should increase the size of the list
 * to double its previous size and then insert the element. If the result of the
 * insert was not successful it should return -1. Note that the resulting list
 * should be sorted and there should be no information loss. The function should
 * return -1 if no valid list was passed to it..
 */
int insert(list *ls, int val)
{
	void * doubledSortedList;
	int tempNum, index;

	/* Check that the pointer points to something */
	if (ls == NULL) {
		return -1;
	}
	
	/* Check if the list is full */
	if ((ls->size) == (ls->maxSize)) {
		doubledSortedList = realloc((void*)(ls->sortedList), (ls->maxSize) * 2 * sizeof(int));
		
		/* Check if we reallocated memory successfully */
		if (doubledSortedList == NULL) {
			return -1;
		}
		
		/* Update the maxsize and the pointer to point to new list */
		else {
			ls->sortedList = doubledSortedList;
			ls->maxSize = ls->maxSize * 2;
		}
	}

	/* Insert integer into list */
	ls->sortedList[ls->size] = val;

	/* Update list element counter */
	ls->size++;

	/* Check to see if we need to sort */
	if (ls->size == 1) {

		/* Element we added was the first, no need to sort */
		return 0;
	}

	/* List was previously populated, may need sorting */
	else {

		/* Iterate through list backwad */
		for (index = (ls->size) - 1; index >= 1; index --) {

			/* Found an element to the left that is bigger */
			if (ls->sortedList[index] < ls->sortedList[index - 1]) {

				/* save previous element */
				tempNum = ls->sortedList[index - 1];

				/* Overrwrite previous element and swap */
				ls->sortedList[index - 1] = ls->sortedList[index];
				ls->sortedList[index] = tempNum;

			}

			/* Found an element to the left that is smaller, stop sorting */
			else if (ls->sortedList[index] >= ls->sortedList[index - 1]) {
				break;
			}
		}

		/* Return the index of the sorted element */
		return index;

	}
}



/**
 * This function takes a pointer to the list and an integer value as input. It
 * should delete all instances of elements in the sortedList with value 'val',
 * update the number of elements remaining in the list and return the number of
 * elements that were deleted. Once again the resulting list should be sorted.
 */
int remove_val(list *ls, int val)
{
	int numRemoved;				/* Number of elements removed */
	int firstRemoveIndex;		/* Index of first element to remove */
	int lastRemoveIndex;		/* Index of last element to remove */
	int index; 					/* Index of current element */

	numRemoved = 0;

	/* Find the total number of occurrences of val */
	for (index = 0; index < ls->size; index++) {

		/* Check if current value is the one we need to delete */
		if (ls->sortedList[index] == val) {

			/* Keep track of index of first occurrence of val */
			firstRemoveIndex = index;

			/* Keep track of how many occurrences of val we have seen */
			numRemoved++;
		}
	}

	/* Determine the index of the last element to be removed */
	lastRemoveIndex = firstRemoveIndex + numRemoved - 1;

	/* Shift the list to the left by however many elements we deleted */
	for (index = lastRemoveIndex + 1; index < ls->size; index++) {
		ls->sortedList[index - numRemoved] = ls->sortedList[index];
	}

	/* Change size */
	ls->size = ls->size - numRemoved;

	/* Return the number of elements deleted */
	return numRemoved;
}



/**
 * This function takes a pointer to the the list as input and returns the
 * maximum value in the list OR -1 if the list is empty.
 */
int get_max_value(list *ls)
{	
	/* Check if the list is empty */
	if (ls->size == 0) {
		return -1;
	}

	/* List is not empty, get the last element */
	else {
		return ls->sortedList[(ls->size) - 1];
	}
}



/**
 * This function takes a pointer to the list and returns the minimum value in
 * the list OR -1 if the list is empty.
 */
int get_min_value(list *ls){
	
	/* Check if the list is empty */
	if (ls->size == 0) {
		return -1;
	}

	/* List is not empty, get the first element */
	else {
		return ls->sortedList[0];
	}
}



/**
 * This function returns the index of the first occurrence of 'val' in the
 * list. It returns -1 if the value 'val' is not present in the list.
 */
int search(list *ls, int val)
{
	int index;						/* Index of current element */
	
	/* Iterate through the array */
	for (index = 0; index < ls->maxSize; index = index + 1) {
		if (ls->sortedList[index] == val) {
			return index;
		}
	}
	
	/* Return -1 if value is not found */
	return -1;
}



/**
 * This function returns the minimum value from the list and removes it from the
 * list. It returns -1 if the list is empty.
 */
int pop_min(list *ls)
{

	int minNum;						/* Smallest element in list */
	int index;						/* Index of current element */
	
	/* Check if the list is empty */
	if (ls->size == 0) {
		return -1;
	}

	/* Grab the first (smallest) number in the array */
	minNum = ls->sortedList[0];
	
	/* Decrease the list element counter */
	ls->size--;
	
	/* Shift everything to the left by one */
	for (index = 1; index < ls->size; index++) {
		ls->sortedList[index] = ls->sortedList[index - 1];
	} 
	
	/* Return the minimum number */
	return minNum; 
}



/**
 * This function print the contents of the sorted list on a single line as follows:
 * 1 4 6 7 8
 */
void print(list *ls){
	int index; 						/* Index of current element */

	for (index = 0; index < ls->size; index++){

		/* Print one element at a time */
		printf ("%d ", ls->sortedList[index]);
	}
}



/**
 * Identical to get_min_value(), but implemented in ARM assembly
 * (use given file get_min_ARM.s)
 */
int get_min_ARM(list *ls);



/**
 * Identical to get_max_value(), but implemented in ARM assembly
 * (use given file get_max_ARM.s)
 */
int get_max_ARM(list *ls);
