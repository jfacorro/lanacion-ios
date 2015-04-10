//
//  LNBenefit.m
//  Club La Nacion
//
//  Created by Gera on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "LNBenefit.h"
#import "LNBenefitData.h"
#import "LNBusiness.h"


@implementation LNBenefit
+(LNBenefit *)benefitWithDictionary:(NSDictionary *)benefitDictionary
{
    LNBenefit * benefit = [[LNBenefit alloc]init];
    
    for (NSString * keyString in benefitDictionary.allKeys)
    {
        if ([benefitDictionary[keyString] isKindOfClass:[NSDictionary class]])
            continue;
        
        [self setValue:[benefitDictionary objectForKey:keyString] forKey:keyString];
    }
    
    return benefit;
}
@end
