//
//  MyAccountViewController.h
//  Youth-Hostel
//
//  Created by iqual on 6/14/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyBookingViewController.h"
#import "MyReviewViewController.h"
#import "MyProfileViewController.h"
#import "MyFavouritePropertyViewController.h"
#import "VisitHelpCenterViewController.h"
#import "ChangePasswordViewController.h"
#import "SearchViewController.h"

@interface MyAccountViewController : UIViewController
{
    
}
-(IBAction)backButtonClick:(id)sender;
-(IBAction)btnMyBookingClick:(id)sender;
-(IBAction)btnMyReviewClick:(id)sender;
-(IBAction)btnMyProfileClick:(id)sender;
-(IBAction)btnMyFavouriteClick:(id)sender;
-(IBAction)btnVisitHelpCenterClick:(id)sender;
-(IBAction)btnChangePasswordClick:(id)sender;
-(IBAction)btnSearchClick:(id)sender;

@end
