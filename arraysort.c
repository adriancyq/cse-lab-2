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
	/* Determine how many bytes we need */
	int allocateSize = maxElements + 2;

	/* Allocate spcace for list */
	list * listPointer = malloc((allocateSize) * sizeof(int));
	
	/* Initialize size and capacity */	
	listPointer->size = 0;
	listPointer->maxSize = maxElements;
	
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
	list * doubledList;
	int currentNum, tempNum, index;

	/* Check that the pointer points to something */
	if (ls == NULL) {
		return -1;
	}
	
	/* Check if the list is full */
	if (ls->size == ls->maxSize) {
		doubledList = realloc(ls, (ls->maxSize * 2) + 2);
		
		/* Check if we reallocated memory successfully */
		if (doubledList == NULL) {
			return -1;
		}
		
		/* Update the pointer to point to new list */
		else {
			ls = doubledList;
		}
	}

	/* Insert integer into list */
	ls->sortedList[ls->size] = val;
	
	/* Sort the list */
	for (index = ls->size - 1; index <= 1; index = index - 1) {
		
		/* Swap elements if one before it is greater */
		if (ls->sortedList[index] < ls->sortedList[index - 1]) {
			tempNum = ls->sortedList[index - 1];
			ls->sortedList[index - 1] = ls->sortedList[index];
			ls->sortedList[index] = tempNum;
			break;
		}
	}
	
	/* Update list element counter */
	ls->size++;

	/* Return index where we inserted the element */
	return index;

}

/**
 * This function takes a pointer to the list and an integer value as input. It
 * should delete all instances of elements in the sortedList with value 'val',
 * update the number of elements remaining in the list and return the number of
 * elements that were deleted. Once again the resulting list should be sorted.
 */
int remove_val(list *ls, int val)
{
}

/**
 * This function takes a pointer to the the list as input and returns the
 * maximum value in the list OR -1 if the list is empty.
 */
int get_max_value(list *ls)
{
}

/**
 * This function takes a pointer to the list and returns the minimum value in
 * the list OR -1 if the list is empty.
 */
int get_min_value(list *ls){
}

/**
 * This function returns the index of the first occurrence of 'val' in the
 * list. It returns -1 if the value 'val' is not present in the list.
 */
int search(list *ls, int val){
}

/**
 * This function returns the minimum value from the list and removes it from the
 * list. It returns -1 if the list is empty.
 */
int pop_min(list *ls){
}

/**
 * This function print the contents of the sorted list on a single line as follows:
 * 1 4 6 7 8
 */
void print(list *ls){
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
