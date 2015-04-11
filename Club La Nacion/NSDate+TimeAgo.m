//
//  NSDate+TimeAgo.m
//  Club La Nacion
//
//  Created by Gera on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "NSDate+TimeAgo.h"

@implementation NSDate (TimeAgo)

#pragma mark - Public

- (NSString *)timeToExpireText
{
    return [self timeToExpireTextFromDate:[NSDate date]];
}

- (NSString *)timeToExpireTextFromDate:(NSDate *)date
{
    NSTimeInterval delta = [self timeIntervalSinceDate:date] * (-1); // in seconds

    if (!delta) return nil;
    if (delta < 60) return [self secondsStringWithDelta:delta];
    if (delta < 3600) return [self minutesStringWithDelta:delta];
    if (delta < 86400) return [self hoursStringWithDelta:delta];
    if (delta < 2592000) return [self daysStringWithDelta:delta];
    return @"1+S";
}

- (NSTimeInterval) secondsToExpire
{
    NSTimeInterval delta = [self timeIntervalSinceDate:[NSDate date]] * (-1); // in seconds

    return delta;
}

#pragma mark - Private

- (NSString *)secondsStringWithDelta:(NSTimeInterval)delta
{
    NSInteger seconds = (NSInteger)delta;
    return [NSString stringWithFormat:@"%ld segundos", seconds];
}

- (NSString *)minutesStringWithDelta:(NSTimeInterval)delta
{
    NSInteger minutes = (NSInteger)(delta/60.);
    return [NSString stringWithFormat:@"%ld minutos", minutes];
}

- (NSString *)hoursStringWithDelta:(NSTimeInterval)delta
{
    NSInteger hours = (NSInteger)(delta/3600.);
    return [NSString stringWithFormat:@"%ld horas", hours];
}

- (NSString *)daysStringWithDelta:(NSTimeInterval)delta
{
    NSInteger days = (NSInteger)(delta/86400.);
    return [NSString stringWithFormat:@"%ld dias", days];
}

- (NSString *)olderDateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateStyle = NSDateFormatterMediumStyle;
    return [formatter stringFromDate:self];
}

@end
