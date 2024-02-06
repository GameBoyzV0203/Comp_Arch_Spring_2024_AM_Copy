#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// receives a string pointer and prints each location in memory, the ascii value, and the character associated in the string
void memDump(char *string)
{
    for(int i = 0;i<strlen(string);i++)
    {
        printf("\n%p %d %c", string + i, *(string + i), *(string + i));
    }
}

// Calculates the given pointer strings hash value by finding its ascii character values and calculating the average
int getHash(char *string)
{
    int hashValue = 0;
    for(int i = 0;i<strlen(string);i++)
    {
        hashValue += *(string + i);
    }
    hashValue /= strlen(string);
    return hashValue;
}

//receives a string pointer to evaluate and return either true(1) or false(0) if the string is a palindrome
int isPalindrome(char *string)
{
    for(int i = 0; i<(strlen(string) / 2); i++)
    {
        if(*(string + i) != *(string + (strlen(string)-1)-i))
        {
            return 0;
        }
    }
    return 1;
}

//receives a starting index and a string pointer to print out the string from the given starting index onwards
void printFromIndex(int start, char *string)
{
    if(start > strlen(string)-1 || start < 0)
    {
        printf("Oops! That isn’t a valid starting index, try again later.");
    }
    else
    {
        printf("So, “%s” starting at index %d is “", string, start);
        for(int i = start; i<strlen(string);i++)
        {
            printf("%c", *(string + i));
        }
        printf("”");
    }
    
}

// Main method
int main(int argc, char* argv[])
{
    char* letters = (char*) calloc(15, sizeof(char)); //Use calloc to create a pointer to a block in memory to store the word entered by the user
    printf("Enter an all lowercase word, max of 15 characters: ");
    scanf("%14s", letters); //User input
    printf("\n");

    printf("Choose an option:\n"); // Option prompts
    printf("  1) Memory Dump\n");
    printf("  2) Print Hash Value\n");
    printf("  3) Determine if your word is a palindrome\n");
    printf("  4) Print the word from an index\n\n");
    printf("Option number: ");

    int option = 0; //stores option input
    scanf("%d", &option); //User input for option value
    if(option == 1) // if Option == 1, Run memDump method
    {
        memDump(letters);
    }
    else if(option == 2) // else if option == 2, run getHash Method
    {
        printf("Hash Value: %d",getHash(letters));
    }
    else if(option == 3) // else if option == 3, run isPalindrome Method
    {
        if(isPalindrome(letters) == 1)
        {
            printf("Nice, %s is a palindrome :)", letters);
        }
        else
            printf("Sadly, %s is not a Palindrome :(", letters);
    }
    else // else, run printFromIndex Method
    {
        int index = 0;
        printf("What index should I start at? ");
        scanf("%d", &index);
        printFromIndex(index, letters);
    }

    return 0; // exited main succesfully
}

