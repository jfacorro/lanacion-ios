//
//  UIColor+RGB.m
//  Club La Nacion
//
//  Created by Sebastian Cancinos on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "UIColor+RGB.h"

@implementation UIColor (RGB)

+ (UIColor*) colorWithRGB:(NSString*) RGBString
{
    if([RGBString hasPrefix:@"#"])
    {
        RGBString = [RGBString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    }
    
    NSRange range = NSMakeRange(0, 2);
    NSString* RString = [RGBString substringWithRange:range];
    range = NSMakeRange(2, 2);
    NSString* GString = [RGBString substringWithRange:range];
    range = NSMakeRange(4, 2);
    NSString* BString = [RGBString substringWithRange:range];
    
    
    NSInteger red = strtol( [RString UTF8String], NULL, 16);
    NSInteger green = strtol( [GString UTF8String], NULL, 16);
    NSInteger blue = strtol( [BString UTF8String], NULL, 16);
    
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
}
@end
