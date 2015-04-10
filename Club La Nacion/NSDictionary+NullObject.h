//
//  NSDictionary+NullObject.h
//  Club La Nacion
//
//  Created by Gera on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (NullObject)

- (id)safeObjectForKey:(NSString *)key;

@end
