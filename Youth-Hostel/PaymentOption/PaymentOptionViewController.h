//
//  PaymentOptionViewController.h
//  Youth-Hostel
//
//  Created by iqual on 6/17/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScanCreditCardViewController.h"
#import "BookingConfirmViewController.h"
#import "SearchViewController.h"

#import "AppDelegate.h"
@interface PaymentOptionViewController : UIViewController<UITextFieldDelegate>
{
    AppDelegate *appDel;
}
@property(nonatomic,retain)IBOutlet UIScrollView *scrollView;
-(IBAction)btnScanCreditCardClick:(id)sender;
-(IBAction)btnConfirmClick:(id)sender;
-(IBAction)btnCheckBoxClick:(id)sender;
-(IBAction)btnSearchClick:(id)sender;

@end
