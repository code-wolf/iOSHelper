#import "NSIndexPath+iOSHelper.h"

@implementation NSIndexPath (iOSHelper)

+ (NSArray *)indexPathsFromRow:(NSInteger)startRow toRow:(NSInteger)endRow inSection:(NSInteger)section {
    NSAssert(endRow >= startRow, @"endRow must be greater or equal than startRow");
    
    NSMutableArray *indexPaths = [NSMutableArray arrayWithCapacity:(NSUInteger)(endRow-startRow+1)];
    
    for (NSInteger row = startRow; row <= endRow; row++) {
        [indexPaths addObject:[NSIndexPath indexPathForRow:row inSection:section]];
    }
    
    return [indexPaths copy];
}

+ (NSIndexPath *)indexPathForFirstRowInSection:(NSInteger)section {
    return [self indexPathForRow:0 inSection:section];
}

+ (NSIndexPath *)indexPathForRowInFirstSection:(NSInteger)row {
    return [self indexPathForRow:row inSection:0];
}

@end
