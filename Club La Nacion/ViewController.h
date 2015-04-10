//
//  ViewController.h
//  Club La Nacion
//
//  Created by Gera on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LNClubBackend, LNBenefitRepository;

@interface ViewController : UIViewController
@property (nonatomic,strong) LNClubBackend * backend;
@property (nonatomic,strong) LNBenefitRepository * repository;


@end

