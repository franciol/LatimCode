%{
	#include <stdio.h>
	#include<stdlib.h>
	FILE* yyin;
    extern int linenumb;
%}

%union {
	char c;
	char *s;
	int d;
}

%token EQUAL BREAKLINE INIT
%token SEMICOLON SUM MINUS
%token POT MULTIPLY DIVIDE PAROPEN
%token PARCLOSE OPENBLOCK CLOSEBLOCK CMPREQUAL 
%token PRINT IF ELSE DO WHILE
%token LESSTHAN MORETHAN AND OR 
%token <d> INT 
%token <s> FILUN

%left SIM MINUS POT MULTIPLY DIVIDE
%left LESSTHAN MORETHAN 
%left OR AND CMPREQUAL
%right EQUAL 

%%

program:  
    | INIT statum
    ;

statum: PRINT test
    | IF parentheseos statum
    | IF parentheseos statum ELSE statum
    | WHILE parentheseos statum
    | DO statum WHILE parentheseos
    | OPENBLOCK statum CLOSEBLOCK
    | expressio
    ;

parentheseos: PAROPEN expressio PARCLOSE
    ;

expressio: str EQUAL expressio
    | test
    ;

test: test
    | test LESSTHAN test
    | test MORETHAN test
    | test CMPREQUAL test
    ;


relationes: operatio
    | operatio SUM operatio
    | operatio MINUS operatio
    | operatio OR operatio
    ;

operatio: genus
    | genus POT genus
    | genus MULTIPLY genus
    | genus DIVIDE genus
    | genus AND genus 
    ;

genus: str
    | integer
    | parentheseos
    ;

str: FILUN
    ;

integer: INT
    ;



%%

int main(int argc, char **argv){
	yyin=fopen(argv[1],"r");
	yyparse();
	fclose(yyin);
	return 0;
}

yyerror(char *s){
	fprintf(stderr, "ERROR in line %d\n", linenumb);
}