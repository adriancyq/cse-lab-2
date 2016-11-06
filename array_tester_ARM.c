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
    insert_ARM(testList, 2);
    insert_ARM(testList, 1);

    assert(testList->sortedList[0] == 1);
    assert(testList->sortedList[1] == 2);
    printf("Passed test cases for Insert_ARM.\n");
    
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