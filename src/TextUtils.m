#import "../include/TextUtils.h"

#define ASCII_MAX 255

@implementation SunflsksTextUtils

+(NSString*)spongeCase:(NSString*)string {
    unichar charOfString;
    NSMutableString* newString =  [NSMutableString stringWithCapacity:string.length + 2];

    for (int i = 0; i < string.length; i++) {
        charOfString = [string characterAtIndex:i];

        if (isalpha(charOfString)) {
            charOfString = [SunflsksTextUtils getSpongeChar:charOfString]; 
        }

        [newString appendFormat:@"%C", charOfString];
    }

    return newString;
}

+(NSString*)randomLetters:(NSUInteger)size {
    NSMutableString* string = [NSMutableString stringWithCapacity:size];

    for (NSUInteger i = 0; i < size; i++) {
        unichar random = arc4random_uniform(ASCII_MAX);
        [string appendFormat:@"%C", random];
    }

    return string;
}

+(unichar)getSpongeChar:(unichar)character {
    int rand = arc4random_uniform(11);

    if (rand > 5) {
        if (isupper(character)) {
            character = tolower(character);
        }

        else if (islower(character)) {
            character = toupper(character);
        }
    }

    return character;
}

@end