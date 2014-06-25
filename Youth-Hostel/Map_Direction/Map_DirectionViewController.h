//
//  Map_DirectionViewController.h
//  Youth-Hostel
//
//  Created by iqual on 6/17/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewController.h"

@interface Map_DirectionViewController : UIViewController
{
    
}
@property(nonatomic,retain)IBOutlet UIButton *btnByCar;
@property(nonatomic,retain)IBOutlet UIButton *btnByBus;
@property(nonatomic,retain)IBOutlet UIButton *btnByWalk;
@property(nonatomic,retain)IBOutlet UIButton *btnByCycle;
@property(nonatomic,retain)IBOutlet UIButton *btnCancel;

@property(nonatomic,retain)IBOutlet UIImageView *imgView;
-(IBAction)btnByCarClick:(id)sender;
-(IBAction)btnByBusClick:(id)sender;
-(IBAction)btnByWalkClick:(id)sender;
-(IBAction)btnByCycleClick:(id)sender;
-(IBAction)btnByCancelClick:(id)sender;
-(IBAction)btnSearchClick:(id)sender;

@end
