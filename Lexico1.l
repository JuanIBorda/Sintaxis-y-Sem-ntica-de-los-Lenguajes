%{
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <string.h>
%}

DIGITO [0-9]
LETRA [a-zA-Z]
SOY ["soy"]
FIN ["fin"]
GUIONES [-_]
FIN_DE_SENTENCIA_IDENTIFICADOR ["$"]

IDENTIFICADORES {SOY}({LETRA}|{DIGITO}|{GUIONES})*
CONST_INTEGER (-?[1-9][0-9]{0,6})|0
CONST_BOOL (0|1)
/* -? significa que puede ser o no negativo, luego comienza del 1 al 9 y por ultimo repite de 0 a 4 veces del 0 al 9 */

/* Operadores logicos y operadores aritmeticos basicos */
OP_SUMA ["+"]
OP_RESTA ["-"]
OP_IGUAL ["="]
OP_DISTINTO ["!="]

/* Caracteres de puntuacion */
LLAVE_A  ["{"]
LLAVE_C  ["}"]
PARENTESIS_A ["("]
PARENTESIS_C [")"]
FIN_SETENCIA [F]

/* Palabras reservadas */
WHILE "while"|"WHILE"
IF "if"|"IF"
FOR "for"|"FOR"

/* Lenguaje regular: {SOY(LETRA|DIGITO|GUIONES)^n} / n <= 5}n */
/* Expresion regular: SOY(LETRA|DIGITO|GUIOONES) */