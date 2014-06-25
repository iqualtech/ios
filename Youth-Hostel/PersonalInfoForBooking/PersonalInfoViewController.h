//
//  PersonalInfoViewController.h
//  Youth-Hostel
//
//  Created by iqual on 6/17/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaymentOptionViewController.h"
#import "SearchViewController.h"
#import "ActionSheetStringPicker.h"
#import "AppDelegate.h"
@interface PersonalInfoViewController : UIViewController<UITextFieldDelegate>
{
    AppDelegate *appDel;
    NSMutableArray *arrCountry;
    NSMutableArray *arrGender;
}
@property (nonatomic, assign) NSInteger selectedIndex;

@property(nonatomic,retain)IBOutlet UIScrollView *scrollView;
@property(nonatomic,retain)IBOutlet UIButton *btnCountry;
@property(nonatomic,retain)IBOutlet UIButton *btnFemale;
@property(nonatomic,retain)IBOutlet UIButton *btnMale;
@property(nonatomic,retain)IBOutlet UIButton *btnTime;
@property(nonatomic,retain)IBOutlet UIDatePicker *datePicker;

@property(nonatomic,retain)IBOutlet UIView *datePickerView;



-(IBAction)btnTimeClick:(id)sender;
-(IBAction)btnCountryClick:(id)sender;
-(IBAction)btnNextClick:(id)sender;
-(IBAction)btnCheckBoxClick:(id)sender;
-(IBAction)btnSearchClick:(id)sender;
-(IBAction)btnFemaleClick:(id)sender;
-(IBAction)btnMaleClick:(id)sender;
-(IBAction)btnCancel_PickerClick:(id)sender;
-(IBAction)btnDone_PickerClick:(id)sender;
@end
