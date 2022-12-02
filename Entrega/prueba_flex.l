%{
    #include <stdlib.h>
    #include "parser.tab.h"
%}

/* SECCION: TOKENS */
LETRA [A-Za-z]
GUION [_]
DIGITO [0-9]
PUNTO [.]
SOY [soy]
IDENTIFICADOR {SOY}({LETRA}|{GUION})+
ENTERO {DIGITO}+
DECIMAL {DIGITO}+{PUNTO}{DIGITO}+
OPERADOR [+|-|*|/|^]
CARACTER_PUNTUACION  [UwU]
PALABRA_RESERVADA [ITERAR|DEVOLVER]

%%

"UwU"        {return CIERRE_FUNCION;}  
"("         {return '(';}   
")"         {return ')';} 
":"         {return ':';}    
"="         {return '=';}

"ITERAR"   {return ITERAR;}
"DEVOLVER"  {return DEVOLVER;}
 
"+"     {return '+';}
"-"     {return '-';}
"^"     {return '^';}
"*"     {return '*';}
"/"     {return '/';}

{IDENTIFICADOR}  {return IDENTIFICADOR;}
{ENTERO} {printf("Entero %s\n", yytext);} {return ENTERO;}
{DECIMAL} {printf("Decimal %s\n", yytext);} {return DECIMAL;}

\0 {printf("Whitespace\n"); }



%%
