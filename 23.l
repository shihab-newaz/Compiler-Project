%option noyywrap
alphabets [a-zA-Z]
digits [0-9]
other_symbols [%~`?_@]
space " "
newline "\n"

%{
    #include<stdio.h>
    #include "23.tab.h"
    #include<conio.h>
    #include <string.h>
    void showError();
%}

%%
{space}|{newline}		{}
"main" 				    {return MAIN; }
"@comprise"[ ]+.+[.][h] {printf("Header Declared\n");}

"integer" 	    {return INTEGER;}
"float" 	    {return FLOAT;}
"character"     {return CHARACTER;}

"in_case"		{return IF;}
"else" 			{return ELSE;}
"elif" 			{return ELIF;}
"shift_to" 		{return SWITCH;}
"case"	        {return CASE;}
"resume"        { /*return CONTINUE; */}
"if_failure"	{return DEFAULT;}
"put_back"  	{return RETURN;}
"when"			{return WHILE;}
"end"			{return BREAK;}
"as_long_as"    {return FOR;}
"sin"           {return SIN;}
"cos"           {return COS;}
"tan"           {return TAN;}
"log"           {return LOG;}
"ln"            {return LN;}
"write"		    {return PRINT;}
"read"       	{return SCAN;}
":=" 		    {return ASSIGN;}
";"             {return SEMICOLON;}
"add" 		    {return ADD;}
"sub" 		    {return SUB;}
"mul" 		    {return MUL;}
"div" 	    	{return DIV;}
"mod" 		    {return MOD;}
"," 		    {return COMMA;}
"$" 		    {return ENDLINE;}
"add_one"       {return ADD_ONE;}
"sub_one"       {return SUB_ONE;}
"'"             {return QUOTATION;}
"<=" 			{return LESS_EQ;}
">=" 			{return GREATER_EQ;}
"<" 			{return LESS;}
">" 			{return GREATER;}
"==" 			{return EQ;}
[!=] 			{return N_EQ;}
[(] 			{return P_START;}
[)] 			{return P_END;}
"{" 			{return F_START;}
"}"				{return F_END;}
"bit_and" 	    {return AND;}
"bit_or"	    {return OR;}
"bit_not" 		{return NOT;}
":"             {return COLON;}
"//"            {return COMMENT;}
"^"             {return POW;}
"sqrt"          {return SQRT;}
{alphabets}[a-zA-Z0-9]* {
	strcpy(yylval.name,yytext);
    return VAR_ID;}

{digits}+ {
   yylval.int_val = atoi(yytext); 
   return INT_VAL;}

{digits}+[.]{digits}+ {
    yylval.flt_val = atof(yytext); 
   return FLT_VAL;}

["].*["] {
    yytext++;int l=strlen(yytext);
    strcpy(yylval.string,yytext);
    yylval.string[l-1]='\0';
    return STRING;}
. {
    showError();
    return UNKNOWN;}

%%
void showError()
{
    printf("Unknown Input\n");
}
