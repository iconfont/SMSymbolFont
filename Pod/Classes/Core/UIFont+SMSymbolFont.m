//
//  Created by CocoaPods on TODAYS_DATE.
//  Copyright (c) 2014 PROJECT_OWNER. All rights reserved.
//

#import "UIFont+SMSymbolFont.h"
@import CoreText;

@interface SMBundleKey : NSObject
@end
@implementation SMBundleKey
@end

NSString *const kSMSymbolFontFamilyName = @"icons";

@implementation UIFont (SMSymbolFont)

+ (instancetype)sm_symbolFontWithSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:kSMSymbolFontFamilyName size:size];
    if (!font) {
        NSBundle* bundle = [NSBundle bundleForClass:[SMBundleKey class]];
        NSString *fontPath = [bundle pathForResource:kSMSymbolFontFamilyName ofType:@"ttf"];
        NSData *inData = [NSData dataWithContentsOfFile:fontPath];
        CFErrorRef error;
        CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)inData);
        CGFontRef cgFont = CGFontCreateWithDataProvider(provider);
        if (! CTFontManagerRegisterGraphicsFont(cgFont, &error)) {
            CFStringRef errorDescription = CFErrorCopyDescription(error);
            NSLog(@"Failed to load font: %@", errorDescription);
            CFRelease(errorDescription);
        }
        CFRelease(cgFont);
        CFRelease(provider);
        font = [UIFont fontWithName:kSMSymbolFontFamilyName size:size];
    }
    return font;
}

@end
