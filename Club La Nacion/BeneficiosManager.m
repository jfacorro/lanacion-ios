//
//  BeneficiosManager.m
//  Club La Nacion
//
//  Created by Sebastian Cancinos on 4/11/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "BeneficiosManager.h"
#import "LNClubBackend.h"
#import "LNBenefitRepository.h"
#import "CategoriasProvider.h"


@interface BeneficiosManager ()

@property (nonatomic,strong) LNClubBackend *backend;
@property (nonatomic,strong) LNBenefitRepository *repository;
@property (nonatomic, strong) CLLocationManager* locationManager;

@end


@implementation BeneficiosManager

- (id) init
{
    self = [super init];
    if(self)
    {
        self.backend = [[LNClubBackend alloc]init];
        self.repository = [[LNBenefitRepository alloc]initWithBackend:self.backend];
//        self.repository.serverUrl = @"http://lanacion.herokuapp.com/api";
        self.repository.serverUrl = @"http://23.23.128.233:8080/api";
    }
    
    return self;
}

- (void)loadBeneficiosByLocation:(CLLocationCoordinate2D) coordinate
{
    self.repository.basePath = [NSString stringWithFormat:@"geo/%f/%f/200",coordinate.latitude,coordinate.longitude];
    
    [self.repository findAllDocumentsWithSuccess:^(NSArray *documents) {
        self.benefitsArray = [NSArray arrayWithArray:documents];
        [self.delegate BeneficiosManager:self updatedBeneficios:self.benefitsArray];
    } failure:^(IJError *error) {
        //UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Ocurrio un error. Intente de nuevo" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles:nil];
        //[alert show];
        NSLog(@"failure");
    }];
}

- (void)loadBeneficiosByCategoria:(BeneficiosCategoriasEnum) categoria
{
    self.repository.basePath = [NSString stringWithFormat:@"categoria/%@", [[CategoriasProvider descriptionForCategoria:categoria] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    [self.repository findAllDocumentsWithSuccess:^(NSArray *documents) {
        self.benefitsArray = [NSArray arrayWithArray:documents];
        [self.delegate BeneficiosManager:self updatedBeneficios:self.benefitsArray];
    } failure:^(IJError *error) {
        //UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Ocurrio un error. Intente de nuevo" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles:nil];
        //[alert show];
        NSLog(@"failure");
    }];
}

@end
