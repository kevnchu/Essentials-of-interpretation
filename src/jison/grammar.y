%start Program

%%

Program
    : Expressions
        { console.log($1) }
    ;

Expressions
    : Expression
    ;

Expression
    : LSB Operator COMMA Expression COMMA Expression RSB
        { $$ = eval("Number(" + $Expression1 + ") " + $Operator + " Number(" + $Expression2 + ")"); }
    | Literal
    ;

Operator
    : '+'
    | '-'
    | '*'
    | '/'
    ;

Literal
    : Number
    ;

Number
    : INT
        { $$ = Number($1) }
    ;