#pragma once

@interface SunflsksTextUtils : NSObject
+(NSString*)spongeCase:(NSString*)string;
+(NSString*)randomLetters:(NSUInteger)size;
+(unichar)getSpongeChar:(unichar)character;
@end