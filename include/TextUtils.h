#pragma once

@interface SunflsksTextUtils : NSObject
+(NSString*)spongeCase:(NSString*)string;
+(NSString*)randomLetters:(NSUInteger)size;
+(unichar)getSpongeChar:(unichar)character;
+(NSString*)zalgoText:(NSString*)input craziness:(NSUInteger)craziness;
+(NSString*)zalgoChar:(NSString*)input craziness:(NSUInteger)craziness;
@end