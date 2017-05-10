.PHONY : dummy

all : dummy
	yacc -dv cal.y
	lex cal.l
	gcc -o cal lex.yy.c y.tab.c

clean : dummy
	rm -rf lex.yy.c cal y.output y.tab.c y.tab.h

