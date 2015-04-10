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
#import "NSDictionary+NullObject.h"
#import "NSString+toDate.h"

@implementation LNBenefit
+(LNBenefit *)benefitWithDictionary:(NSDictionary *)benefitDictionary
{
    LNBenefit * benefit = [[LNBenefit alloc]init];
    benefit.benefitId = [benefitDictionary safeObjectForKey:@"id"];
    

//    NSString * imagesString = [benefitDictionary safeObjectForKey:@"imagen"];
//    benefit.benefitImages = [benefit getImagesFromString:imagesString];
    benefit.benefitImages = [benefit getImagesFromString:@"nombre=10041.jpg:Tipo=12:Great=0-nombre=10610.jpg:Tipo=12:Great=0-nombre=19683.jpg:Tipo=2:Great=0"];
    
    NSString * sinceString = [benefitDictionary safeObjectForKey:@"desde"];
    benefit.benefitSinceDate = [sinceString toDate];
    NSString * toString = [benefitDictionary safeObjectForKey:@"hasta"];
    benefit.benefitToDate = [toString toDate];

    
    benefit.benefitLocation = [[CLLocation alloc] initWithLatitude:[[benefitDictionary[@"point"] objectAtIndex:0] doubleValue]  longitude:[[benefitDictionary[@"point"] objectAtIndex:1]doubleValue]];
    
    benefit.benefitData = [LNBenefitData benefitDataWithDictionary:benefitDictionary[@"beneficio"]];
    benefit.benefitBusiness = [LNBusiness businessWithDictionary:benefitDictionary[@"establecimiento"]];
    
    return benefit;
}
-(id)initWithDictionary:(NSDictionary *)dictionary
{
    if ( self = [super init])
    {
        self.benefitId = [dictionary safeObjectForKey:@"id"];
        
        self.benefitImages = [self getImagesFromString:@"nombre=10041.jpg:Tipo=12:Great=0-nombre=10610.jpg:Tipo=12:Great=0-nombre=19683.jpg:Tipo=2:Great=0"];
        
        NSString * sinceString = [dictionary safeObjectForKey:@"desde"];
        self.benefitSinceDate = [sinceString toDate];
        NSString * toString = [dictionary safeObjectForKey:@"hasta"];
        self.benefitToDate = [toString toDate];
        
        
        self.benefitLocation = [[CLLocation alloc] initWithLatitude:[[dictionary[@"point"] objectAtIndex:0] doubleValue]  longitude:[[dictionary[@"point"] objectAtIndex:1]doubleValue]];
        
        self.benefitData = [LNBenefitData benefitDataWithDictionary:dictionary[@"beneficio"]];
        self.benefitBusiness = [LNBusiness businessWithDictionary:dictionary[@"establecimiento"]];
    }
    return self;
}
-(NSArray *)getImagesFromString:(NSString *)initialString
{
    NSMutableArray * imageNamesArray = [[NSMutableArray alloc]init];
    
    NSArray * imagesStringArray = [initialString componentsSeparatedByString:@"-"];
    for (NSString *imageString in imagesStringArray)
    {
        NSArray * imageComponentsArray = [imageString componentsSeparatedByString:@":"];
        for (NSString *componentString in imageComponentsArray)
        {
            NSArray *valueAndKeyArray = [componentString componentsSeparatedByString:@"="];
            if ([[valueAndKeyArray objectAtIndex:0] isEqualToString:@"nombre"])
            {
                NSString * finalUrlToImage = [NSString stringWithFormat:@"http://club.lanacion.com.ar/imagenes/%@",[valueAndKeyArray objectAtIndex:1]];
                [imageNamesArray addObject:finalUrlToImage];
            }
        }
    }
    
    return [NSArray arrayWithArray:imageNamesArray];
}
@end
