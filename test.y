%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <stdbool.h>
    #include <string.h>

    // #include "header.h"

    void yyerror(char *);
    int yylex(void);

    #define MAX_SYMBOLS 1024
    #define FUNC 1
    #define VAR 2

    #define BOLD "\x1b[1m"
    #define RED "\x1b[31m"
    #define MAGENTA "\x1b[35m"
    #define RESET "\x1b[0m"

    %define lr.type canonical-lr

%}

/* %error-verbose */

%token a STAR PLUS

%%      

E: 
    S {}
    ;

S:
    a B {}
    ;

B:
    a B A B {}
    |
    ;

A:
    PLUS {}
    STAR {}
    ;

%%

void yyerror(char *s) 
{
    fprintf(stderr, "%s\n", s);
}

int main(int argc, char* argv[]) 
{
    yyparse();
}