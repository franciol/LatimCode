project: LatimCodeFlex.l LatimCodeBison.y
	bison -d LatimCodeBison.y
	flex LatimCodeFlex.l
	gcc -o LatimCodeParser LatimCodeBison.tab.c lex.yy.c -lfl
clean:
	rm LatimCodeBison.tab.c lex.yy.c LatimCodeBison.tab.h LatimCodeParser