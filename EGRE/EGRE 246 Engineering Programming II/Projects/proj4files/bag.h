#ifndef BAG_H
#define BAG_H

#include <stdbool.h>
#include "itemType.h"

typedef struct bagType *bag;

bag createBag(); // create a new bag
void freeBag(bag);  // deallocates a bat

void emptyBag(bag);                // emptys the bag
void bagCopy(bag b1,bag b2);    // copies b2 to b1, overwriting b1
int size(bag);                   // returns the number of items in bag
int count(bag b,itemType x);    // returns number of items x in b
int eraseOne(bag,itemType);     // erases the value x in b, returns # removed
void add(bag,itemType);         // inserts value in bag
itemType get(bag b,int n);      // returns item at n in b where 0 is first item
bool contains(bag b,itemType x);// returns true if x is in b, false otherwise
bool isEmpty(bag);               // return true if bag is empty
bool equals(bag b1,bag b2);      // returns true if b1 == b2
char *toBagString(bag);

#endif