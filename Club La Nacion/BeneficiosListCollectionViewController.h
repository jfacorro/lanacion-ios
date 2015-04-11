//
//  BeneficiosListCollectionViewController.h
//  Club La Nacion
//
//  Created by Gera on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BeneficiosCategoriasEnum.h"


@interface BeneficiosListCollectionViewController : UICollectionViewController <UIAlertViewDelegate>

@property (nonatomic, assign) BeneficiosCategoriasEnum categoria;
@end
