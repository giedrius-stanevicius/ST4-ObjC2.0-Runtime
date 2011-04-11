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
#import <Cocoa/Cocoa.h>
#import <ANTLR/ANTLR.h>
#import "STToken.h"
#import "Interpreter.h"
#import "ErrorManager.h"
#import "Interpreter.h"
#import "Interval.h"
#import "Bytecode.h"
#import "StringTable.h"
#import "CompiledST.h"

/**
 * temp data used during construction and functions that fill it / use it.
 * Result is impl CompiledST object.
 */

@interface CompilationState : NSObject {

	/** The compiled code implementation to fill in. */
  CompiledST *impl;

	/** Track unique strings; copy into CompiledST's String[] after compilation */
  StringTable *stringtable;

	/** Track instruction location within code.instrs array; this is
	 *  next address to write to.  Byte-addressable memory.
	 */
  NSInteger ip;
  ANTLRCommonTokenStream *tokens;
  ErrorManager *errMgr;
}

+ (id) newCompilationState:(ErrorManager *)anErrMgr
                      name:(NSString *)name
                    stream:(ANTLRCommonTokenStream *)tokens;

- (id) init:(ErrorManager *)anErrMgr
       name:(NSString *)aName
     stream:(ANTLRCommonTokenStream *)theTokens;
     
- (NSInteger) defineString:(NSString *)s;
- (void) refAttr:(STToken *)templateToken tree:(ANTLRCommonTree *)id;
- (void) setOption:(ANTLRCommonTree *)id;
- (void) func:(STToken *)templateToken tree:(ANTLRCommonTree *)id;
- (void) emit:(short)opcode;
- (void) emit:(ANTLRCommonTree *)opAST opcode:(short)opcode;
- (void) emit1:(ANTLRCommonTree *)opAST opcode:(short)opcode arg:(NSInteger)arg;
- (void) emit1:(ANTLRCommonTree *)opAST opcode:(short)opcode s:(NSString *)s;
- (void) emit2:(ANTLRCommonTree *)opAST opcode:(short)opcode arg:(NSInteger)arg arg2:(NSInteger)arg2;
- (void) emit2:(ANTLRCommonTree *)opAST opcode:(short)opcode s:(NSString *)s arg2:(NSInteger)arg2;
- (void) insert:(NSInteger)addr opcode:(short)opcode s:(NSString *)s;
- (void) write:(NSInteger)addr value:(short)value;
- (void) ensureCapacity:(NSInteger)n;
- (void) indent:(ANTLRCommonTree *)indent;
//+ (void) writeShort:(char *)memory index:(NSInteger)index value:(short)value;

@property (retain) CompiledST *impl;
@property (retain) StringTable *stringtable;
@property (assign) NSInteger ip;
@property (retain) ANTLRCommonTokenStream *tokens;
@property (retain) ErrorManager *errMgr;

@end
