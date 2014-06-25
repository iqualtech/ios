//
//  SearchViewController.h
//  Youth-Hostel
//
//  Created by iqual on 6/7/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchResultViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "ActionSheetPicker.h"
#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"

@class AbstractActionSheetPicker;




@interface SearchViewController : UIViewController<UITextFieldDelegate,CLLocationManagerDelegate>
{
    UITextField *activeTextField;
    AppDelegate *appDel;
    NSMutableArray *arrNights;
    NSMutableArray *arrGuests;

}
@property(nonatomic,retain)IBOutlet UITextField *tfCurrentLocation;
@property(nonatomic,retain)IBOutlet UIButton *btnSelectedDate;
@property (nonatomic, strong) AbstractActionSheetPicker *actionSheetPicker;
@property (nonatomic, strong) NSDate *selectedDate;
@property (nonatomic, assign) NSInteger selectedIndex;

@property (weak, nonatomic) IBOutlet UIButton *btnNights;
@property (weak, nonatomic) IBOutlet UIButton *btnGuests;

-(IBAction)backButtonClick:(id)sender;
-(IBAction)btnCurrentLocationClick:(id)sender;
- (IBAction)selectADate:(id)sender;
- (IBAction)btnSearchNowClick:(id)sender;
- (IBAction)btnNightsClick:(id)sender;
- (IBAction)btnGuestsClick:(id)sender;

- (void)btnNightsWasSelected:(NSNumber *)selectedIndex element:(id)element;
- (void)btnGuestsWasSelected:(NSNumber *)selectedIndex element:(id)element;


@end
