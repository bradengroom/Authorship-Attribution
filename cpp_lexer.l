%option noyywrap

%{

	#include <stdio.h>

	static void comment();

%}

keyword	alignas|and|and_eq|asm|auto|bitand|bitor|bool|break|case|catch|char|char16_t|char32_t|class|compl|const|const_cast|continue|default|delete|do|double|dynamic_cast|else|enum|explicit|export|extern|false|float|for|friend|goto|if|inline|int|long|mutable|namespace|new|not|not_eq|operator|or|or_eq|private|protected|public|register|reinterpret_cast|return|short|signed|sizeof|static|static_cast|struct|switch|template|this|throw|true|try|typedef|typeid|typename|union|unsigned|using|virtual|void|volatile|wchar_t|while|xor|xor_eq|final|override

whitespace	[ \n\t\r]+

string	\"(\\.|[^"])*\"

char	\'(\\.|[^'])\'

other	!|@|"#"|\$|%|\^|&|\*|\(|\)|-|\+|=|~|`|\{|\}|\||\[|]|\\|:|;|<|>|\?|,|\.|\/

%%

"/*"				{ comment(); }
\/\/[^\n]*\n			{ printf("//\n"); }
{string}			{ printf("\"\""); }
{char}				{ printf("\'\'"); }
{whitespace}			{ printf("%s", yytext); }
{keyword}/[^_a-zA-Z]		{ printf("%s", yytext); }
{other} 			{ printf("%s", yytext); }
.

%%

//credit: http://www.quut.com/c/ANSI-C-grammar-l.html
static void comment()
{
	int c;

	while ((c = input()) != 0)
	{
		if (c == '*')
		{
			while ((c = input()) == '*');

			if (c == '/')
			{
				printf("/**/");
				return;
			}

			if (c == 0)
			{
				break;
			}
		}
	}
}

print_token()
{
	
}

main()
{
	yylex();
}
