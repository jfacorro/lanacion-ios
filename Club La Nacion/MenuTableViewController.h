//
//  MenuTableViewController.h
//  Club La Nacion
//
//  Created by Sebastian Cancinos on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationDelegate.h"

@interface MenuTableViewController : UITableViewController

@property (nonatomic, weak) id<NavigationDelegate> delegate;
@end
