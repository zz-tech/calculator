%{
   #include "stdio.h"
   #include "stdlib.h"
   int num_num=0, num_id=0, num_space=0, num_other=0;
%}
INTEGER [-+]?[1-9][0-9]*
ID [a-zA-Z][a-zA-Z_0-9]*
SPACE [ \n\t]
%%
{INTEGER} { num_num++;
  printf("(num: %d)\n", atoi(yytext));
}

{ID} { num_id++;
    printf("(id: %s)\n", yytext);
}

{SPACE} {
}

. { num_other++;
  printf("(other: %s)\n", yytext);
} 
%%

int main(void)
{
   yylex();
   printf("num=%d, id=%d, other=%d\n", num_num, num_id, num_other);

   return 0;
}

int yywrap()
{
    return 1;
}
