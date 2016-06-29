%{
	int nline;

%}
%%
"@"[a-zA-Z]+"_"?[a-zA-Z0-9]* printf("Variavel");
[\n] {nline++;printf("\nFinal\n");}
"<="	printf("Imprimina tela");
"=>" printf("Entrada de variavel");
"String("[a-zA-Z][_a-zA-Z]*")" printf("String");
[0-9][0-9]* printf("Numero");
[a-zA-Z0-9]+","[a-zA-Z0-9]+ printf("Numero com ponto flutuante");
"+" printf("soma");
"-" printf("subtração");
"/" printf("divisao");
"*" printf("multiplicação");
"[""@"[a-zA-Z]+"_"?[a-zA-Z0-9]*[<|>|<=|>=|!=|==]"@"[a-zA-Z]+"_"?[a-zA-Z0-9]*"]" printf("Se....");
"(" printf("Começo parentese");
")" printf("Fim parentese");
%%

int main() {
    yylex();
		printf("Linha %d", nline);
    return 0;
}
