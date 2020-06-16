/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:
 *
 *        Version:  1.0
 *        Created:  11/22/2017 06:03:23 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (),
 *   Organization:
 *
 * =====================================================================================
 */
/*
 * main.cpp
 * Copyright (C) 2017 crane <crane@crane-pc>
 *
 * Distributed under terms of the MIT license.
 */

//#include "main.h"

/*#include <iostream>*/

int my_add(int a, int b);
int add(int a, int b);


int main(int argc, char **argv)
{
    add(1, 2);
    my_add(1, 2);
    /*std::cout << (my_add(1, 2)) << std::endl;*/
    /*std::cout << (add(1, 2)) << std::endl;          // will failed*/
}
