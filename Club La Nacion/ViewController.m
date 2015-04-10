//
//  ViewController.m
//  Club La Nacion
//
//  Created by Gera on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "ViewController.h"

#import "LNClubBackend.h"
#import "LNBenefitRepository.h"
#import "LNBenefit.h"
#import "NSDate+TimeAgo.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.backend = [[LNClubBackend alloc]init];
    self.repository = [[LNBenefitRepository alloc]initWithBackend:self.backend];
    self.repository.serverUrl = @"http://23.23.128.233:8080/api";
    self.repository.basePath = @"categoria/";

    NSString *parametersPath = @"Cuidado%20Personal";
    self.repository.basePath = [self.repository.basePath stringByAppendingString:parametersPath];
    [self.repository findAllDocumentsWithSuccess:^(NSArray *documents) {
        NSLog(@"success");
    } failure:^(IJError *error) {
        NSLog(@"failure");
    }];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSDictionary *)fakeDictionary
{
    NSDictionary *businessTestDictionary = @{@"id":@"123987",
                                             @"sucursal":@"106990",
                                             @"direccion":@"Yerbal 288",
                                             @"nombre":@"Le Parc",
                                             @"descripcion":@"Descripcion de establecimiento",
                                             @"detalle":@"Detalle de establecimiento!!!!!"};
    NSDictionary *benefitDataTestDictionary = @{@"categoria":@"Cuidado Personal",
                                                @"descripcion":@"Sobre la factura total en tratamientos!",
                                                @"subcategoria":@"Centros Esteticos",
                                                @"tarjeta":@"Premium",
                                                @"id":@"98765",
                                                @"nombre":@"Re salud y estetica",
                                                @"tipo":@"20%"};
    
    NSDictionary *testDictionary = @{@"id":@"123456 ",
                                     @"imagem":@"nombre=15290.jpg:Tipo=2:Great=0-nombre=15291.jpg:Tipo=12:Great=0",
                                     @"hasta":@"2015-04-10T00:10:00.000Z",
                                     @"desde":@"2015-04-10T00:10:00.000Z",
                                     @"point":@[@"-34.61643",@"-58.43297"],
                                     @"beneficio":benefitDataTestDictionary,
                                     @"establecimiento":businessTestDictionary};
    return testDictionary;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
