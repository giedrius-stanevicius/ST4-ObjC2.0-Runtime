// $ANTLR 3.3.1-SNAPSHOT Mar 09, 2011 24:00:43 /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/CodeGenerator.g 2011-04-06 17:32:07

/* =============================================================================
 * Standard antlr3 OBJC runtime definitions
 */
#import <Cocoa/Cocoa.h>
#import <ANTLR/ANTLR.h>
/* End of standard antlr3 runtime definitions
 * =============================================================================
 */

/* treeParserHeaderFile */
/* =============================================================================
 * This is what the grammar programmer asked us to put at the top of every file.
 */

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
#import "STToken.h"
#import "Compiler.h"
#import "CompiledST.h"
#import "CompilationState.h"
#import "ErrorManager.h"
#import "Bytecode.h"
#import "Misc.h"

/* End of Header action.
 * =============================================================================
 */
#ifndef ANTLR3TokenTypeAlreadyDefined
#define ANTLR3TokenTypeAlreadyDefined
typedef enum {
    ANTLR_EOF = -1,
    INVALID,
    EOR,
    DOWN,
    UP,
    MIN
} ANTLR3TokenType;
#endif

#pragma mark Tokens
#ifdef EOF
#undef EOF
#endif
#define EOF -1
#define ID 4
#define WS 5
#define STRING 6
#define ANONYMOUS_TEMPLATE 7
#define COMMENT 8
#define LINE_COMMENT 9
#define BIGSTRING 10
#define BIGSTRING_NO_NL 11
#define T_FALSE 12
#define T_TRUE 13
#define IF 14
#define ELSE 15
#define ELSEIF 16
#define ENDIF 17
#define SUPER 18
#define SEMI 19
#define BANG 20
#define ELLIPSIS 21
#define EQUALS 22
#define COLON 23
#define LPAREN 24
#define RPAREN 25
#define LBRACK 26
#define RBRACK 27
#define COMMA 28
#define DOT 29
#define LCURLY 30
//#define RCURLY 31
#define TEXT 32
//#define LDELIM 33
#define RDELIM 34
#define PIPE 35
#define OR 36
#define AND 37
#define INDENT 38
#define NEWLINE 39
#define AT 40
#define END 41
#define EXPR 42
#define OPTIONS 43
#define PROP 44
#define PROP_IND 45
#define INCLUDE 46
#define INCLUDE_IND 47
#define EXEC_FUNC 48
#define INCLUDE_SUPER 49
#define INCLUDE_SUPER_REGION 50
#define INCLUDE_REGION 51
#define TO_STR 52
#define LIST 53
#define MAP 54
#define ZIP 55
#define SUBTEMPLATE 56
#define ARGS 57
#define ELEMENTS 58
#define REGION 59
#define TNULL 60
#define INDENTED_EXPR 61
#pragma mark Dynamic Global Scopes
#pragma mark Dynamic Rule Scopes
/* start of ruleAttributeScopeInterface */

@interface template_Scope : ANTLRSymbolsScope {
    CompilationState * cstate;

}

/* start properties */

@property (assign, getter=getcstate, setter=setcstate:) CompilationState * cstate;

/* end properties */

+ (template_Scope *)newtemplate_Scope;
- (id) init;
- (CompilationState *)getcstate;
- (void)setcstate:(CompilationState *)aVal;


@end /* end of ruleAttributeScopeInterface */

#pragma mark Rule Return Scopes start
/* returnScopeInterface CodeGenerator_region_return */
@interface CodeGenerator_region_return :ANTLRTreeRuleReturnScope { /* returnScopeInterface line 1838 */
 /* ObjC start of memVars() */
NSString * name;
}
/* start properties */
@property (assign, getter=getname, setter=setname:) NSString * name;

/* end properties */
+ (CodeGenerator_region_return *)newCodeGenerator_region_return;
/* this is start of set and get methods */
  /* methodsDecl */
/* start of iterated get and set functions */

- (NSString *)getname;
- (void)setname:(NSString *)aVal;


/* End of iterated get and set functions */
@end /* end of returnScopeInterface interface */

/* returnScopeInterface CodeGenerator_subtemplate_return */
@interface CodeGenerator_subtemplate_return :ANTLRTreeRuleReturnScope { /* returnScopeInterface line 1838 */
 /* ObjC start of memVars() */
NSString * name;
NSInteger nargs;
}
/* start properties */
@property (assign, getter=getname, setter=setname:) NSString * name;
@property (assign, getter=getnargs, setter=setnargs:) NSInteger nargs;

/* end properties */
+ (CodeGenerator_subtemplate_return *)newCodeGenerator_subtemplate_return;
/* this is start of set and get methods */
  /* methodsDecl */
/* start of iterated get and set functions */

- (NSString *)getname;
- (void)setname:(NSString *)aVal;


- (NSInteger)getnargs;
- (void)setnargs:(NSInteger)aVal;


/* End of iterated get and set functions */
@end /* end of returnScopeInterface interface */

/* returnScopeInterface CodeGenerator_conditional_return */
@interface CodeGenerator_conditional_return :ANTLRTreeRuleReturnScope { /* returnScopeInterface line 1838 */
 /* ObjC start of memVars() */
}
/* start properties */
+ (CodeGenerator_conditional_return *)newCodeGenerator_conditional_return;
/* this is start of set and get methods */
  /* methodsDecl */
@end /* end of returnScopeInterface interface */

/* returnScopeInterface CodeGenerator_primary_return */
@interface CodeGenerator_primary_return :ANTLRTreeRuleReturnScope { /* returnScopeInterface line 1838 */
 /* ObjC start of memVars() */
}
/* start properties */
+ (CodeGenerator_primary_return *)newCodeGenerator_primary_return;
/* this is start of set and get methods */
  /* methodsDecl */
@end /* end of returnScopeInterface interface */

/* returnScopeInterface CodeGenerator_args_return */
@interface CodeGenerator_args_return :ANTLRTreeRuleReturnScope { /* returnScopeInterface line 1838 */
 /* ObjC start of memVars() */
NSInteger n;

BOOL namedArgs;
}
/* start properties */
@property (assign, getter=getn, setter=setn:) NSInteger n;

@property (assign, getter=getnamedArgs, setter=setnamedArgs:) BOOL namedArgs;

/* end properties */
+ (CodeGenerator_args_return *)newCodeGenerator_args_return;
/* this is start of set and get methods */
  /* methodsDecl */
/* start of iterated get and set functions */

- (NSInteger)getn;
- (void)setn:(NSInteger)aVal;


- (BOOL)getnamedArgs;
- (void)setnamedArgs:(BOOL)aVal;


/* End of iterated get and set functions */
@end /* end of returnScopeInterface interface */

/* returnScopeInterface CodeGenerator_listElement_return */
@interface CodeGenerator_listElement_return :ANTLRTreeRuleReturnScope { /* returnScopeInterface line 1838 */
 /* ObjC start of memVars() */
}
/* start properties */
+ (CodeGenerator_listElement_return *)newCodeGenerator_listElement_return;
/* this is start of set and get methods */
  /* methodsDecl */
@end /* end of returnScopeInterface interface */



/* Interface grammar class */
@interface CodeGenerator : ANTLRTreeParser { /* line 572 */
/* ObjC start of ruleAttributeScopeMemVar */
/* ruleAttributeScopeMemVar */

template_Scope *template_scope;

/* ObjC end of ruleAttributeScopeMemVar */
/* ObjC start of globalAttributeScopeMemVar */


/* ObjC end of globalAttributeScopeMemVar */
/* ObjC start of actions.(actionScope).memVars */

	NSString *outermostTemplateName;	// name of overall template
	CompiledST *outermostImpl;
	STToken *templateToken;			    // overall template token
	NSString *template;  				// overall template text
	ErrorManager *errMgr;

/* ObjC end of actions.(actionScope).memVars */
/* ObjC start of memVars */
/* ObjC end of memVars */

 }

/* ObjC start of actions.(actionScope).properties */

	@property(retain) NSString *outermostTemplateName; // name of overall template
	@property(retain) CompiledST *outermostImpl;
	@property(retain) STToken *templateToken;// overall template token
	@property(retain) NSString *template;    // overall template text
	@property(retain) ErrorManager *errMgr;

/* ObjC end of actions.(actionScope).properties */
/* ObjC start of properties */
/* ObjC end of properties */

+ (void) initialize;
+ (id) newCodeGenerator:(id<ANTLRTreeNodeStream>)aStream;
/* ObjC start of actions.(actionScope).methodsDecl */

+ (id) newCodeGenerator:(id<ANTLRTreeNodeStream>)input
                 errMgr:(ErrorManager *)anErrMgr
                   name:(NSString *)aName
               template:(NSString *)aTemplate
                  token:(STToken *)aTemplateToken;

- (id) init:(id<ANTLRTreeNodeStream>)input
                     errMgr:(ErrorManager *)anErrMgr
                   name:(NSString *)aName
               template:(NSString *)aTemplate
                  token:(STToken *)aTemplateToken;

// convience funcs to hide offensive sending of emit messages to
// CompilationState temp data object.

- (void) emit1:(ANTLRCommonTree *)opAST opcode:(short)anOpcode arg:(NSInteger)arg;
- (void) emit1:(ANTLRCommonTree *)opAST opcode:(short)anOpcode s:(NSString *)arg;
- (void) emit2:(ANTLRCommonTree *)opAST opcode:(short)anOpcode arg:(NSInteger)anArg arg2:(NSInteger)anArg2;
- (void) emit2:(ANTLRCommonTree *)opAST opcode:(short)anOpcode s:(NSString *)s arg2:(NSInteger)anArg;
- (void) emit:(short)anOpcode;
- (void) emit:(ANTLRCommonTree *)opAST opcode:(short)anOpcode;
- (void) insert:(NSInteger)addr opcode:(short)anOpcode s:(NSString *)s;
- (void) setOption:(ANTLRCommonTree *)anID;
- (void) write:(NSInteger)addr value:(short)value;
- (NSInteger) address;
- (void) func:(ANTLRCommonTree *)aTree;
- (void) refAttr:(ANTLRCommonTree *)aTree;
- (NSInteger) defineString:(NSString *)s;

/* ObjC end of actions.(actionScope).methodsDecl */

/* ObjC start of methodsDecl */
/* ObjC end of methodsDecl */

- (void)templateAndEOF; 
- (CompiledST *)template:(NSString *)name arg1:(AMutableArray *)args; 
- (void)chunk; 
- (void)element; 
- (void)singleElement; 
- (void)compoundElement:(ANTLRCommonTree *)indent ; 
- (void)exprElement; 
- (CodeGenerator_region_return *)region:(ANTLRCommonTree *)indent; 
- (CodeGenerator_subtemplate_return *)subtemplate; 
- (void)ifstat:(ANTLRCommonTree *)indent; 
- (CodeGenerator_conditional_return *)conditional; 
- (void)exprOptions; 
- (void)option; 
- (void)expr; 
- (void)prop; 
- (void)mapTemplateRef:(NSInteger)num_exprs; 
- (void)includeExpr; 
- (CodeGenerator_primary_return *)primary; 
- (void)arg; 
- (CodeGenerator_args_return *)args; 
- (void)list; 
- (CodeGenerator_listElement_return *)listElement; 


@end /* end of CodeGenerator interface */
