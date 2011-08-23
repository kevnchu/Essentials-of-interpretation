%start Program

%%

Program
    : Expression
        { console.log($1, '=', eval($1)); }
    ;

/* 
 * Expression is recursive rule that match next sequence for example: [+, 1, 2]
 * LSB, OPERATOR, COMMA, RSB — tokens that defines in lexer.l file
 * "1, 2" corresponds to Arguments rule. This rule is also recursive
 * but it contains two components for matching if first not suitable then second try to match.
 * After "1, 2" was found it will matched as first component of Arguments rule. Since
 * Arguments rule recursive "1" will be matched as Argument — second component 
 * of Arguments rule and so on.
 *
 * Every component can have actions and it contains general javascript code.
 * In code we can refer to values of the components mathced by rule with
 * the construct $[name_of_component_part]. In $$ variable we store result of the
 * component action.
 */
Expression
    : LSB OPERATOR COMMA Arguments RSB
        { $$ = $Arguments.join($OPERATOR); }
    ;

Arguments
    : Arguments COMMA Argument
        { $Arguments.push($Argument); $$ = $Arguments; }
    | Argument
        { $$ = [$Argument] }
    ;

Argument
    : Literal
    | Expression
    ;

Literal
    : Number
    ;

Number
    : INT
        { $$ = Number($1) }
    ;