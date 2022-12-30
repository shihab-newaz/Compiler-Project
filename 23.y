%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<math.h>
	#include <string.h>
	char nameArray[10000][10000];
	int yyerror(char* s);
	int dataArray[10000];
	int index1=1,flag,case_val;
	int isDeclared(char *this);
	int insert(char *this);
	int getValue(char *this);
	int assignValue(char *this,int value);
%}


%union{
	char name[10000];
	char string[10000];
	int int_val;
	float flt_val;
}
%token<int_val>INT_VAL
%token<flt_val>FLT_VAL
%token<string>STRING
%type<int_val>expression
%type<int_val>statement
%type<int_val>OP
%type<int_val>NUM
%type<int_val>caseDefinition
%token<name>VAR_ID
%token IF ADD SUB MUL DIV MOD ELSE ELIF INTEGER FLOAT CHARACTER PRINT SCAN ASSIGN NOT COMMA ENDLINE P_START P_END F_START F_END BREAK COLON ADD_ONE SUB_ONE
%token MAIN SWITCH CASE DEFAULT RETURN WHILE FOR LESS_EQ GREATER_EQ LESS GREATER EQ N_EQ AND OR UNKNOWN QUOTATION SEMICOLON SIN TAN COS POW SQRT COMMENT
%nonassoc IF
%nonassoc ELIF
%nonassoc ELSE
%left SIN COS TAN LOG LN
%left AND OR NOT
%left LESS LESS_EQ GREATER GREATER_EQ 
%left EQ N_EQ
%left ADD SUB
%left MUL DIV MOD
%right ADD_ONE SUB_ONE
// Grammar rules and actions 

%%

program: MAIN P_START P_END F_START lines F_END {printf("Main function END\n");}

	 ;

lines: /* NULL */ {}	

	| lines statement {printf("END OF STATEMENT\n");}	

	;

statement	: ENDLINE								{printf("\n");}	
				| declaration ENDLINE  				{printf("END OF DECLARATION\n");} 
			   	| expression ENDLINE 				{printf("\n"); 
													$$=$1;}
				| VAR_ID ASSIGN expression ENDLINE	{
						
						if(isDeclared($1) != 0 ){
								assignValue($1,$3);
								$$=$3;
							}
							else{
								printf("Variable not declared\n");
							}	
							}
				|PRINT LESS QUOTATION expression QUOTATION GREATER ENDLINE {printf("The Expression is printed as: %d\n",$4);}
				|PRINT LESS STRING GREATER ENDLINE {printf("The String is printed as: %s\n",$3);}
				
	| IF P_START expression P_END F_START statement F_END  {
								if($3){
									printf("\nvalue of expression in IF: %d\n",$6);
								}
								else{
									printf("\ncondition value zero in IF block\n");
								}
							
							}

	| IF P_START expression P_END F_START statement  F_END ELSE F_START statement F_END  {
								if($3){
									printf("value of expression in IF: %d\n",$6);
								}
								else{
									printf("value of expression in ELSE: %d\n",$10);
								}
								
							}
	| IF P_START expression P_END F_START statement  F_END ELIF P_START expression P_END F_START statement F_END ELSE P_START P_END F_START statement F_END {
									if($3){
									printf("value of expression in IF: %d\n",$6);
								}
								else if($10){
									printf("value of expression in ELSE: %d\n",$13);
								}
								else{
									printf("value of expression in ELSE: %d\n",$19);
								}
								
	}

	|COMMENT 					{printf("comment\n");}
    | WHILE P_START expression P_END F_START statement F_END {
	                               if($3)
								   {
									printf("Inside while loop\n");
								   }
	                                
	                                								
				               }


	| FOR P_START VAR_ID ASSIGN INT_VAL SEMICOLON VAR_ID LESS_EQ INT_VAL SEMICOLON VAR_ID ASSIGN VAR_ID OP INT_VAL P_END F_START statement F_END {
	                               printf("Loop execution\n");     
								   assignValue($3,$5);
								   int i;
								   if($14==1){
								   for(i=$5;i<=$9;i=i+$15)  
								   printf("Value of current index is %d\n",i); } 
								  
								  else if($14==3){
								   for(i=$5;i<=$9;i=i*$15)  
								   printf("Value of current index is %d\n",i); }  
								   
								  else if($14==5){
								   for(i=$5;i<=$9;i=i%$15)  
								   printf("Value of current index is %d\n",i); }      
}
	| FOR P_START VAR_ID ASSIGN INT_VAL SEMICOLON VAR_ID GREATER_EQ INT_VAL SEMICOLON VAR_ID ASSIGN VAR_ID OP INT_VAL P_END F_START statement F_END {
	                               printf("Loop execution\n");     
								   assignValue($3,$5);
								   int i;
									if($14==2){
								   for(i=$5;i>=$9;i=i-$15)  
								   printf("Value of current index is %d\n",i); }   
								  else if($14==4){
								   for(i=$5;i>=$9;i=i/$15)  
								   printf("Value of current index is %d\n",i); }  
								  else if($14==5){
								   for(i=$5;i>=$9;i=i%$15)  
								   printf("Value of current index is %d\n",i); }      
	}
	| SWITCH P_START NUM P_END F_START CASES F_END{
		printf("\nSwitch case is declared\n");
	}
	;

NUM:INT_VAL{flag = 0;case_val = $1;}
	;

CASES:
	  switch_case
	| switch_case default_case
	;

switch_case:
	| switch_case caseDefinition
	;

caseDefinition: CASE INT_VAL COLON expression ENDLINE BREAK ENDLINE{
							if( case_val == $2){
								printf("\nMatched for Case: %d\n",$2);
								flag = 1;
							}
	}
	;
default_case: DEFAULT COLON expression ENDLINE{
							if(flag == 0){
								printf("\nIn default segement\n");
							}
}	
	;
OP:	ADD{$$=1;}|SUB{$$=2;}|MUL{$$=3;}|DIV{$$=4;}|MOD{$$=5;}
;

;
declaration :	TYPE ID  {printf("\n");}
            ;


TYPE : INTEGER   		{printf("integer declaration\n");}
     | FLOAT 			{printf("float declaration\n");}
     | CHARACTER   		{printf("character declaration\n");}
     ;



ID : ID COMMA VAR_ID {
	int res = insert($3);
		if(res == 0){
			printf("Compilation Error :: VAR_ID already declared\n");
			exit(-1);
		}
	} 
    |VAR_ID {
		int res = insert($1);
		if(res == 0){
			printf("Compilation Error :: VAR_ID already declared\n");
			exit(-1);
		}
	}  
    ;

expression: INT_VAL					{  $$ = $1;  }
			| VAR_ID						{ $$ = getValue($1); }
			| expression ADD expression		{printf("Addition of:%d+%d = %d \n",$1,$3,$1+$3 );  $$ = $1 + $3;}
			| expression SUB expression		{printf("Subtraction of:%d-%d=%d \n ",$1,$3,$1-$3); $$ = $1 - $3; }
			| expression MUL expression		{printf("Multiplication of:%d*%d=%d \n ",$1,$3,$1*$3); $$ = $1 * $3; }
			| expression DIV expression		{ if($3){
				     					printf("Division of:%d/%d=%d \n ",$1,$3,$1/$3);
				     					$$ = $1 / $3;
				     					
				  					}
				  					else{
										$$ = 0;
										printf("division by zero is undefined\n");
				  					} 	
				    				}
	        | expression MOD expression		{ if($3){
				     					printf("Mod :%d and %d is %d \n",$1,$3,$1 % $3);
				     					$$ = $1 % $3;
				     					
				  					}
				  					else{
										$$ = 0;
										printf("MOD by zero\n");
				  					} 	
				    				}

			| expression LESS expression		{printf("Less Than :%d < %d \n",$1,$3,$1 < $3); $$ = $1 < $3 ; }
			| expression LESS_EQ expression		{printf("Less Than Or Equal :%d <= %d \n",$1,$3); $$ = $1 <= $3 ; }
			| expression GREATER expression		{printf("Greater than :%d > %d \n ",$1,$3); $$ = $1 <= $3; }
			| expression GREATER_EQ expression	{printf("Greater than or equal :%d >= %d \n ",$1,$3); $$ = $1 >= $3; }
			| expression EQ expression			{printf("Equal :%d == %d \n ",$1,$3); $$ = $1 == $3; }
			| expression N_EQ expression		{printf("Not Equal :%d != %d \n ",$1,$3); $$ = $1 != $3; }
			| expression AND expression			{printf("Bitwise And :%d & %d is %d\n ",$1,$3,$1&$3); $$ = $1 & $3; }
			| expression OR expression			{printf("Bitwise Or  :%d | %d is %d\n ",$1,$3,$1|$3); $$ = $1 | $3; }
			| NOT expression					{printf("Bitwise not :!%d is %d\n ",$2,!$2); $$ = !$2; }
			| SIN expression 					{printf("\nValue of Sin(%d) is : %lf\n",$2,sin($2*3.1416/180)); $$=sin($2*3.1416/180);}
			| COS expression 					{printf("\nValue of Cos(%d) is : %lf\n",$2,cos($2*3.1416/180)); $$=cos($2*3.1416/180);}
			| TAN expression 					{printf("\nValue of Tan(%d) is : %lf\n",$2,tan($2*3.1416/180)); $$=tan($2*3.1416/180);}
			| LOG expression 					{printf("Value of Log base 10(%d) is %lf\n",$2,(log($2*1.0)/log(10.0))); $$=(log($2*1.0)/log(10.0));}
			| LN expression 					{printf("Value of Log base e(%d) is %lf\n",$2,(log($2))); $$=(log($2));}
			| expression POW expression 		{int x = pow($1, $3);	printf("Power of: %d^%d is: %d\n", $1, $3, x); $$ = pow($1, $3);}
			|ADD_ONE expression					{printf("value is incremented from %d to %d\n",$2,$2+1);$$=$2+1;}
			|SUB_ONE expression					{printf("value is decremented from %d to %d\n",$2,$2-1);$$=$2-1;}
			|SQRT expression					{printf("square root of %d is  %lf \n",$2,sqrt($2));$$=sqrt($2);}

	;

%%


int yyerror(char *s)
{
    printf("Syntax error  \n",s);
    return 0;
}

int isDeclared(char *this){
		for(int i=1;i<index1;i++){
			if(strcmp(nameArray[i],this)==0){
				return i; 
			}
		}
		return 0;
	}

int insert(char *this){
		if(isDeclared(this)!=0)return 0;
		strcpy(nameArray[index1],this);
		dataArray[index1]=0;
		index1++;
	}

int getValue(char *this){
		return dataArray[isDeclared(this)];
	}

int assignValue(char *this,int value){
		int id = isDeclared(this);
		dataArray[id] = value;
	}

int main()
{
	freopen("input.txt","r",stdin);
	freopen("output.txt","w",stdout);
	yyparse();
	return 0;
}
