#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>


#define REQUIRED_NUM_OF_ARGUMENTS 2

int main(int argc, char** argv)
{

    // open syslog
    openlog(NULL, LOG_CONS, LOG_USER);

    if (argc < REQUIRED_NUM_OF_ARGUMENTS + 1)
    {
        syslog(LOG_ERR, "Invalid number of input arguments:%d. 1st argument: file path (with file name included). 2nd argument: text to write to a file.\n", argc);
        return 1;
    }
    
    // open file with a file path and name defined in the first argument
    FILE* fd = fopen(argv[1], "w");

    if (fd == NULL)
    {
        syslog(LOG_ERR, "File not opened");
        return 1;
    }

    fprintf(fd, "%s", argv[2]);
    syslog(LOG_DEBUG, "Writing %s to %s.", argv[2], argv[1]);
    fclose(fd);

    return 0;
}