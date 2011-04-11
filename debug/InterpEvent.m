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
#import "InterpEvent.h"
#import "InstanceScope.h"

@implementation InterpEvent

+ (id) newInterpEventWithWho:(ST *)aWho start:(NSInteger)theStart stop:(NSInteger)theStop
{
    return [[InterpEvent alloc] initWithWho:(ST *)aWho start:(NSInteger)theStart stop:(NSInteger)theStop];
}

- (id) initWithWho:(ST *)aWho start:(NSInteger)theStart stop:(NSInteger)theStop
{
    self=[super init];
    if ( self != nil ) {
        who = aWho;
        outputStartChar = theStart;
        outputStopChar = theStop;
    }
    return self;
}

- (void) InterpEvent:(InstanceScope *)aScope start:(NSInteger)aStartChar stop:(NSInteger)aStopChar
{
    scope = aScope;
    outputStartChar = aStartChar;
    outputStopChar = aStopChar;
}


- (NSString *) description
{
    return [NSString stringWithFormat:@"{who=%@, start=%d, stop=%d}",
            NSStringFromClass([self class]), outputStartChar, outputStopChar];
}

- (NSString *) toString
{
  return [self description];
}

- (void) dealloc
{
  [self release];
  [super dealloc];
}

@synthesize who;
@synthesize outputStartChar;
@synthesize outputStopChar;
@end
