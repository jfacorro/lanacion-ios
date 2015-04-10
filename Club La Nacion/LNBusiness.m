//
//  LNBusiness.m
//  Club La Nacion
//
//  Created by Gera on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "LNBusiness.h"
#import "NSDictionary+NullObject.h"

@implementation LNBusiness

+(LNBusiness *)businessWithDictionary:(NSDictionary *)businessDictionary
{
    LNBusiness *business = [[LNBusiness alloc] init];
    
    for (NSString * keyString in businessDictionary.allKeys)
    {
        if ([keyString isEqualToString:@"id"])
        {
            business.businessId = [businessDictionary[keyString] integerValue];
            continue;
        }else
        {
            [business setValue:[businessDictionary safeObjectForKey:keyString] forKey:keyString];
        }
    }
    
    return business;
}

@end
