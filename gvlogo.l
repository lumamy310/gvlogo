%{
#include <stdio.h>
#include <stdlib.h>
#include "gvlogo.tab.h"

extern void yyerror(const char* s);
%}

%%

;				{ return SEP; }
penup				{ return PENUP; }
pendown				{ return PENDOWN; }
print				{ return PRINT; }
color				{ return CHANGE_COLOR; }
clear				{ return CLEAR; }
turn				{ return TURN; }
move				{ return MOVE; }
goto				{ return GOTO; }
[0-9]+				{ yylval.f = atoi(yytext); return NUMBER; }
end				{ return END; }
save				{ return SAVE; }
\+				{ return PLUS; }
-				{ return SUB; }
\*				{ return MULT; }
\/				{ return DIV; }
where				{ return WHERE; }
\"[ A-Za-z]+\"			{ yylval.s = yytext; return QSTRING; }
[ A-Za-z.\/]+			{ yylval.s = yytext; return STRING; }
[ \t\r\n]			{ ; }
.			{ yyerror("Lexing Syntax error.\n"); } 

%%
