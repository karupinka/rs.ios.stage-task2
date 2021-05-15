#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    int count = 0;
        for (NSInteger i = 0; i < array.count; i++) {
            for (NSInteger j = 0; j < array.count; j++) {
                if (array[i].integerValue + number.integerValue == array[j].integerValue) {
                    count++;
                }
            }
        }
        

    return count;
}

@end
