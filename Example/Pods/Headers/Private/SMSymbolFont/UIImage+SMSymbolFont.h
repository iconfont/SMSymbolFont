//
//  Created by CocoaPods on TODAYS_DATE.
//  Copyright (c) 2014 PROJECT_OWNER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SMSymbolFont)

+ (instancetype)sm_imageWithSymbolName:(NSString *)symbolName size:(CGFloat)size color:(UIColor *)color;
+ (instancetype)sm_templateImageWithSymbolName:(NSString *)symbolName size:(CGFloat)size;

@end