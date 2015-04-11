//
//  AppDelegate.m
//  Club La Nacion
//
//  Created by Gera on 4/10/15.
//  Copyright (c) 2015 inaka. All rights reserved.
//

#import "AppDelegate.h"
#import "BeneficiosManager.h"
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate () <CLLocationManagerDelegate, BeneficiosManagerDelegate>

@property (nonatomic, strong) BeneficiosManager *beneficiosManager;
@property (nonatomic, strong) CLLocationManager *locationManager;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.locationManager = [[CLLocationManager alloc] init];
    if([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)])
        [self.locationManager requestAlwaysAuthorization];
    
    [self.locationManager setDelegate:self];
    [self.locationManager setDistanceFilter:50.f];
    [self.locationManager startUpdatingLocation];
    [self.locationManager startMonitoringSignificantLocationChanges];
    [self.locationManager setPausesLocationUpdatesAutomatically:NO];
    
    self.beneficiosManager = [[BeneficiosManager alloc] init];
    self.beneficiosManager.delegate = self;
    
//    [self registerAppForPushNotifications:application];
    
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]) {
        [[UIApplication sharedApplication] registerUserNotificationSettings:
         [UIUserNotificationSettings settingsForTypes:
          UIUserNotificationTypeAlert|UIUserNotificationTypeSound|UIUserNotificationTypeBadge
                                                     categories:nil]];
    }
    
    return YES;
}

- (void)registerAppForPushNotifications:(UIApplication *)application
{
    // Register for Push Notitications, if running iOS 8
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)])
    {
        UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |
                                                        UIUserNotificationTypeBadge |
                                                        UIUserNotificationTypeSound);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes
                                                                                 categories:nil];
        [application registerUserNotificationSettings:settings];
        [application registerForRemoteNotifications];
    }
    else
    {
        // Register for Push Notifications before iOS 8
        [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                         UIRemoteNotificationTypeAlert |
                                                         UIRemoteNotificationTypeSound)];
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSLog(@"%@",deviceToken);
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    NSLog(@"Push notification arrived: %@", userInfo);
//    if (application.applicationState != UIApplicationStateActive)
//    {
//        HyPushNotificationNavigationHandler *handler = [HyPushNotificationNavigationHandler handler];
//        handler.pushNotificationInfo = userInfo;
//        [handler navigateAccordingToPushNotification];
//    }
}

- (void) application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    if (application.applicationState == UIApplicationStateActive)
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:notification.alertAction message:notification.alertBody delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil];
        [alert show];
    }
}

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation* lastLocation = [locations lastObject];
    [self.beneficiosManager loadNearBeneficiosByLocation:lastLocation.coordinate];
}

- (void) BeneficiosManager:(BeneficiosManager *)manager updatedBeneficios:(NSArray *)beneficios
{
    if(beneficios.count > 0)
    {
        UILocalNotification* localNotification = [[UILocalNotification alloc] init];
        localNotification.fireDate = [NSDate date];
        localNotification.timeZone = [NSTimeZone defaultTimeZone];

        localNotification.alertBody = [NSString stringWithFormat:@"Hay %ld beneficios cerca tuyo",(unsigned long)beneficios.count];
        localNotification.alertAction = @"Hay beneficios para aprovechar";
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
}
@end
