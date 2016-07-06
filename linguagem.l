%{
#include "tokens.h"
	int nline = 1;
	int relop_att;
%}
%%
"@"[a-zA-Z]+"_"?[a-zA-Z0-9]* 										return VAR;
[\n] 																						{nline++;	return ENDL;}
"<="																						return OUT;
"=>" 																						return IN;
[\s\S]*																					return STRING;
[0-9][0-9]*  																		return NUMBER;
[a-zA-Z0-9]+","[a-zA-Z0-9]+  										return NUMBERFL;
"+"  																						return SOMA;
"-"  																						return MENOS;
"/"  																						return DIV;
"*"  																						return MULT;
"[" 																						return OC;
"]" 																						return CC;
"("  																						return OP;
")"  																						return CP;
"<" 																						{relop_att = LT; return RELOP;}
"<==" 																					{relop_att = LE; return RELOP;}
"===" 																					{relop_att = EQ; return RELOP;}
"<>" 																						{relop_att = NE; return RELOP;}
">" 																						{relop_att = GT; return RELOP;}
">==" 																					{relop_att = GE; return RELOP;}
[ \t] 																					;
. 																							printf("caracter inesperado na linha %d\n",nline);
%%

int yywrap(void) {
    return 1;
}
