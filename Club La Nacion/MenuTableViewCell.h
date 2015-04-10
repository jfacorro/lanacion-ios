//
//  MenuTableViewCell.h
//  Club La Nacion
//
//  Created by Sebastian Cancinos on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuTableViewController.h"


@interface MenuTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel* menuLabel;
@property (nonatomic, assign) MenuOptionsCategoriasEnum categoria;

@end
