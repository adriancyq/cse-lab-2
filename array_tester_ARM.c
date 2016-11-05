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
    insert_ARM(testList, 1);

    assert(testList->maxSize == 5);
    assert(testList->size == 1);
    assert(testList->sortedList[0] == 1);
}