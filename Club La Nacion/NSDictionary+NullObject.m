//
//  NSDictionary+NullObject.m
//  Club La Nacion
//
//  Created by Gera on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "NSDictionary+NullObject.h"

@implementation NSDictionary (NullObject)

- (id)safeObjectForKey:(NSString *)key
{
    return [self[key] isEqual:[NSNull null]] ? nil : self[key];
}

@end
