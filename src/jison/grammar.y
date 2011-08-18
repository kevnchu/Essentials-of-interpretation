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
        { $$ = eval("Number(" + $4 + ") " + $2 + " Number(" + $6 + ")"); }
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