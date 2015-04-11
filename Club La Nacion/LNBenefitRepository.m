//
//  LNBenefitRepository.m
//  Club La Nacion
//
//  Created by Gera on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "LNBenefitRepository.h"
#import "LNBenefit.h"

@implementation LNBenefitRepository
-(id)initWithBackend:(IJAbstractBackend *)backend
{
    if (self = [super init])
    {
        self.backend = backend;
    }
    return self;
}

-(id<IJDocumentProtocol>)writeDocumentWithResponseObject:(NSDictionary *)responseObject
{
    return [LNBenefit benefitWithDictionary:responseObject];
}
@end
