#ifndef ITEMTYPE_H
#define ITEMTYPE_H
#include "limits.h"

#define NULLITEM INT_MIN

typedef int itemType;

int itemcmp(itemType,itemType);
char *toItemString(itemType);

#endif