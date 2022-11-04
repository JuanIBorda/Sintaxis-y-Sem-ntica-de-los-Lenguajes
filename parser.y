%{


%union{
    char* cadena;
    int entero;
    char caracter;
}

%token <cadena> ID
%token <cadena> TIPO_DE_DATO
%token <char> LETRA
%token <entero> DIGITO
%token BOLD ITALIC FIN INICIO SOY FIN_IDENTIFICADOR F
%token GUION
%token OP_SUMA
%token OP_RESTA
%token IGUAL
 
// ------------GRAMATICA DE LAS EXPRESIONES------------
 
 
 
%start instrucciones
 
%% 
 
instrucciones: instruccion 
        | instruccion 
     
instruccion: identificador expresion F
 
identificador: SOY nombre FIN_IDENTIFICADOR
              
nombre: 
	| LETRA nombre
	| DIGITO nombre
	| GUION nombre
 
expresion: termino 
		| expresion OP_SUMA termino
		| expresion OP_RESTA termino
 
asignacion: identificador IGUAL expresion 
 
termino: DIGITO 
	  | LETRA 
 
sentencia: sentencia
		| identificador IGUAL expresion F
		| BOLD listaIdentificador F
		| ITALIC listaIdentificador F
 
listaIdentificador: identificador
			   | identificador
 
 
 
%%
 
%%
int main()
{
    yyin = fopen("archivoDeEjemplo.c","r");
    yyparse();
    fclose(yyin);
    if (analisisCorrecto)
        printf("Finalizo correctamente :D");
    return 0;
}
int yyerror(){
    printf("\nError Sintactico: Linea %d \n", yylineno);
    analisisCorrecto = 0;
    return 0;
}
%%
}%
