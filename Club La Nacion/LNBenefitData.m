//
//  LNBenefitData.m
//  Club La Nacion
//
//  Created by Gera on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "LNBenefitData.h"
#import "NSDictionary+NullObject.h"

@implementation LNBenefitData

+(LNBenefitData *)benefitDataWithDictionary:(NSDictionary *)benefitDataDictionary
{
    LNBenefitData *benefitData = [[LNBenefitData alloc] init];
    
    for (NSString * keyString in benefitDataDictionary.allKeys)
    {
        
        NSLog(@"%@",keyString);
        if ([keyString isEqualToString:@"id"])
        {
            benefitData.benefitDataId = [[benefitDataDictionary safeObjectForKey:keyString] integerValue];
            continue;
        }else
        {
            [benefitData setValue:[benefitDataDictionary safeObjectForKey:keyString] forKey:keyString];
        }
    }
    
    return benefitData;
}

@end
