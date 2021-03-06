/*
 [The "BSD license"]
 Copyright (c) 2009 Terence Parr
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.
 3. The name of the author may not be used to endorse or promote products
    derived from this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
grammar Group;

options {
	language=ObjC;
}

/*
@header {
package org.stringtemplate.v4.compiler;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import org.stringtemplate.v4.misc.*;
import org.stringtemplate.v4.*;
import java.io.File;
}

@lexer::header {
package org.stringtemplate.v4.compiler;
import org.stringtemplate.v4.*;
import org.stringtemplate.v4.misc.*;
import java.io.File;
}
*/

@memVars {
STGroup *group;
}

@members {
- (void) displayRecognitionError:(NSMutableArray *) tokenNames e:(ANTLRRecognitionException *)e
{
    NSString *msg = [self getErrorMessage:e tokenNames];
    [group.errMgr groupSyntaxError:ErrorType.SYNTAX_ERROR srcName:getSourceName e:e msg:msg];
}

- (NSString *) getSourceName
{
    NSString *fullFileName = [super getSourceName];
    NSFileWrapper *f = [[NSFileWrapper alloc] initWithURL:fullFileName]; // strip to simple name
    return [f filename];
}

- (void) error:(NSString *)msg
{
    ANTLRNoViableAltException e = [ANTLRNoViableAltException newANTLRNoViableAltException:@"" start:0 stop:0 input:input];
    [group.errMgr groupSyntaxError:ErrorType.SYNTAX_ERROR srcName:getSourceName e:e msg:msg];
    recover(input, null);
}
}

@lexer::members {
STGroup *group;

- (void) reportError:(ANTLRRecognitionException *)e
{
    NSString *msg = nil;
    if ( [e isKindOfClass:ANTLRNoViableAltException] ) {
        msg = [[NSString stringWithFormat:@"invalid character '\%c'"], [input LA:1]];
    }
    else if ( [e isKindOfClass:ANTLRMismatchedTokenException] && ((ANTLRMismatchedTokenException *)e).expecting=='"' ) {
        msg = @"unterminated string";
    }
    else {
        msg = [self getErrorMessage:e, getTokenNames];
    }
    [group.errMgr groupSyntaxError:ErrorType.SYNTAX_ERROR srcName:getSourceName e:e msg:msg];
}

- (NSString *) getSourceName
{
    NSString *fullFileName = [super getSourceName];
    NSFileWrapper *f = [NSFileWrapper newNSFileWrapper:fullFileName]; // strip to simple name
    return [f filename];
}
}

group[STGroup *group, NSString *prefix]
@init {
GroupLexer lexer = (GroupLexer)[input getTokenSource];
self.group = lexer.group = $group;
}
	:	(	'import' STRING {[group importTemplates:$STRING];}
	|	'import' // common error: name not in string
			{
			ANTLRMismatchedTokenException *e = [ANTLRMismatchedTokenException newANTLRMismatchedTokenException:STRING stream:input];
			reportError(e);
			}
			ID ('.' ID)* // might be a.b.c.d
		)*
        def[prefix]+
    ;
    
groupName returns [String name]
@init {StringBuilder 8buf = [StringBuilder newStringBuilder];}
	:	a=ID {buf.appendString:$a.text];} ('.' a=ID {buf.appendString:$a.text];})*
	;

/** Match template and dictionary defs outside of (...)+ loop in group.
 *  The key is catching while still in the loop; must keep prediction of
 *  elements separate from "stay in loop" prediction.
 */
def[String prefix] : templateDef[prefix] | dictDef ;
	catch[RecognitionException *re] {
		// pretend we already saw an error here
		state.lastErrorIndex = input.index();
		error([NSString stringWithFormat:@"garbled template definition starting at '\%@", [[input LT:1] getText]]);
	}

templateDef[String prefix]
@init {
    String template=null;
    int n=0; // num char to strip from left, right of template def
}
	:	(	'@' enclosing=ID '.' name=ID '(' ')'
		|	name=ID '(' formalArgs ')'
		)
	    '::='
	    {ANTLRCommonToken *templateToken = [input LT:1];}
	    (	STRING     {template=$STRING.text; n=1;}
	    |	BIGSTRING  {template=$BIGSTRING.text; n=2;}
	    |	{
	    	template = @"";
	    	NSString *msg = [NSString stringWithFormat:@"missing template at '\%@'", [[input LT:1] getText]];
            ANTLRNoViableAltException *e = [ANTLRNoViableAltException newANTLRNoViableAltException:@"" start:0 stop:0 input:input];
    	    [group.errMgr groupSyntaxError:ErrorType.SYNTAX_ERROR srcName:getSourceName e:e msg:msg];
    	    }
	    )
	    {
        template = Misc.strip(template, n);
        NSString *templateName = $name.text;
        if ( [prefix length] > 0 ) templateName = [NSString stringWithFormat: @"\%@/\%@", prefix, $name.text];
	    [group defineTemplateOrRegion:templateName text:$enclosing.text token:templateToken,
	    							 template:template s:$name arg2:$formalArgs.args];
	    }
	|   alias=ID '::=' target=ID  {[group defineTemplateAlias:$alias text:$target];}
	;

formalArgs returns[List<FormalArgument> args]
@init {$args = new ArrayList<FormalArgument>();}
    :	formalArg[$args]
    	( ',' formalArg[$args] )*
    	( ',' formalArgWithDefaultValue[$args] )*
    |	formalArgWithDefaultValue[$args] ( ',' formalArgWithDefaultValue[$args] )*
    |
	;

formalArg[List<FormalArgument> args]
	:	ID
		{[$args add:[FormalArgument newFormalArgument:$ID.text]];}
    ;

formalArgWithDefaultValue[List<FormalArgument> args]
	:	ID
		(	'=' a=STRING
		|	'=' a=ANONYMOUS_TEMPLATE
		)
		{[$args add:[FormalArgument newFormalArgument:$ID.text arg:$a]];}
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
	:	ID '::=' dict
        {
        if ( [group rawGetDictionary:$ID.text] != nil ) {
			[group.errMgr compileTimeError:ErrorType.MAP_REDEFINITION templateToken:null t:$ID];
        }
        else if ( [group rawGetTemplate:$ID.text] != nil ) {
			[group.errMgr compileTimeError:ErrorType.TEMPLATE_REDEFINITION_AS_MAP templateToken:null t:$ID];
        }
        else {
            [group defineDictionary:$ID.text mapping:$dict.mapping];
        }
        }
	;

dict returns [Map<String,Object> mapping]
@init {mapping=[ANTLRHashMap newANTLRHashMap<String,Object>];}
	:   '[' dictPairs[mapping] ']'
	;

dictPairs[Map<String,Object> mapping]
    :	keyValuePair[mapping]
    	(',' keyValuePair[mapping])* (',' defaultValuePair[mapping])?
    |	defaultValuePair[mapping]
    ;
 	catch[RecognitionException re] {
		error([NSString stringWithFormat:@"missing dictionary entry at '\%@'", [[input LT:1] getText]];
	}

defaultValuePair[Map<String,Object> mapping]
	:	'default' ':' keyValue {[mapping setObject:$keyValue.value forKey:STGroup.DEFAULT_KEY];}
	;

keyValuePair[Map<String,Object> mapping]
	:	STRING ':' keyValue {[mapping setObject:$keyValue.value forKey:[Misc replaceEscapes:[Misc strip:$STRING.text n:]]];}
	;

keyValue returns [Object value]
	:	BIGSTRING			{$value = [group createSingleton:$BIGSTRING];}
	|	ANONYMOUS_TEMPLATE	{$value = [group createSingleton:$ANONYMOUS_TEMPLATE];}
	|	STRING				{$value = [Misc replaceEscapes:[Misc strip:$STRING.text n:1]];}
	|	{[[[input LT:1] getText] isEqualToString:@"key"]}?=> ID
							{$value = STGroup.DICT_KEY;}
	;
 	catch[ANTLRRecognitionException *re] {
		error([NSString stringWithFormat:@"missing value for key at '\%@'", [[input LT:1] getText]]);
	}

ID	:	('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'-'|'_')*
	;

STRING
	:	'"'
		(	'\\' '"'
		|	'\\' ~'"'
		|	{
			NSString *msg = @"\\n in string";
    		ANTLRNoViableAltException *e = [ANTLRNoViableAltException newANTLRNoViableAltException:@"", 0, 0, input);
			[group.errMgr groupLexerError:ErrorType.SYNTAX_ERROR srcName:getSourceName e:e msg:msg];
			}
			'\n'
		|	~('\\'|'"'|'\n')
		)*
		'"'
	;

BIGSTRING
	:	'<<'
		(	options {greedy=false;}
		:	'\\' '>'  // \> escape
		|	'\\' ~'>'
		|	~'\\'
		)*
        '>>'
        {
        NSString *txt = [[self getText] stringByReplacingOccurrencesOfString:@"\\\\>" withString:@">"];
		[self setText:txt];
		}
	;

ANONYMOUS_TEMPLATE
    :	'{'
    	{
		ANTLRCommonToken *templateToken = [ANTLRCommonToken newANTLRCommonToken:input
		                                                               template:ANONYMOUS_TEMPLATE
		                                                                  ttype:0
		                                                                  start:getCharIndex
		                                                                   stop:getCharIndex];
		STLexer *lexer =
			[STLexer newSTLexer:group.errMgr
			              input:input
			           template:templateToken
			 delimiterStartChar:group.delimiterStartChar
			  delimiterStopChar:group.delimiterStopChar];
		[lexer setSubtemplateDepth:1];
		ANTLRCommonToken *t = [lexer nextToken];
		while ( [lexer subtemplateDepth] >= 1 || [t getType] != STLexer.RCURLY ) {
			if ( [t getType] == STLexer.EOF_TYPE ) {
            	ANTLRMismatchedTokenException *e = [ANTLRMismatchedTokenException newANTLRMismatchedTokenException:'}' stream:input];
				NSString *msg = @"missing final '}' in {...} anonymous template";
    			[group.errMgr groupLexerError:ErrorType.SYNTAX_ERROR srcName:getSourceName e:e msg:msg];
				break;
			}
			t = [lexer nextToken];
		}
		}
    	// don't match '}' here; our little {...} scanner loop matches it
    	// to terminate.
    ;

COMMENT
    :   '/*' ( options {greedy=false;} : . )* '*/' { [self skip]; }
    ;

LINE_COMMENT
    :	'//' ~('\n'|'\r')* '\r'? '\n' { [self skip]; }
    ;

WS  :	(' '|'\r'|'\t'|'\n') { [self skip]; }
	;
