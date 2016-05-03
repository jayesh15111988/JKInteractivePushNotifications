//
//  AppDelegate.m
//  JKInteractivePushNotifications
//
//  Created by Jayesh Kawli Backup on 5/2/16.
//  Copyright © 2016 Jayesh Kawli Backup. All rights reserved.
//

#import "AppDelegate.h"

NSString* const RegularNotificationOK = @"RegularButtonOKAction";
NSString* const RegularNotificationCancel = @"RegularButtonCancelAction";
NSString* const RegularNotificationTextInputOK = @"TextInputOkAction";
NSString* const RegularNotificationTextInputCancel = @"TextInputCancelAction";
NSString* const RegularButtonCategoryIdentifier = @"RegularButtonCategoryIdentifier";
NSString* const TextInputCategoryIdentifier = @"TextInputCategoryIdentifier";

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
    // Override point for customization after application launch.
    [self registerForNotification];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication*)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of
    // temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application
    // and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use
    // this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication*)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application
    // state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate:
    // when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication*)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes
    // made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication*)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application
    // was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication*)application {
    // Called when the application is about to terminate. Save data if appropriate. See also
    // applicationDidEnterBackground:.
}

- (void)application:(UIApplication*)application
handleActionWithIdentifier:(nullable NSString*)identifier
forRemoteNotification:(NSDictionary*)userInfo
   withResponseInfo:(NSDictionary*)responseInfo
  completionHandler:(void (^) ())completionHandler {
    if ([identifier isEqualToString:RegularNotificationCancel]) {
        NSLog (@"User Pressed Cancel Button");
    } else if ([identifier isEqualToString:RegularNotificationOK]) {
        NSLog (@"User Pressed OK Button");
    } else if ([identifier isEqualToString:RegularNotificationTextInputCancel]) {
        NSLog (@"User Pressed Cancel button for text input action");
    } else if ([identifier isEqualToString:RegularNotificationTextInputOK]) {
        NSString* comment = responseInfo[UIUserNotificationActionResponseTypedTextKey];
        if (comment.length > 0) {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"User Entered Input"
                                                            message:comment
                                                           delegate:nil
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"OK", nil];
            [alert show];
            NSLog (@"User entered commend %@", comment);
        }
    }
    
    if (completionHandler) {
        completionHandler ();
    }
}

- (void)application:(UIApplication*)application
handleActionWithIdentifier:(NSString*)identifier
forRemoteNotification:(NSDictionary*)userInfo
  completionHandler:(void (^) ())completionHandler {
    if ([identifier isEqualToString:RegularNotificationCancel]) {
        NSLog (@"User Pressed Cancel Button");
    } else if ([identifier isEqualToString:RegularNotificationOK]) {
        NSLog (@"User Pressed OK Button");
    } else if ([identifier isEqualToString:RegularNotificationTextInputCancel]) {
        NSLog (@"User Pressed Cancel button for text input action");
    } else if ([identifier isEqualToString:RegularNotificationTextInputOK]) {
        NSLog (@"User Pressed OK button for text input action");
    }
    if (completionHandler) {
        completionHandler ();
    }
}

#pragma Code to setup push notifications.
- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {
    NSString* token = [NSString stringWithFormat:@"%@", deviceToken];
    // Format token as you need:
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@">" withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@"<" withString:@""];
    NSLog (@"%@", token);
}

- (void)registerForNotification {
    
    UIMutableUserNotificationAction* action1;
    action1 = [[UIMutableUserNotificationAction alloc] init];
    [action1 setActivationMode:UIUserNotificationActivationModeBackground];
    [action1 setTitle:@"Cancel"];
    [action1 setIdentifier:RegularNotificationCancel];
    [action1 setDestructive:YES];
    [action1 setAuthenticationRequired:NO];
    
    UIMutableUserNotificationAction* action2;
    action2 = [[UIMutableUserNotificationAction alloc] init];
    [action2 setActivationMode:UIUserNotificationActivationModeForeground];
    [action2 setTitle:@"OK"];
    [action2 setBehavior:UIUserNotificationActionBehaviorDefault];
    [action2 setIdentifier:RegularNotificationOK];
    [action2 setDestructive:NO];
    [action2 setAuthenticationRequired:YES];
    
    UIMutableUserNotificationCategory* actionCategory;
    actionCategory = [[UIMutableUserNotificationCategory alloc] init];
    [actionCategory setIdentifier:RegularButtonCategoryIdentifier];
    [actionCategory setActions:@[ action1, action2 ] forContext:UIUserNotificationActionContextDefault];
    
    UIMutableUserNotificationAction* action3;
    action3 = [[UIMutableUserNotificationAction alloc] init];
    [action3 setActivationMode:UIUserNotificationActivationModeBackground];
    [action3 setTitle:@"Cancel"];
    [action3 setIdentifier:RegularNotificationTextInputCancel];
    [action3 setDestructive:YES];
    [action3 setAuthenticationRequired:NO];
    
    UIMutableUserNotificationAction* action4;
    action4 = [[UIMutableUserNotificationAction alloc] init];
    [action4 setActivationMode:UIUserNotificationActivationModeBackground];
    [action4 setTitle:@"OK"];
    [action4 setBehavior:UIUserNotificationActionBehaviorTextInput];
    [action4 setIdentifier:RegularNotificationTextInputOK];
    [action4 setDestructive:NO];
    [action4 setAuthenticationRequired:NO];
    
    UIMutableUserNotificationCategory* actionCategory2;
    actionCategory2 = [[UIMutableUserNotificationCategory alloc] init];
    [actionCategory2 setIdentifier:TextInputCategoryIdentifier];
    [actionCategory2 setActions:@[ action3, action4 ] forContext:UIUserNotificationActionContextDefault];
    
    NSSet* categories = [NSSet setWithObjects:actionCategory, actionCategory2, nil];
    UIUserNotificationType types =
    (UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge);
    
    UIUserNotificationSettings* settings = [UIUserNotificationSettings settingsForTypes:types categories:categories];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
}

- (void)application:(UIApplication*)application didReceiveRemoteNotification:(NSDictionary*)userInfo {
    NSLog (@"Received Push notification with user info %@", userInfo);
}

@end
