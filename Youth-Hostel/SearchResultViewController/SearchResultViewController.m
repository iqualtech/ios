//
//  SerachResultViewController.m
//  Youth-Hostel
//
//  Created by iqual on 6/16/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import "SearchResultViewController.h"
#import "ZUUIRevealController.h"
//#import "SvGifView.h"

@interface SearchResultViewController ()
{
    UIView *headerView;
//    SvGifView       *_gifView;

}
@end

@implementation SearchResultViewController
@synthesize dictSearchPlace;
@synthesize backView,gifImageView,popView,lblSearchingFor,lblSearchResultTitle;
@synthesize btnBestLocation,btnBestPrice,btnBestRating,btnName,btnSafest;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"str======%@",dictSearchPlace);
    
    [lblSearchingFor setText:[NSString stringWithFormat:@"Searching for %@ ,%@",[dictSearchPlace valueForKey:@"City"],[dictSearchPlace valueForKey:@"Country"]]];
    [lblSearchingFor setFont:[UIFont boldSystemFontOfSize:17]];
    
    
    
    [lblSearchResultTitle setText:[NSString stringWithFormat:@"Search results - %@ - %@",[dictSearchPlace valueForKey:@"City"],[dictSearchPlace valueForKey:@"Country"]]];
    
    
    

    [self.navigationController.navigationBar setTranslucent:NO];
//    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    [self.navigationItem setHidesBackButton:YES animated:NO];
    
    headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 66)];
    [self.navigationController.navigationBar addSubview:headerView];
    UIImageView *headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,  self.view.frame.size.width, 66)];
    [headerImageView setImage:[UIImage imageNamed:@"header.png"]];
    
    UIButton *btnSlide = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSlide.frame=CGRectMake(12, 15, 35, 35);
    [btnSlide setBackgroundImage:[UIImage imageNamed:@"ic_drawer"] forState:UIControlStateNormal];

    [btnSlide addTarget:self.navigationController.parentViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imgIconLauncher = [[UIImageView alloc]init];
    imgIconLauncher.image=[UIImage imageNamed:@"icon_launcher"];
    imgIconLauncher.frame = CGRectMake(60, 15, 35, 35);
    
    UIButton *btnSearch = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSearch.frame=CGRectMake(270, 15, 35, 35);
    [btnSearch setBackgroundImage:[UIImage imageNamed:@"icon_search"] forState:UIControlStateNormal];
    [btnSearch addTarget:self action:@selector(btnSearchClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [headerView addSubview:headerImageView];
    [headerView addSubview:btnSlide];
    [headerView addSubview:imgIconLauncher];
    [headerView addSubview:btnSearch];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"searching.gif" ofType:nil];
    NSData* imageData = [NSData dataWithContentsOfFile:filePath];
    
    [gifImageView setData:imageData];
    [UIView animateWithDuration:2
                     animations:^{popView.alpha = 0.0;}
                     completion:^(BOOL finished){ [popView removeFromSuperview];
                         [self.view addSubview:backView];
                     }];
}
-(IBAction)backButtonClick:(id)sender
{
    [headerView removeFromSuperview];
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)btnNameClick:(id)sender
{
    [btnName setSelected:YES];
    [btnBestPrice setSelected:NO];
    [btnBestRating setSelected:NO];
    [btnSafest setSelected:NO];
    [btnBestLocation setSelected:NO];
}
-(IBAction)btnBestPriceClick:(id)sender
{
    [btnName setSelected:NO];
    [btnBestPrice setSelected:YES];
    [btnBestRating setSelected:NO];
    [btnSafest setSelected:NO];
    [btnBestLocation setSelected:NO];
}
-(IBAction)btnBestRatingClick:(id)sender
{
    [btnName setSelected:NO];
    [btnBestPrice setSelected:NO];
    [btnBestRating setSelected:YES];
    [btnSafest setSelected:NO];
    [btnBestLocation setSelected:NO];
}
-(IBAction)btnSafestClick:(id)sender
{
    [btnName setSelected:NO];
    [btnBestPrice setSelected:NO];
    [btnBestRating setSelected:NO];
    [btnSafest setSelected:YES];
    [btnBestLocation setSelected:NO];
}
-(IBAction)btnBestLocationClick:(id)sender
{
    [btnName setSelected:NO];
    [btnBestPrice setSelected:NO];
    [btnBestRating setSelected:NO];
    [btnSafest setSelected:NO];
    [btnBestLocation setSelected:YES];
}
-(IBAction)btnSearchClick:(id)sender
{
    SearchViewController *searchView =[[SearchViewController alloc]init];
    [headerView removeFromSuperview];
    [self.navigationController pushViewController:searchView animated:YES];
}

#pragma mark Uitableview datasource/delegate method
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomSearchCell *cell = (CustomSearchCell*)[tableView dequeueReusableCellWithIdentifier:@"CustomSearchCell"];
    if (cell == nil)
    {
        NSArray *top = [[NSBundle mainBundle] loadNibNamed:@"CustomSearchCell" owner:self options:nil];
        for (id t in top)
        {
            if ([t isKindOfClass:[UITableViewCell class]])
            {
                cell =(CustomSearchCell*)t;
                break;
            }
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.imageView.image = [UIImage imageNamed:@"hotel_icon.png"];
    cell.btnShowAvailibility.tag = indexPath.row;
    [cell.btnShowAvailibility addTarget:self action:@selector(btnAvailibilityClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 96.00;
}

-(IBAction)btnAvailibilityClick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    NSLog(@"tag====%d",btn.tag);
    HotelsDescriptionViewController *hotel_Desc = [[HotelsDescriptionViewController alloc]init];
    [headerView removeFromSuperview];
    [self.navigationController pushViewController:hotel_Desc animated:YES];

}



//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    HotelsDescriptionViewController *hotel_Desc = [[HotelsDescriptionViewController alloc]init];
//    [headerView removeFromSuperview];
//    [self.navigationController pushViewController:hotel_Desc animated:YES];
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
