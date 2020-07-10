/*
 * 선점형 라운드로빈의 스케쥴러 실습 프로그램
 * 작성자: Kyuling Lee
 * kyuling@me.com
 */

#include <unistd.h>
#include <stdio.h>
#include "schedule.h"

//스케줄링 대상이 되는 태스크
void test_func_one(void* context)
{
	int i = 0;
	while (1) 
	{
		i++;
		printf("TASK 1 : %5d\n", i);
		sleep(1);
		if ( i == 15 ){
			break;
		}
	}
}

void test_func_two(void* context)
{
	int i = 500;
	while (1) 
	{
		i = i+10;
		printf("\t\t\tTASK 2 : %3d\n", i);
		sleep(1);
		if ( i == 600 ){
			break;
		}
	}
}

void test_func_three(void* context)
{
	int i = 1000;
	while (1)
	{
		i++;
		printf("\t\t\t\t\t\tTASK 3 : %4d\n", i);

		sleep(1); 
		sleep(1);

		if ( i == 1005){
			break;
		}
	}
}

int main()
{
	thread_init();

	thread_create(test_func_one, NULL);
	thread_create(test_func_two, NULL);
	thread_create(test_func_three, NULL);

	thread_wait();

	return 0;
}

