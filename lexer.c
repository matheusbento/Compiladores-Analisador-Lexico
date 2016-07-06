#include <stdio.h>
#include <stdlib.h>
#include "tokens.h"
#include "lex.yy.c"

int main()
{
	int ntoken;
   char* d = (char*) malloc(2);
	ntoken = yylex();
	while(ntoken) {
		switch(ntoken){
			case RELOP:
            switch (relop_att) {
               case LT: d = "LT"; break;
               case LE: d = "LE"; break;
               case EQ: d = "EQ"; break;
               case NE: d = "NE"; break;
               case GT: d = "GT"; break;
               case GE: d = "GE"; break;
            }
				printf("<RELOP,%s>", d );
				break;
			case OC:
				printf("<OPEN_C>");
				break;
			case CC:
				printf("<CLOSE_C>");
				break;
			case NUMBER:
				printf("<NUMBER,%s>", yytext);
				break;
			case VAR:
				printf("<VAR,%s>", yytext);
				break;
    	case OP:
   			printf("<OP>");
   			break;
			case CP:
	   		printf("<CP>");
	   		break;
      case ENDL:
        printf("<FINAL>");
      	break;
			case OUT:
				printf("<SAIDA>");
				break;
			case IN:
				printf("<IN>");
				break;
			case STRING:
				printf("<STRING,%s>", yytext);
				break;
			case NUMBERFL:
				printf("<NUMBERFL,%s>", yytext);
				break;
			case SOMA:
				printf("<SOMA>");
				break;
			case MENOS:
				printf("<MENOS>");
				break;
			case DIV:
				printf("<DIV>");
				break;
			case MULT:
				printf("<MULT>");
				break;

		}
      printf("\n");
		ntoken = yylex();
	}
	printf("\n EOF - Lines: %d\n", nline);
	return 0;
}
