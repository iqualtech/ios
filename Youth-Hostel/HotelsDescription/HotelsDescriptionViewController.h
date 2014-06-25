//
//  HotelsDescriptionViewController.h
//  Youth-Hostel
//
//  Created by iqual on 6/17/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookingDetailViewController.h"
#import "Map_DirectionViewController.h"
#import "SearchViewController.h"

@interface HotelsDescriptionViewController : UIViewController<UITextViewDelegate>
{

}
@property(nonatomic,retain)IBOutlet    UIView  *popView;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *view2;

@property(nonatomic,retain)IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imgHotel;
@property (weak, nonatomic) IBOutlet UILabel *lbl1;
@property (weak, nonatomic) IBOutlet UILabel *lbl2;
@property (weak, nonatomic) IBOutlet UILabel *lbl3;
@property (weak, nonatomic) IBOutlet UIButton *btnReadMore;


-(IBAction)btnBookNowClick:(id)sender;
-(IBAction)btnMap_DirectionClick:(id)sender;
-(IBAction)btnReviewClick:(id)sender;
-(IBAction)btnOKClick:(id)sender;
-(IBAction)btnCancelClick:(id)sender;
-(IBAction)btnSearchClick:(id)sender;
-(IBAction)btnReadMoreClick:(id)sender;

@end
