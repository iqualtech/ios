//
//  LoginViewController.h
//  Youth-Hostel
//
//  Created by iqual on 5/31/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyAccountViewController.h"
#import "AppDelegate.h"

@interface LoginViewController : UIViewController<UITextFieldDelegate>
{
    AppDelegate *appDel;
}
@property(nonatomic,retain)IBOutlet UITextField *tfEmailAddress;
@property(nonatomic,retain)IBOutlet UITextField *tfPassword;
-(IBAction)loginButtonClick:(id)sender;
@end
