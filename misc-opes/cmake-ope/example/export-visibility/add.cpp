/*
 * add.cpp
 * Copyright (C) 2017 crane <crane@crane-pc>
 *
 * Distributed under terms of the MIT license.
 */

//#include "add.hpp"

#define DLL_PUBLIC __attribute__ ((visibility ("default")))
#define DLL_LOCAL  __attribute__ ((visibility ("hidden" )))


int DLL_LOCAL add(int a, int b)
{
    return a + b;
}

int  DLL_PUBLIC my_add(int a, int b)
{
    return add(a, b);
}



