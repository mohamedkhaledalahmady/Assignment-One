#include<stdio.h>
#include<string.h>

typedef signed char int8;	// -128 : 127
typedef unsigned char uint8;	// 0 : 255

#define MaxCommandLength 50	// Command Maximum Length
#define less -1
#define match 0
#define greater 1
#define True 1
#define False 0

// Function to get length of string
uint8 Length(uint8* str)
{
	uint8 count = 0;
	while(*(str+count))
		count++;
	return count;
}
// Function to compare between two strings that return -1, 0, 1 if string one less , match , greater tan string two
int8 Compare(uint8* str1, uint8* str2)
{
	uint8 L1 = Length(str1) - 1;
	uint8 L2 = Length(str2);
	int8 state = match;
	//printf("L1: %d\nL2: %d\n", L1, L2);
	if(L1 <= L2)
	{
		for(uint8 i = 0; i < L2 ; i++)
		{
			if(str1[i] != str2[i])
			{
				state = str1[i] > str2[i] ? greater : less;
				goto exit;
			}  
		}
	}	
	else 
	{
		for(uint8 i = 0; i < L1 ; i++)
		{
			if(str1[i] != str2[i])
			{
				state = str1[i] > str2[i] ? greater : less;
				goto exit;
			}  
		}	
	}
	exit:
		return state;
}

int main()
{
	uint8 command[MaxCommandLength];
	while(True)
	{
		printf("qwal ya sa7bii #$ ");
		fgets(command, MaxCommandLength, stdin);
		// printf("%d\n", Compare(command, "exit"));
		if(Compare(command, "exit") == 0)
		{
			printf("Good Bye:)\n");
			break;
		}
		Length(command) != 1 ? printf("you said: %s", command) : printf("you didn't tell anything ya sa7bii :(\n");
	}	
	return 0;
}
