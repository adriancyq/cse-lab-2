#include "arraysort_ARM.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>


/* Test implementation of array-based list */
int main(void)
{
	/* Create new list */
    list * testList = createlist_ARM(5);

    /* BEGIN INSERT: Insert elements to completely fill the list */
    printf("Element %d at index %d.\n", 1, insert_ARM(testList, 1));
    printf("Element %d at index %d.\n", 2, insert_ARM(testList, 2));
    printf("Element %d at index %d.\n", 3, insert_ARM(testList, 3));
    printf("Element %d at index %d.\n", 4, insert_ARM(testList, 4));
    printf("Element %d at index %d.\n", 5, insert_ARM(testList, 5));
    printf("Element %d at index %d.\n", 6, insert_ARM(testList, 6));
    
    printf("Size %d.\n", testList->size);
    printf("MaxElements %d\n", testList->maxSize);
    printf("Element: %d.\n", testList->sortedList[0]);
    printf("Element: %d.\n", testList->sortedList[1]);
    printf("Element: %d.\n", testList->sortedList[2]);
    printf("Element: %d.\n", testList->sortedList[3]);
    printf("Element: %d.\n", testList->sortedList[4]);
    printf("Element: %d.\n", testList->sortedList[5]);
    printf("Passed test cases for Insert_ARM.\n");

    /* Testing Search */
    printf("Search result: %d.\n", search_ARM(testList, 1));
    printf("Search result: %d.\n", search_ARM(testList, 2));
    printf("Search result: %d.\n", search_ARM(testList, 3));
    printf("Search result: %d.\n", search_ARM(testList, 4));
    printf("Search result: %d.\n", search_ARM(testList, 5));
    printf("Search result: %d.\n", search_ARM(testList, 6));

    printf("Pop: %d.\n", pop_min_ARM(testList));
    printf("Size %d.\n", testList->size);
    printf("MaxElements %d\n", testList->maxSize);
    printf("Element: %d.\n", testList->sortedList[0]);
    printf("Element: %d.\n", testList->sortedList[1]);
    printf("Element: %d.\n", testList->sortedList[2]);
    printf("Element: %d.\n", testList->sortedList[3]);
    printf("Element: %d.\n", testList->sortedList[4]);
    
    // /* BEGIN REMOVE_VAL: testing deletion of multiple elements */
    // insert(testList, 6);

    // /* Should delete two instances of 6 */
    // remove_val_ARM(testList, 6);
    // remove_val_ARM(testList, 4);
    // remove_val_ARM(testList, 5);

    // /* List is 1, 2, 3 */
    // assert(testList->size == afterRemoveVal);
    // for (int index = 0; index < testList->size; index++) {
    //     assert(testList->sortedList[index] == index + 1);
    // }

    /* END REMOVE_VAL: Finished tests for remove_val */
    //printf("Passed test cases for remove_val_ARM.\n");
}
