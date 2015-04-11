//
//  NavigationDelegate.h
//  Club La Nacion
//
//  Created by Sebastian Cancinos on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#ifndef Club_La_Nacion_NavigationDelegate_h
#define Club_La_Nacion_NavigationDelegate_h

#import "BeneficiosCategoriasEnum.h"

@protocol NavigationDelegate <NSObject>

- (void) showMapa;
- (void) showConfiguracion;
- (void) showBeneficios:(BeneficiosCategoriasEnum) categoria;

@end
#endif
