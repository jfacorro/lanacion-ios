//
//  NSString+toDate.m
//  Hyper
//
//  Created by Sebastian Cancinos on 6/26/14.
//  Copyright (c) 2014 Inaka. All rights reserved.
//

#import "NSString+toDate.h"

@implementation NSString (toDate)

- (NSDate*) toDate
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSZ"];
    NSString* stringDate = [self stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    NSDate *outDate = [dateFormat dateFromString:stringDate];
    
    return outDate;
}

@end
