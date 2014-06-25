//
//  AppDelegate.h
//  Youth-Hostel
//
//  Created by iqual on 5/31/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "LeftSlideBarViewController.h"

//@class MasterDetailController;
@class RevealController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic)IBOutlet UITextField *activeTextField;
@property (strong, nonatomic) RevealController *viewController;
@property ( nonatomic)BOOL isLogin;
//@property (strong, nonatomic) MasterDetailController *viewController;

@end
