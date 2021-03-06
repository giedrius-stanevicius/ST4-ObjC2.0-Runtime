#import "Test.h"
#import "ST.h"
#import "STErrorListener.h"
#import "STGroup.h"
#import "STGroupFile.h"
#import "ErrorBuffer.h"
#import "Assert.h"

@interface TestRegions : BaseTest {
}

- (void) testEmbeddedRegion;
- (void) testRegion;
- (void) testDefineRegionInSubgroup;
- (void) testDefineRegionInSubgroupThatRefsSuper;
- (void) testDefineRegionInSubgroup2;
- (void) testDefineRegionInSameGroup;
- (void) testAnonymousTemplateInRegion;
- (void) testCantDefineEmbeddedRegionAgain;
- (void) testIndentBeforeRegionIsIgnored;
- (void) testRegionOverrideStripsNewlines;
- (void) testRegionOverrideRefSuperRegion;
- (void) testRegionOverrideRefSuperRegion3Levels;
- (void) testRegionOverrideRefSuperImplicitRegion;
- (void) testUnknownRegionDefError;
- (void) testSuperRegionRefMissingOk;
@end
