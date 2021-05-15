#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    NSMutableArray *resultsArray = [[NSMutableArray alloc] init];
    NSMutableArray <NSString *> *stringArrays = [[NSMutableArray alloc] init];
    NSMutableArray <NSNumber *> *numberArrays = [[NSMutableArray alloc] init];
    __block BOOL *isOneArray = false;

    [array enumerateObjectsUsingBlock:^(NSArray *arrayInArray, NSUInteger idx, BOOL *stop) {

        NSMutableArray *tmpStringArrays = [[NSMutableArray alloc] init];
        NSMutableArray *tmpNumberArrays = [[NSMutableArray alloc] init];
        
        if ([arrayInArray isKindOfClass:NSArray.class]) {
            for (int i = 0; i < [arrayInArray count]; i++) {
                if ([arrayInArray[i] isKindOfClass: NSNumber.class]) {
                    [tmpNumberArrays addObject: arrayInArray[i] ];
                } else if ([arrayInArray[i]  isKindOfClass:NSString.class]) {
                    [tmpStringArrays addObject: arrayInArray[i] ];
                }
        }
            if (([tmpStringArrays count] != 0) && ([tmpNumberArrays count] != 0) ) {
                [tmpStringArrays setArray:@[]];
                [tmpNumberArrays setArray:@[]];
            }
            
            [stringArrays addObjectsFromArray:tmpStringArrays];
            [numberArrays addObjectsFromArray:tmpNumberArrays];
        }
        else if ([arrayInArray isKindOfClass:NSNumber.class]) {
            isOneArray = true;
            [numberArrays addObject:arrayInArray];
        } else if ([arrayInArray isKindOfClass:NSString.class]) {
            isOneArray = true;
            [stringArrays addObject:arrayInArray];
        }
    }];
    [numberArrays sortUsingSelector:@selector(compare:)];
    [stringArrays sortUsingSelector:@selector(compare:)];
    
    if ([numberArrays count] > 0 && [stringArrays count] == 0) {
        [resultsArray addObjectsFromArray:numberArrays];
    } else if ([numberArrays count] == 0 && [stringArrays count] > 0) {
        [resultsArray addObjectsFromArray:stringArrays];
    } else if ([numberArrays count] == 0 && [stringArrays count] == 0) {
    }
    else if (isOneArray) {
    }
    else {
        [resultsArray addObject:numberArrays];
        [stringArrays sortUsingComparator:^NSComparisonResult(NSString *str1, NSString *str2) {
            return [str2 compare:str1];
        }];
        [resultsArray addObject: stringArrays];
    }

    return resultsArray;
}

@end
