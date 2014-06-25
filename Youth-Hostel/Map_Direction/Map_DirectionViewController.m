//
//  Map_DirectionViewController.m
//  Youth-Hostel
//
//  Created by iqual on 6/17/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import "Map_DirectionViewController.h"
#import "ZUUIRevealController.h"
@interface Map_DirectionViewController ()
{
    UIView *headerView;
}
@end

@implementation Map_DirectionViewController
@synthesize btnByBus,btnByCar,btnByCycle,btnByWalk;
@synthesize imgView;
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
    [self.navigationController.navigationBar setTranslucent:NO];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    [self.navigationItem setHidesBackButton:YES animated:NO];
    
    headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 66)];
    [self.navigationController.navigationBar addSubview:headerView];
    UIImageView *headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,  self.view.frame.size.width, 66)];
    [headerImageView setImage:[UIImage imageNamed:@"header.png"]];
    
    UIButton *btnSlide = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSlide.frame=CGRectMake(12, 15, 35, 35);
    [btnSlide setBackgroundImage:[UIImage imageNamed:@"ic_drawer"] forState:UIControlStateNormal];
//    [btnSlide addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
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
}
-(IBAction)backButtonClick:(id)sender
{
    [headerView removeFromSuperview];
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)btnByCarClick:(id)sender
{
    [btnByBus setSelected:NO];
    [btnByCar setSelected:YES];
    [btnByCycle setSelected:NO];
    [btnByWalk setSelected:NO];
    [imgView setImage:[UIImage imageNamed:@"map_by_car"]];
}
-(IBAction)btnByBusClick:(id)sender
{
    [btnByBus setSelected:YES];
    [btnByCar setSelected:NO];
    [btnByCycle setSelected:NO];
    [btnByWalk setSelected:NO];
    [imgView setImage:[UIImage imageNamed:@"map_by_bus"]];
}
-(IBAction)btnByWalkClick:(id)sender
{
    [btnByBus setSelected:NO];
    [btnByCar setSelected:NO];
    [btnByCycle setSelected:NO];
    [btnByWalk setSelected:YES];
    [imgView setImage:[UIImage imageNamed:@"map_by_walk"]];
}
-(IBAction)btnByCycleClick:(id)sender
{
    [btnByBus setSelected:NO];
    [btnByCar setSelected:NO];
    [btnByCycle setSelected:YES];
    [btnByWalk setSelected:NO];
    [imgView setImage:[UIImage imageNamed:@"map_by_cycle"]];
}
-(IBAction)btnByCancelClick:(id)sender
{
    [headerView removeFromSuperview];
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)btnSearchClick:(id)sender
{
    SearchViewController *searchView =[[SearchViewController alloc]init];
    [headerView removeFromSuperview];
    [self.navigationController pushViewController:searchView animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
