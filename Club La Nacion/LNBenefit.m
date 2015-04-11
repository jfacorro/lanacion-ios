//
//  LNBenefit.m
//  Club La Nacion
//
//  Created by Gera on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "LNBenefit.h"
#import "NSDictionary+NullObject.h"
#import "NSString+toDate.h"

@implementation LNBenefit
+(LNBenefit *)benefitWithDictionary:(NSDictionary *)benefitDictionary
{
    LNBenefit * benefit = [[LNBenefit alloc]initWithDictionary:benefitDictionary];
    return benefit;
}

-(id)initWithDictionary:(NSDictionary *)dictionary
{
    if ( self = [super init])
    {
        self.benefitId = [dictionary safeObjectForKey:@"id"];
        
        self.benefitImages = [self getImagesFromString:[dictionary safeObjectForKey:@"imagen"]];
        
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

- (CLLocationCoordinate2D) coordinate
{
    return self.benefitLocation.coordinate;
}

- (NSString*) title
{
    return self.benefitData.nombre;
}

- (NSString*) subtitle
{
    return [NSString stringWithFormat:@"%@ %@", self.benefitData.tipo, self.benefitData.descripcion];
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
