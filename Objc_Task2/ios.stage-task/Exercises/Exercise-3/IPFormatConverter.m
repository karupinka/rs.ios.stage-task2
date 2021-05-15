#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    __block NSMutableString *string = [[NSMutableString alloc] init];
    
    if ([numbersArray count] == 0) {
        string = @"";
    } else {
        __block bool isCorrect = true;
        [numbersArray enumerateObjectsUsingBlock:^(NSNumber *number, NSUInteger idx, BOOL *stop) {
            if (number.integerValue > 255) {
                [string setString:@"The numbers in the input array can be in the range from 0 to 255."];
                isCorrect = false;
                *stop = YES;
            } else if (number.integerValue < 0) {
                [string setString:@"Negative numbers are not valid for input."];
                isCorrect = false;
                *stop = YES;
            } else {
                if (idx > 0) {
                    [string appendString: @"."];
                }
                [string appendString:[number stringValue]];
            }
        }];
        if (isCorrect) {
            for (int i = [numbersArray count]; i < 4; i++) {
                [string appendString:@".0"];
            }
            if (string.length > 15) {
                string = [string substringToIndex:15];
            }
        }
    }
    
    return string;
}

@end
