/*
 * [The "BSD license"]
 *  Copyright (c) 2011 Terence Parr and Alan Condit
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *  1. Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *  2. Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *  3. The name of the author may not be used to endorse or promote products
 *     derived from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 *  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 *  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 *  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
grammar Group;

options {
    language=ObjC;
    tokenVocab=Group1;
}

// tokens { ID; WS; STRING; ANONYMOUS_TEMPLATE; COMMENT; LINE_COMMENT; BIGSTRING; BIGSTRING_NO_NL;
//    T_FALSE='false'; T_TRUE='true'; LBRACK='['; RBRACK=']'; LPAREN='('; RPAREN=')';
//    }

@header {
/*
 * [The "BSD license"]
 *  Copyright (c) 2011 Terence Parr and Alan Condit
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *  1. Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *  2. Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *  3. The name of the author may not be used to endorse or promote products
 *     derived from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 *  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 *  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 *  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import "STGroup.h"
#import "ErrorType.h"
#import "STLexer.h"
#import "Misc.h"
#import "GroupLexer.h"
#import "FormalArgument.h"
}

@lexer::header {
/*
 * [The "BSD license"]
 *  Copyright (c) 2011 Terence Parr and Alan Condit
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *  1. Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *  2. Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *  3. The name of the author may not be used to endorse or promote products
 *     derived from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 *  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 *  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 *  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import <ANTLR/ANTLR.h>
#import "STGroup.h"
#import "ErrorType.h"
#import "STLexer.h"

@class STGroup;
}

@memVars {
__strong STGroup *group;
}

@properties {
@property (retain) STGroup *group;
}

@methodsDecl {
+ (void) initialize;
+ (NSInteger) TANONYMOUS_TEMPLATE;
+ (NSInteger) TBIGSTRING;
+ (NSInteger) TBIGSTRING_NO_NL;
+ (NSInteger) TID;
+ (NSInteger) TFALSE;
+ (NSInteger) TTRUE;
+ (NSInteger) TLBRACK;
+ (NSInteger) TRBRACK;

- (void) dealloc;
- (void) displayRecognitionError:(AMutableArray *)tokenNames Exception:(RecognitionException *)e;
- (NSString *) getSourceName;
- (void) error:(NSString *)msg;
// - (NSString *) getErrorMessage:(RecognitionException *)e TokenNames:(AMutableArray *)TokenNames;
}

@synthesize {
@synthesize group;
}

@methods {
static SymbolStack *formalArgs_stack;
static formalArgs_Scope *formalArgs_scope;
+ (NSInteger) TANONYMOUS_TEMPLATE { return ANONYMOUS_TEMPLATE; }
+ (NSInteger) TBIGSTRING { return BIGSTRING; }
+ (NSInteger) TBIGSTRING_NO_NL { return BIGSTRING_NO_NL; }
+ (NSInteger) TID { return ID; }
+ (NSInteger) TFALSE { return T_FALSE; }
+ (NSInteger) TTRUE { return T_TRUE; }
+ (NSInteger) TLBRACK { return LBRACK; }
+ (NSInteger) TRBRACK { return RBRACK; }

- (void) displayRecognitionError:(AMutableArray *) tokenNames Exception:(RecognitionException *)e
{
    NSString *msg = [self getErrorMessage:e TokenNames:[self getTokenNames]];
    [group.errMgr groupSyntaxError:SYNTAX_ERROR srcName:[self getSourceName] e:e msg:msg];
}

- (NSString *) getSourceName
{
#ifdef DONTUSENOMO
    NSError **outError;
    NSString *fullFileName = [super getSourceName];
    NSFileWrapper *f = [[NSFileWrapper alloc] initWithURL:fullFileName options:NSFileWrapperReadingImmediate error:outError]; // strip to simple name
    return [f filename];
#endif
    return [Misc getFileName:[group getFileName]];
}

- (void) error:(NSString *)msg
{
    NoViableAltException *nvae = [NoViableAltException newException:0 state:0 stream:input];
    [group.errMgr groupSyntaxError:SYNTAX_ERROR srcName:[self getSourceName] e:nvae msg:msg];
    [self recover:input Exception:nil];
}

/*
- (NSString *) getErrorMessage:(RecognitionException *)e TokenNames:(AMutableArray *)TokenNames
{
    return [NSString stringWithFormat:@"\%@--\%@", e.name, e.reason];
}
*/

}

@lexer::memVars {
__strong STGroup *group;
}

@lexer::methodsDecl {
@property (retain, getter=getGroup, setter=setGroup:) STGroup *group;

- (id) initWithCharStream:(id<CharStream>)anInput;
- (void) dealloc;
- (void) reportError:(RecognitionException *)e;
- (NSString *) getSourceName;
}

@lexer::methods {
@synthesize group;

- (void) reportError:(RecognitionException *)e
{
    NSString *msg = nil;
    if ( [e isKindOfClass:[NoViableAltException class]] ) {
#pragma error fix formatting
        unichar c = [input LA:1];
        msg = (c == (unichar) EOF) ? @"invalid character '<EOF>'" : [NSString stringWithFormat:@"invalid character 'fC'", c];
    }
    else if ( [e isKindOfClass:[MismatchedTokenException class]] &&
              ((MismatchedTokenException *)e).expectingChar == '"' ) {
        msg = @"unterminated string";
    }
    else {
        msg = [self getErrorMessage:e TokenNames:[self getTokenNames]];
    }
    [group.errMgr groupSyntaxError:SYNTAX_ERROR srcName:[self getSourceName] e:e msg:msg];
}

- (NSString *) getSourceName
{
    return [Misc getFileName:[group getFileName]];
}

}

group[STGroup *aGroup, NSString *prefix]
@init {
GroupLexer *lexer = (GroupLexer *)[input getTokenSource];
self.group = lexer.group = $aGroup;
}
    :   oldStyleHeader?
        delimiters?
        ( 'import' STRING {[aGroup importTemplatesWithFileName:$STRING];}
        | 'import' // common error: name not in string
            {
            MismatchedTokenException *mte = [MismatchedTokenException newException:STRING Stream:input];
            [self reportError:mte];
            }
            ID ('.' ID)* // might be a.b.c.d
        )*
        def[prefix]*
        EOF
    ;

oldStyleHeader // ignore but lets us use this parser in AW for both v3 and v4
    :   'group' ID ( ':' ID )?
        ( 'implements' ID (',' ID)* )?
        ';'
    ;

groupName returns [NSString *name]
@init {NSMutableString *buf = [NSMutableString stringWithCapacity:16];}
    :   a=ID {[buf appendString:$a.text];} ('.' a=ID {[buf appendString:$a.text];})*
    ;

delimiters
    :	'delimiters' a=STRING ',' b=STRING
     	{
     	group.delimiterStartChar=[$a.text characterAtIndex:0];
        group.delimiterStopChar=[$b.text characterAtIndex:0];
        }
    ;

/** Match template and dictionary defs outside of (...)+ loop in group.
 *  The key is catching while still in the loop; must keep prediction of
 *  elements separate from "stay in loop" prediction.
 */
def[NSString *prefix] : templateDef[prefix] | dictDef ;
    catch[RecognitionException *re] {
        // pretend we already saw an error here
        state.lastErrorIndex = input.index;
        [self error:[NSString stringWithFormat:@"garbled template definition starting at '\%@'", [[input LT:1] text]]];
    }

templateDef[NSString *prefix]
@init {
    NSString *template=nil;
    NSInteger n=0; // num char to strip from left, right of template def
}
    :   (   '@' enclosing=ID '.' name=ID LPAREN RPAREN
        |   name=ID LPAREN formalArgs RPAREN
        )
        '::='
        {CommonToken *templateToken = [input LT:1];}
        (   STRING     {template=$STRING.text; n=1;}
        |   BIGSTRING  {template=$BIGSTRING.text; n=2;}
        |   BIGSTRING_NO_NL  {template=$BIGSTRING_NO_NL.text; n=2;}
        |   {
            template = @"";
            NSString *msg = [NSString stringWithFormat:@"missing template at '\%@'", [[input LT:1] text]];
            NoViableAltException *e = [NoViableAltException newException:0 state:0 stream:input];
            [group.errMgr groupSyntaxError:SYNTAX_ERROR srcName:[self getSourceName] e:e msg:msg];
            }
        )
        {
        if ( $name.index >= 0 ) { // if ID missing
            template = [Misc strip:template n:n];
            NSString *templateName = $name.text;
            if ( [prefix length] > 0 ) templateName = [NSString stringWithFormat: @"\%@\%@", prefix, $name.text];
            NSString *enclosingTemplateName = $enclosing.text;
            if ( enclosingTemplateName != nil && ([enclosingTemplateName length] > 0) && ([prefix length] > 0) ) {
                enclosingTemplateName = [NSString stringWithFormat:@"\%@\%@", prefix, enclosingTemplateName];
            }
            [group defineTemplateOrRegion:templateName
            regionSurroundingTemplateName:enclosingTemplateName
                            templateToken:templateToken
                                 template:template
                                nameToken:$name
                                     args:$formalArgs.args];
        }
        }
    |   alias=ID '::=' target=ID  {[group defineTemplateAlias:$alias targetT:$target];}
    ;

formalArgs returns[AMutableArray *args = [AMutableArray arrayWithCapacity:5\]]
scope {
    BOOL hasOptionalParameter;
}
@init { $formalArgs::hasOptionalParameter = NO;}
    :   formalArg[$args] (',' formalArg[$args])*
    |
    ;

formalArg[AMutableArray *args]
    :   ID
        (   '=' a=(STRING|ANONYMOUS_TEMPLATE|T_TRUE|T_FALSE) {$formalArgs::hasOptionalParameter = YES;}
        |   '=' a=LBRACK RBRACK {$formalArgs::hasOptionalParameter = YES;}
        |   {
            if ( $formalArgs::hasOptionalParameter ) {
                [group.errMgr compileTimeError:REQUIRED_PARAMETER_AFTER_OPTIONAL templateToken:nil t:$ID];
            }
            }
        )
        {[$args addObject:[FormalArgument newFormalArgument:$ID.text token:$a]];}
    ;

/*
suffix returns [int cardinality=FormalArgument.REQUIRED]
    :   OPTIONAL
    |   STAR
    |   PLUS
    |
    ;
*/

dictDef
    :   ID '::=' dict
        {
        if ( [group rawGetDictionary:$ID.text] != nil ) {
            [group.errMgr compileTimeError:MAP_REDEFINITION templateToken:nil t:$ID];
        }
        else if ( [group rawGetTemplate:$ID.text] != nil ) {
            [group.errMgr compileTimeError:TEMPLATE_REDEFINITION_AS_MAP templateToken:nil t:$ID];
        }
        else {
            [group defineDictionary:$ID.text mapping:$dict.mapping];
        }
        }
    ;

dict returns [LinkedHashMap *mapping]
@init {mapping=[LinkedHashMap newLinkedHashMap:16];}
    :   LBRACK dictPairs[mapping] RBRACK
    ;

dictPairs[LinkedHashMap *mapping]
    :   keyValuePair[mapping]
        (',' keyValuePair[mapping])* (',' defaultValuePair[mapping])?
    |   defaultValuePair[mapping]
    ;
    catch[RecognitionException *re] {
        [self error:[NSString stringWithFormat:@"missing dictionary entry at '\%@'", [input LT:1].text]];
    }

defaultValuePair[LinkedHashMap *mapping]
    :   'default' ':' keyValue {[mapping put:STGroup.DEFAULT_KEY value:$keyValue.value];}
    ;

keyValuePair[LinkedHashMap *mapping]
    :   STRING ':' keyValue {[mapping put:[Misc replaceEscapes:[Misc strip:$STRING.text n:1]] value:$keyValue.value];}
    ;

keyValue returns [id value]
    :   BIGSTRING           {$value = [group createSingleton:$BIGSTRING];}
    |   BIGSTRING_NO_NL     {$value = [group createSingleton:$BIGSTRING_NO_NL];}
    |   ANONYMOUS_TEMPLATE  {$value = [group createSingleton:$ANONYMOUS_TEMPLATE];}
    |   STRING              {$value = [Misc replaceEscapes:[Misc strip:$STRING.text n:1]];}
    |   T_FALSE             {$value = [ACNumber numberWithBool:NO];}
    |   T_TRUE              {$value = [ACNumber numberWithBool:YES];}
    |   LBRACK RBRACK       {$value = [AMutableDictionary dictionaryWithCapacity:5];} 
    |                       {[[[input LT:1] text] isEqualToString:@"key"]}?=> ID {$value = STGroup.DICT_KEY;}
    ;
    catch[RecognitionException *re] {
        [self error:[NSString stringWithFormat:@"missing value for key at '\%@'", [[input LT:1] text]]];
    }

T_FALSE : 'false' ;

T_TRUE : 'true' ;

LBRACK : '[' ;

RBRACK : ']' ;

LPAREN : '(' ;

RPAREN : ')' ;

ID  :   ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'-'|'_')*
    ;

STRING
    :   '"'
        (   '\\' '"'
        |   '\\' ~'"'
        |   {
            NSString *msg = @"\\n in string";
            NoViableAltException *e = [NoViableAltException newException:0 state:0 stream:input];
            [group.errMgr groupLexerError:SYNTAX_ERROR srcName:[self getSourceName] e:e msg:msg];
            }
            '\n'
        |   ~('\\'|'"'|'\n')
        )*
        '"'
        {
        NSString *txt = [self.text stringByReplacingOccurrencesOfString:@"\\\\\"" withString:@"\""];
        [self setText:txt];
        }
    ;

BIGSTRING_NO_NL // same as BIGSTRING but means ignore newlines later
    :   '<%' ( . )* '%>'
        // %\> is the escape to avoid end of string
        {
            NSString *txt = [self.text stringByReplacingOccurrencesOfString:@"\%\\\\>" withString:@"\%>"];
            [self setText:txt];
        }
    ;

/** Match <<...>> but also allow <<..<x>>> so we can have tag on end.
    Escapes: >\> means >> inside of <<...>>.
    Escapes: \>> means >> inside of <<...>> unless at end like <<...\>>>>.
    In that case, use <%..>>%> instead.
 */
BIGSTRING
    :   '<<'
        (   options {greedy=NO;}
        :   '\\' '>'  // \> escape
        |   '\\' ~'>' // allow this but don't collapse in action
        |   ~'\\'
        )*
        '>>'
        {
        NSString *txt = self.text;
        txt = [Misc replaceEscapedRightAngle:txt]; // replace \> with > unless <\\>
        [self setText:txt];
        }
    ;

ANONYMOUS_TEMPLATE
    :   '{'
        {
        CommonToken *templateToken = [CommonToken newToken:input
                                              Type:ANONYMOUS_TEMPLATE
                                           Channel:0
                                             Start:input.index
                                              Stop:input.index];
        STLexer *lexer = [STLexer newSTLexer:group.errMgr
                                       input:input
                               templateToken:templateToken
                          delimiterStartChar:group.delimiterStartChar
                           delimiterStopChar:group.delimiterStopChar];
        [lexer setSubtemplateDepth:1];
        CommonToken *t = [lexer nextToken];
        while ( [lexer subtemplateDepth] >= 1 || t.type != STLexer.RCURLY ) {
            if ( t.type == STLexer.EOF_TYPE ) {
                MismatchedTokenException *mte = [MismatchedTokenException newException:'}' Stream:input];
                NSString *msg = @"missing final '}' in {...} anonymous template";
                [group.errMgr groupLexerError:SYNTAX_ERROR srcName:[self getSourceName] e:mte msg:msg];
                break;
            }
            t = [lexer nextToken];
        }
        }
        // don't match '}' here; our little {...} scanner loop matches it
        // to terminate.
    ;

COMMENT
    :   '/*' ( options {greedy=NO;} : . )* '*/' { [self skip]; }
    ;

LINE_COMMENT
    :   '//' ~('\n'|'\r')* '\r'? '\n' { [self skip]; }
    ;

WS  :   (' '|'\r'|'\t'|'\n') { [self skip]; }
    ;
