#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    NSInteger tmpNumber = n;
    NSString *binaryNumber = @"";
    
    while (tmpNumber > 0) {
        binaryNumber = [binaryNumber stringByAppendingString: [NSString stringWithFormat:@"%lu", tmpNumber&1]];
        tmpNumber = tmpNumber >> 1;
    }
    
    for (NSInteger i = [binaryNumber length]; i < 8; i++) {
        binaryNumber = [binaryNumber stringByAppendingString: @"0"];
    }
    
    long decimalNumber = strtol([binaryNumber UTF8String], NULL, 2);
    
    return decimalNumber;
}
