// $ANTLR 3.3.1-SNAPSHOT Feb 04, 2011 12:40:37 /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g 2011-02-04 20:21:49

package org.stringtemplate.v4.compiler;
import org.stringtemplate.v4.*;
import org.stringtemplate.v4.misc.*;
import java.io.File;


import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class GroupLexer extends Lexer {
    public static final int EOF=-1;
    public static final int T__11=11;
    public static final int T__12=12;
    public static final int T__13=13;
    public static final int T__14=14;
    public static final int T__15=15;
    public static final int T__16=16;
    public static final int T__17=17;
    public static final int T__18=18;
    public static final int T__19=19;
    public static final int T__20=20;
    public static final int T__21=21;
    public static final int T__22=22;
    public static final int STRING=4;
    public static final int ID=5;
    public static final int BIGSTRING=6;
    public static final int ANONYMOUS_TEMPLATE=7;
    public static final int COMMENT=8;
    public static final int LINE_COMMENT=9;
    public static final int WS=10;

    public STGroup group;

    public void reportError(RecognitionException e) {
        String msg = null;
        if ( e instanceof NoViableAltException ) {
            msg = "invalid character '"+(char)input.LA(1)+"'";
        }
        else if ( e instanceof MismatchedTokenException && ((MismatchedTokenException)e).expecting=='"' ) {
            msg = "unterminated string";
        }
        else {
            msg = getErrorMessage(e, getTokenNames());
        }
        group.errMgr.groupSyntaxError(ErrorType.SYNTAX_ERROR, getSourceName(), e, msg);
    }
    public String getSourceName() {
        String fullFileName = super.getSourceName();
        File f = new File(fullFileName); // strip to simple name
        return f.getName();
    }


    // delegates
    // delegators

    public GroupLexer() {;} 
    public GroupLexer(CharStream input) {
        this(input, new RecognizerSharedState());
    }
    public GroupLexer(CharStream input, RecognizerSharedState state) {
        super(input,state);

    }
    public String getGrammarFileName() { return "/Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g"; }

    // $ANTLR start "T__11"
    public final void mT__11() throws RecognitionException {
        try {
            int _type = T__11;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:32:7: ( 'import' )
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:32:9: 'import'
            {
            match("import"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__11"

    // $ANTLR start "T__12"
    public final void mT__12() throws RecognitionException {
        try {
            int _type = T__12;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:33:7: ( '.' )
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:33:9: '.'
            {
            match('.'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__12"

    // $ANTLR start "T__13"
    public final void mT__13() throws RecognitionException {
        try {
            int _type = T__13;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:34:7: ( '@' )
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:34:9: '@'
            {
            match('@'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__13"

    // $ANTLR start "T__14"
    public final void mT__14() throws RecognitionException {
        try {
            int _type = T__14;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:35:7: ( '(' )
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:35:9: '('
            {
            match('('); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__14"

    // $ANTLR start "T__15"
    public final void mT__15() throws RecognitionException {
        try {
            int _type = T__15;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:36:7: ( ')' )
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:36:9: ')'
            {
            match(')'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__15"

    // $ANTLR start "T__16"
    public final void mT__16() throws RecognitionException {
        try {
            int _type = T__16;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:37:7: ( '::=' )
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:37:9: '::='
            {
            match("::="); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__16"

    // $ANTLR start "T__17"
    public final void mT__17() throws RecognitionException {
        try {
            int _type = T__17;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:38:7: ( ',' )
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:38:9: ','
            {
            match(','); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__17"

    // $ANTLR start "T__18"
    public final void mT__18() throws RecognitionException {
        try {
            int _type = T__18;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:39:7: ( '=' )
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:39:9: '='
            {
            match('='); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__18"

    // $ANTLR start "T__19"
    public final void mT__19() throws RecognitionException {
        try {
            int _type = T__19;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:40:7: ( '[' )
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:40:9: '['
            {
            match('['); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__19"

    // $ANTLR start "T__20"
    public final void mT__20() throws RecognitionException {
        try {
            int _type = T__20;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:41:7: ( ']' )
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:41:9: ']'
            {
            match(']'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__20"

    // $ANTLR start "T__21"
    public final void mT__21() throws RecognitionException {
        try {
            int _type = T__21;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:42:7: ( 'default' )
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:42:9: 'default'
            {
            match("default"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__21"

    // $ANTLR start "T__22"
    public final void mT__22() throws RecognitionException {
        try {
            int _type = T__22;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:43:7: ( ':' )
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:43:9: ':'
            {
            match(':'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__22"

    // $ANTLR start "ID"
    public final void mID() throws RecognitionException {
        try {
            int _type = ID;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:232:4: ( ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '-' | '_' )* )
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:232:6: ( 'a' .. 'z' | 'A' .. 'Z' | '_' ) ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '-' | '_' )*
            {
            if ( (input.LA(1)>='A' && input.LA(1)<='Z')||input.LA(1)=='_'||(input.LA(1)>='a' && input.LA(1)<='z') ) {
                input.consume();

            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                recover(mse);
                throw mse;}

            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:232:30: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '-' | '_' )*
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);

                if ( (LA1_0=='-'||(LA1_0>='0' && LA1_0<='9')||(LA1_0>='A' && LA1_0<='Z')||LA1_0=='_'||(LA1_0>='a' && LA1_0<='z')) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:
            	    {
            	    if ( input.LA(1)=='-'||(input.LA(1)>='0' && input.LA(1)<='9')||(input.LA(1)>='A' && input.LA(1)<='Z')||input.LA(1)=='_'||(input.LA(1)>='a' && input.LA(1)<='z') ) {
            	        input.consume();

            	    }
            	    else {
            	        MismatchedSetException mse = new MismatchedSetException(null,input);
            	        recover(mse);
            	        throw mse;}


            	    }
            	    break;

            	default :
            	    break loop1;
                }
            } while (true);


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "ID"

    // $ANTLR start "STRING"
    public final void mSTRING() throws RecognitionException {
        try {
            int _type = STRING;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:236:2: ( '\"' ( '\\\\' '\"' | '\\\\' ~ '\"' | '\\n' | ~ ( '\\\\' | '\"' | '\\n' ) )* '\"' )
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:236:4: '\"' ( '\\\\' '\"' | '\\\\' ~ '\"' | '\\n' | ~ ( '\\\\' | '\"' | '\\n' ) )* '\"'
            {
            match('\"'); 
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:237:3: ( '\\\\' '\"' | '\\\\' ~ '\"' | '\\n' | ~ ( '\\\\' | '\"' | '\\n' ) )*
            loop2:
            do {
                int alt2=5;
                int LA2_0 = input.LA(1);

                if ( (LA2_0=='\\') ) {
                    int LA2_2 = input.LA(2);

                    if ( (LA2_2=='\"') ) {
                        alt2=1;
                    }
                    else if ( ((LA2_2>='\u0000' && LA2_2<='!')||(LA2_2>='#' && LA2_2<='\uFFFF')) ) {
                        alt2=2;
                    }


                }
                else if ( (LA2_0=='\n') ) {
                    alt2=3;
                }
                else if ( ((LA2_0>='\u0000' && LA2_0<='\t')||(LA2_0>='\u000B' && LA2_0<='!')||(LA2_0>='#' && LA2_0<='[')||(LA2_0>=']' && LA2_0<='\uFFFF')) ) {
                    alt2=4;
                }


                switch (alt2) {
            	case 1 :
            	    // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:237:5: '\\\\' '\"'
            	    {
            	    match('\\'); 
            	    match('\"'); 

            	    }
            	    break;
            	case 2 :
            	    // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:238:5: '\\\\' ~ '\"'
            	    {
            	    match('\\'); 
            	    if ( (input.LA(1)>='\u0000' && input.LA(1)<='!')||(input.LA(1)>='#' && input.LA(1)<='\uFFFF') ) {
            	        input.consume();

            	    }
            	    else {
            	        MismatchedSetException mse = new MismatchedSetException(null,input);
            	        recover(mse);
            	        throw mse;}


            	    }
            	    break;
            	case 3 :
            	    // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:239:5: '\\n'
            	    {

            	    			String msg = "\\n in string";
            	        		NoViableAltException e = new NoViableAltException("", 0, 0, input);
            	    			group.errMgr.groupLexerError(ErrorType.SYNTAX_ERROR, getSourceName(), e, msg);
            	    			
            	    match('\n'); 

            	    }
            	    break;
            	case 4 :
            	    // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:245:5: ~ ( '\\\\' | '\"' | '\\n' )
            	    {
            	    if ( (input.LA(1)>='\u0000' && input.LA(1)<='\t')||(input.LA(1)>='\u000B' && input.LA(1)<='!')||(input.LA(1)>='#' && input.LA(1)<='[')||(input.LA(1)>=']' && input.LA(1)<='\uFFFF') ) {
            	        input.consume();

            	    }
            	    else {
            	        MismatchedSetException mse = new MismatchedSetException(null,input);
            	        recover(mse);
            	        throw mse;}


            	    }
            	    break;

            	default :
            	    break loop2;
                }
            } while (true);

            match('\"'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "STRING"

    // $ANTLR start "BIGSTRING"
    public final void mBIGSTRING() throws RecognitionException {
        try {
            int _type = BIGSTRING;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:251:2: ( '<<' ( options {greedy=false; } : '\\\\' '>' | '\\\\' ~ '>' | ~ '\\\\' )* '>>' )
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:251:4: '<<' ( options {greedy=false; } : '\\\\' '>' | '\\\\' ~ '>' | ~ '\\\\' )* '>>'
            {
            match("<<"); 

            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:252:3: ( options {greedy=false; } : '\\\\' '>' | '\\\\' ~ '>' | ~ '\\\\' )*
            loop3:
            do {
                int alt3=4;
                int LA3_0 = input.LA(1);

                if ( (LA3_0=='>') ) {
                    int LA3_1 = input.LA(2);

                    if ( (LA3_1=='>') ) {
                        alt3=4;
                    }
                    else if ( ((LA3_1>='\u0000' && LA3_1<='=')||(LA3_1>='?' && LA3_1<='\uFFFF')) ) {
                        alt3=3;
                    }


                }
                else if ( (LA3_0=='\\') ) {
                    int LA3_2 = input.LA(2);

                    if ( (LA3_2=='>') ) {
                        alt3=1;
                    }
                    else if ( ((LA3_2>='\u0000' && LA3_2<='=')||(LA3_2>='?' && LA3_2<='\uFFFF')) ) {
                        alt3=2;
                    }


                }
                else if ( ((LA3_0>='\u0000' && LA3_0<='=')||(LA3_0>='?' && LA3_0<='[')||(LA3_0>=']' && LA3_0<='\uFFFF')) ) {
                    alt3=3;
                }


                switch (alt3) {
            	case 1 :
            	    // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:253:5: '\\\\' '>'
            	    {
            	    match('\\'); 
            	    match('>'); 

            	    }
            	    break;
            	case 2 :
            	    // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:254:5: '\\\\' ~ '>'
            	    {
            	    match('\\'); 
            	    if ( (input.LA(1)>='\u0000' && input.LA(1)<='=')||(input.LA(1)>='?' && input.LA(1)<='\uFFFF') ) {
            	        input.consume();

            	    }
            	    else {
            	        MismatchedSetException mse = new MismatchedSetException(null,input);
            	        recover(mse);
            	        throw mse;}


            	    }
            	    break;
            	case 3 :
            	    // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:255:5: ~ '\\\\'
            	    {
            	    if ( (input.LA(1)>='\u0000' && input.LA(1)<='[')||(input.LA(1)>=']' && input.LA(1)<='\uFFFF') ) {
            	        input.consume();

            	    }
            	    else {
            	        MismatchedSetException mse = new MismatchedSetException(null,input);
            	        recover(mse);
            	        throw mse;}


            	    }
            	    break;

            	default :
            	    break loop3;
                }
            } while (true);

            match(">>"); 


                    String txt = getText().replaceAll("\\\\>",">");;
            		setText(txt);
            		

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "BIGSTRING"

    // $ANTLR start "ANONYMOUS_TEMPLATE"
    public final void mANONYMOUS_TEMPLATE() throws RecognitionException {
        try {
            int _type = ANONYMOUS_TEMPLATE;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:265:5: ( '{' )
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:265:7: '{'
            {
            match('{'); 

            		Token templateToken = new CommonToken(input, ANONYMOUS_TEMPLATE, 0, getCharIndex(), getCharIndex());
            		STLexer lexer =
            			new STLexer(group.errMgr, input, templateToken, group.delimiterStartChar, group.delimiterStopChar);
            		lexer.subtemplateDepth = 1;
            		Token t = lexer.nextToken();
            		while ( lexer.subtemplateDepth>=1 || t.getType()!=STLexer.RCURLY ) {
            			if ( t.getType()==STLexer.EOF_TYPE ) {
                        	MismatchedTokenException e = new MismatchedTokenException('}', input);
            				String msg = "missing final '}' in {...} anonymous template";
                			group.errMgr.groupLexerError(ErrorType.SYNTAX_ERROR, getSourceName(), e, msg);
            				break;
            			}
            			t = lexer.nextToken();
            		}
            		

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "ANONYMOUS_TEMPLATE"

    // $ANTLR start "COMMENT"
    public final void mCOMMENT() throws RecognitionException {
        try {
            int _type = COMMENT;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:287:5: ( '/*' ( options {greedy=false; } : . )* '*/' )
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:287:9: '/*' ( options {greedy=false; } : . )* '*/'
            {
            match("/*"); 

            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:287:14: ( options {greedy=false; } : . )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);

                if ( (LA4_0=='*') ) {
                    int LA4_1 = input.LA(2);

                    if ( (LA4_1=='/') ) {
                        alt4=2;
                    }
                    else if ( ((LA4_1>='\u0000' && LA4_1<='.')||(LA4_1>='0' && LA4_1<='\uFFFF')) ) {
                        alt4=1;
                    }


                }
                else if ( ((LA4_0>='\u0000' && LA4_0<=')')||(LA4_0>='+' && LA4_0<='\uFFFF')) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:287:42: .
            	    {
            	    matchAny(); 

            	    }
            	    break;

            	default :
            	    break loop4;
                }
            } while (true);

            match("*/"); 

            skip();

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "COMMENT"

    // $ANTLR start "LINE_COMMENT"
    public final void mLINE_COMMENT() throws RecognitionException {
        try {
            int _type = LINE_COMMENT;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:291:5: ( '//' (~ ( '\\n' | '\\r' ) )* ( '\\r' )? '\\n' )
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:291:7: '//' (~ ( '\\n' | '\\r' ) )* ( '\\r' )? '\\n'
            {
            match("//"); 

            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:291:12: (~ ( '\\n' | '\\r' ) )*
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);

                if ( ((LA5_0>='\u0000' && LA5_0<='\t')||(LA5_0>='\u000B' && LA5_0<='\f')||(LA5_0>='\u000E' && LA5_0<='\uFFFF')) ) {
                    alt5=1;
                }


                switch (alt5) {
            	case 1 :
            	    // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:291:12: ~ ( '\\n' | '\\r' )
            	    {
            	    if ( (input.LA(1)>='\u0000' && input.LA(1)<='\t')||(input.LA(1)>='\u000B' && input.LA(1)<='\f')||(input.LA(1)>='\u000E' && input.LA(1)<='\uFFFF') ) {
            	        input.consume();

            	    }
            	    else {
            	        MismatchedSetException mse = new MismatchedSetException(null,input);
            	        recover(mse);
            	        throw mse;}


            	    }
            	    break;

            	default :
            	    break loop5;
                }
            } while (true);

            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:291:26: ( '\\r' )?
            int alt6=2;
            int LA6_0 = input.LA(1);

            if ( (LA6_0=='\r') ) {
                alt6=1;
            }
            switch (alt6) {
                case 1 :
                    // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:291:26: '\\r'
                    {
                    match('\r'); 

                    }
                    break;

            }

            match('\n'); 
            skip();

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "LINE_COMMENT"

    // $ANTLR start "WS"
    public final void mWS() throws RecognitionException {
        try {
            int _type = WS;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:294:5: ( ( ' ' | '\\r' | '\\t' | '\\n' ) )
            // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:294:7: ( ' ' | '\\r' | '\\t' | '\\n' )
            {
            if ( (input.LA(1)>='\t' && input.LA(1)<='\n')||input.LA(1)=='\r'||input.LA(1)==' ' ) {
                input.consume();

            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                recover(mse);
                throw mse;}

            skip();

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "WS"

    public void mTokens() throws RecognitionException {
        // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:8: ( T__11 | T__12 | T__13 | T__14 | T__15 | T__16 | T__17 | T__18 | T__19 | T__20 | T__21 | T__22 | ID | STRING | BIGSTRING | ANONYMOUS_TEMPLATE | COMMENT | LINE_COMMENT | WS )
        int alt7=19;
        alt7 = dfa7.predict(input);
        switch (alt7) {
            case 1 :
                // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:10: T__11
                {
                mT__11(); 

                }
                break;
            case 2 :
                // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:16: T__12
                {
                mT__12(); 

                }
                break;
            case 3 :
                // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:22: T__13
                {
                mT__13(); 

                }
                break;
            case 4 :
                // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:28: T__14
                {
                mT__14(); 

                }
                break;
            case 5 :
                // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:34: T__15
                {
                mT__15(); 

                }
                break;
            case 6 :
                // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:40: T__16
                {
                mT__16(); 

                }
                break;
            case 7 :
                // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:46: T__17
                {
                mT__17(); 

                }
                break;
            case 8 :
                // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:52: T__18
                {
                mT__18(); 

                }
                break;
            case 9 :
                // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:58: T__19
                {
                mT__19(); 

                }
                break;
            case 10 :
                // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:64: T__20
                {
                mT__20(); 

                }
                break;
            case 11 :
                // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:70: T__21
                {
                mT__21(); 

                }
                break;
            case 12 :
                // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:76: T__22
                {
                mT__22(); 

                }
                break;
            case 13 :
                // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:82: ID
                {
                mID(); 

                }
                break;
            case 14 :
                // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:85: STRING
                {
                mSTRING(); 

                }
                break;
            case 15 :
                // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:92: BIGSTRING
                {
                mBIGSTRING(); 

                }
                break;
            case 16 :
                // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:102: ANONYMOUS_TEMPLATE
                {
                mANONYMOUS_TEMPLATE(); 

                }
                break;
            case 17 :
                // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:121: COMMENT
                {
                mCOMMENT(); 

                }
                break;
            case 18 :
                // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:129: LINE_COMMENT
                {
                mLINE_COMMENT(); 

                }
                break;
            case 19 :
                // /Users/acondit/source/antlr3/acondit_localhost/code/ST4/objc/main/compiler/Group.g:1:142: WS
                {
                mWS(); 

                }
                break;

        }

    }


    protected DFA7 dfa7 = new DFA7(this);
    static final String DFA7_eotS =
        "\1\uffff\1\14\4\uffff\1\24\4\uffff\1\14\6\uffff\1\14\2\uffff\1\14"+
        "\2\uffff\6\14\1\40\1\14\1\uffff\1\42\1\uffff";
    static final String DFA7_eofS =
        "\43\uffff";
    static final String DFA7_minS =
        "\1\11\1\155\4\uffff\1\72\4\uffff\1\145\4\uffff\1\52\1\uffff\1\160"+
        "\2\uffff\1\146\2\uffff\1\157\1\141\1\162\1\165\1\164\1\154\1\55"+
        "\1\164\1\uffff\1\55\1\uffff";
    static final String DFA7_maxS =
        "\1\173\1\155\4\uffff\1\72\4\uffff\1\145\4\uffff\1\57\1\uffff\1\160"+
        "\2\uffff\1\146\2\uffff\1\157\1\141\1\162\1\165\1\164\1\154\1\172"+
        "\1\164\1\uffff\1\172\1\uffff";
    static final String DFA7_acceptS =
        "\2\uffff\1\2\1\3\1\4\1\5\1\uffff\1\7\1\10\1\11\1\12\1\uffff\1\15"+
        "\1\16\1\17\1\20\1\uffff\1\23\1\uffff\1\6\1\14\1\uffff\1\21\1\22"+
        "\10\uffff\1\1\1\uffff\1\13";
    static final String DFA7_specialS =
        "\43\uffff}>";
    static final String[] DFA7_transitionS = {
            "\2\21\2\uffff\1\21\22\uffff\1\21\1\uffff\1\15\5\uffff\1\4\1"+
            "\5\2\uffff\1\7\1\uffff\1\2\1\20\12\uffff\1\6\1\uffff\1\16\1"+
            "\10\2\uffff\1\3\32\14\1\11\1\uffff\1\12\1\uffff\1\14\1\uffff"+
            "\3\14\1\13\4\14\1\1\21\14\1\17",
            "\1\22",
            "",
            "",
            "",
            "",
            "\1\23",
            "",
            "",
            "",
            "",
            "\1\25",
            "",
            "",
            "",
            "",
            "\1\26\4\uffff\1\27",
            "",
            "\1\30",
            "",
            "",
            "\1\31",
            "",
            "",
            "\1\32",
            "\1\33",
            "\1\34",
            "\1\35",
            "\1\36",
            "\1\37",
            "\1\14\2\uffff\12\14\7\uffff\32\14\4\uffff\1\14\1\uffff\32\14",
            "\1\41",
            "",
            "\1\14\2\uffff\12\14\7\uffff\32\14\4\uffff\1\14\1\uffff\32\14",
            ""
    };

    static final short[] DFA7_eot = DFA.unpackEncodedString(DFA7_eotS);
    static final short[] DFA7_eof = DFA.unpackEncodedString(DFA7_eofS);
    static final char[] DFA7_min = DFA.unpackEncodedStringToUnsignedChars(DFA7_minS);
    static final char[] DFA7_max = DFA.unpackEncodedStringToUnsignedChars(DFA7_maxS);
    static final short[] DFA7_accept = DFA.unpackEncodedString(DFA7_acceptS);
    static final short[] DFA7_special = DFA.unpackEncodedString(DFA7_specialS);
    static final short[][] DFA7_transition;

    static {
        int numStates = DFA7_transitionS.length;
        DFA7_transition = new short[numStates][];
        for (int i=0; i<numStates; i++) {
            DFA7_transition[i] = DFA.unpackEncodedString(DFA7_transitionS[i]);
        }
    }

    class DFA7 extends DFA {

        public DFA7(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 7;
            this.eot = DFA7_eot;
            this.eof = DFA7_eof;
            this.min = DFA7_min;
            this.max = DFA7_max;
            this.accept = DFA7_accept;
            this.special = DFA7_special;
            this.transition = DFA7_transition;
        }
        public String getDescription() {
            return "1:1: Tokens : ( T__11 | T__12 | T__13 | T__14 | T__15 | T__16 | T__17 | T__18 | T__19 | T__20 | T__21 | T__22 | ID | STRING | BIGSTRING | ANONYMOUS_TEMPLATE | COMMENT | LINE_COMMENT | WS );";
        }
    }
 

}