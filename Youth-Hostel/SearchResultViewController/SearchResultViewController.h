//
//  SerachResultViewController.h
//  Youth-Hostel
//
//  Created by iqual on 6/16/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomSearchCell.h"
#import "HotelsDescriptionViewController.h"
#import "SCGIFImageView.h"
#import "SearchViewController.h"

@interface SearchResultViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{

}
@property(nonatomic,retain)NSMutableDictionary *dictSearchPlace;
@property(nonatomic,retain)IBOutlet SCGIFImageView* gifImageView;
@property(nonatomic,retain)IBOutlet UIView *backView;
@property(nonatomic,retain)IBOutlet UIView *popView;
@property(nonatomic,retain)IBOutlet UILabel *lblSearchingFor;
@property(nonatomic,retain)IBOutlet UILabel *lblSearchResultTitle;
@property(nonatomic,retain)IBOutlet UIButton *btnName;
@property(nonatomic,retain)IBOutlet UIButton*btnBestPrice;
@property(nonatomic,retain)IBOutlet UIButton*btnBestRating;
@property(nonatomic,retain)IBOutlet UIButton*btnSafest;
@property(nonatomic,retain)IBOutlet UIButton*btnBestLocation;
-(IBAction)backButtonClick:(id)sender;
-(IBAction)btnNameClick:(id)sender;
-(IBAction)btnBestPriceClick:(id)sender;
-(IBAction)btnBestRatingClick:(id)sender;
-(IBAction)btnSafestClick:(id)sender;
-(IBAction)btnBestLocationClick:(id)sender;
-(IBAction)btnSearchClick:(id)sender;


@end
