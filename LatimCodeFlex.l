%option noyywrap

%{
	#include <string.h>
	#include<stdlib.h>
	#include<stdio.h>
	#include "LatimCodeBison.tab.h"
	int linenumb=1;
%}

%%
"pelagus?"  { return INIT; }
[ \t]   	{                   }
\n		    { return BREAKLINE; }
";"         { return SEMICOLON; }
"+"		    { return SUM; }
"-"		    { return MINUS; }
"^"        	{ return POT; }
"*"		    { return MULTIPLY; }
"/"		    { return DIVIDE; }
"("		    { return PAROPEN; }
")"		    { return PARCLOSE; }
"{"         { return OPENBLOCK; }
"}"         { return CLOSEBLOCK; }
"=="        { return CMPREQUAL; }
"="         { return EQUAL; }
"ostende"   { return PRINT; }
"si"        { return IF; }
"alium"     { return ELSE; }
"facite"    { return DO; }
"dum"       { return WHILE; }
"<"         { return LESSTHAN; }
">"         { return MORETHAN; }
"et"        { return AND; }
"uel"       { return OR; }
"officium"	{ return FUNCTION_DEF; }
[0-9]+	    {yylval.d = atoi(yytext); return INT; }
[a-z]+      { yylval.s = strtok(yytext,":");return FILUN; }
%%