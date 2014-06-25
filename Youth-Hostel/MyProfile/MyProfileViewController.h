//
//  MyProfileViewController.h
//  Youth-Hostel
//
//  Created by iqual on 6/14/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewController.h"
#import "AppDelegate.h"
@interface MyProfileViewController : UIViewController<UITextFieldDelegate>
{
    AppDelegate *appDel;
}
-(IBAction)checkBoxButtonClick:(id)sender;
-(IBAction)btnSearchClick:(id)sender;

@end
