#include <stdio.h>
#include <stdlib.h>
#include "itemType.h"

int itemcmp(itemType n1,itemType n2) {
  return (n1<n2?-1:(n1>n2?1:0));
}

char *toItemString(itemType x) {
  char *s = malloc(128); // arbitrary
  snprintf(s,20,"%d",(int)x);
  return s;
}
