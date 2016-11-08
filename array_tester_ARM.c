#include "arraysort_ARM.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>


/* Test implementation of array-based list */
int main(void)
{
	/* Create new list */
    list * testList = createlist_ARM(5);
    printf("Passed test cases for createlist_ARM.\n");

    /* BEGIN INSERT: Insert elements to completely fill the list */
    assert(insert_ARM(testList, 6) == 0);
    assert(insert_ARM(testList, 5) == 0);
    assert(insert_ARM(testList, 4) == 0);
    assert(insert_ARM(testList, 3) == 0);
    assert(insert_ARM(testList, 2) == 0);

    /* Add one more element, so it forces list to resize */
    assert(insert_ARM(testList, 1) == 0);
    assert(testList->size == 6);
    assert(testList->maxSize == 10);
    printf("Passed test cases for insert_ARM.\n");

    /* BEGIN SEARCH: should return index of first occurrence of val */
    assert(search_ARM(testList, 1) == 0);
    assert(search_ARM(testList, 2) == 1);
    assert(search_ARM(testList, 3) == 2);
    assert(search_ARM(testList, 4) == 3);
    assert(search_ARM(testList, 5) == 4);
    assert(search_ARM(testList, 6) == 5);
    printf("Passed test cases for search_ARM.\n");

    /* BEGIN GET_MAX: should return last element in sortedList */
    assert(get_max_ARM(testList) == 6);
    printf("Passed test cases for get_max_ARM.\n");

    /* Begin GET_MIN: should return first element in sortedList */
    assert(get_min_ARM(testList) == 1);
    printf("Passed test cases for get_min_ARM.\n");

    /* BEGIN POP_MIN: should return and delete first element */
    assert(pop_min_ARM(testList) == 1);
    assert(testList->size == 5);

    /* List is now 2 3 4 5 6 */
    assert(pop_min_ARM(testList) == 2);
    assert(testList->size == 4);
    printf("Passed test cases for pop_min_ARM.\n");

    /* BEGIN REMOVE_VAL: List is now 3 4 5 6 6 */
    insert_ARM(testList, 6);
    assert(remove_val_ARM(testList, 6) == 2);

    /* List is now 3 4 5 */
    assert(remove_val_ARM(testList, 3) == 1);
    assert(testList->size == 2);
    printf("Passed test cases for remove_val_ARM.\n");

}
