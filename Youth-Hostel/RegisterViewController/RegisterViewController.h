//
//  RegisterViewController.h
//  Youth-Hostel
//
//  Created by iqual on 6/14/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface RegisterViewController : UIViewController<UITextFieldDelegate>
{
    UIView *headerView;
    AppDelegate *appDel;


}
-(IBAction)backButtonClick:(id)sender;
-(IBAction)checkBoxButtonClick:(id)sender;
@end
