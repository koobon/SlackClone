//
//  ColorUtil.h
//  hanuri
//
//  Created by Dev.lee on 2018. 5. 4..
//  Copyright © 2018년 richware. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorUtil : NSObject

+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHex:(NSInteger)hex;

@end
