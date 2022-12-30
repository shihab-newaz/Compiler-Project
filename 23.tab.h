
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     INT_VAL = 258,
     FLT_VAL = 259,
     STRING = 260,
     VAR_ID = 261,
     IF = 262,
     ADD = 263,
     SUB = 264,
     MUL = 265,
     DIV = 266,
     MOD = 267,
     ELSE = 268,
     ELIF = 269,
     INTEGER = 270,
     FLOAT = 271,
     CHARACTER = 272,
     PRINT = 273,
     SCAN = 274,
     ASSIGN = 275,
     NOT = 276,
     COMMA = 277,
     ENDLINE = 278,
     P_START = 279,
     P_END = 280,
     F_START = 281,
     F_END = 282,
     BREAK = 283,
     COLON = 284,
     ADD_ONE = 285,
     SUB_ONE = 286,
     MAIN = 287,
     SWITCH = 288,
     CASE = 289,
     DEFAULT = 290,
     RETURN = 291,
     WHILE = 292,
     FOR = 293,
     LESS_EQ = 294,
     GREATER_EQ = 295,
     LESS = 296,
     GREATER = 297,
     EQ = 298,
     N_EQ = 299,
     AND = 300,
     OR = 301,
     UNKNOWN = 302,
     QUOTATION = 303,
     SEMICOLON = 304,
     SIN = 305,
     TAN = 306,
     COS = 307,
     POW = 308,
     SQRT = 309,
     COMMENT = 310,
     LN = 311,
     LOG = 312
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 17 "23.y"

	char name[10000];
	char string[10000];
	int int_val;
	float flt_val;



/* Line 1676 of yacc.c  */
#line 118 "23.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


