//
//  MenuContainerViewController.m
//  Club La Nacion
//
//  Created by Sebastian Cancinos on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "MenuContainerViewController.h"
#import "MenuTableViewController.h"
#import "BeneficiosMapViewController.h"

@interface MenuContainerViewController ()

@property (nonatomic, strong) MenuTableViewController *menuView;
@end

@implementation MenuContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupView
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BeneficiosMapViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"BeneficiosMapViewController"];

    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [self setFrontViewController:navController];
    
    self.menuView = [storyboard instantiateViewControllerWithIdentifier:@"MenuTableViewController"];
    
    [self setRearViewController:self.menuView];
    self.shouldUseFrontViewOverlay = YES;

    [controller.navigationItem setLeftBarButtonItem:[self leftBarButton]];
    [controller.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    
}

- (UIBarButtonItem *)leftBarButton
{
    UIImage *bars = [UIImage imageNamed:@"menu"];

    UIBarButtonItem *button = [[UIBarButtonItem alloc ]initWithImage:bars style:UIBarButtonItemStylePlain target:self action:@selector(showSideMenu)];
    
    return button;
}

- (void) showSideMenu
{
    [self revealToggle:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
