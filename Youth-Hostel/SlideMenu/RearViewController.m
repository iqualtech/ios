//
//  SlideMenuViewController.m
//  Youth-Hostel
//
//  Created by iqual on 6/14/14.
//  Copyright (c) 2014 iqual. All rights reserved.
//

#import "RearViewController.h"
#import "RevealController.h"
#import "LoginViewController.h"




@interface RearViewController ()

@end

@implementation RearViewController
@synthesize mainTableView;
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
    appDel = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if (appDel.isLogin==TRUE)
    {
        [mainTableView reloadData];
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int row;
    if (appDel.isLogin==TRUE)
    {
        row =6;
    }
    else
    {
        row =5;
    }

    return row;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RearViewCell *cell = (RearViewCell*)[tableView dequeueReusableCellWithIdentifier:@"RearViewCell"];
    if (cell == nil)
    {
        NSArray *top = [[NSBundle mainBundle] loadNibNamed:@"RearViewCell" owner:self options:nil];
        for (id t in top)
        {
            if ([t isKindOfClass:[UITableViewCell class]])
            {
                cell =(RearViewCell*)t;
                break;
            }
        }
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;

    if (appDel.isLogin==FALSE)
    {
        if (indexPath.row ==0)
        {
            [cell.btnIcon setBackgroundImage:[UIImage imageNamed:@"serch_icon"] forState:UIControlStateNormal];
            [cell.btnIcon setTag:11];
            [cell.btnIcon addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            
            [cell.btnContent setTitle:@"Search" forState:UIControlStateNormal];
            [cell.btnContent.titleLabel setFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]];
            [cell.btnContent setTag:12];
            [cell.btnContent addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if (indexPath.row ==1)
        {
            [cell.btnIcon setBackgroundImage:[UIImage imageNamed:@"near_by_icon"] forState:UIControlStateNormal];
            [cell.btnIcon setTag:21];
            [cell.btnIcon addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell.btnContent setTitle:@"Near by Hotels" forState:UIControlStateNormal];
            [cell.btnContent.titleLabel setFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]];
            [cell.btnContent setTag:22];
            [cell.btnContent addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if (indexPath.row ==2)
        {
            [cell.btnIcon setBackgroundImage:[UIImage imageNamed:@"login_lock_icon"] forState:UIControlStateNormal];
            [cell.btnIcon setTag:31];
            [cell.btnIcon addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell.btnContent setTitle:@"Login" forState:UIControlStateNormal];
            [cell.btnContent.titleLabel setFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]];
            [cell.btnContent setTag:32];
            [cell.btnContent addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if (indexPath.row ==3)
        {
            [cell.btnIcon setBackgroundImage:[UIImage imageNamed:@"register_icon"] forState:UIControlStateNormal];
            [cell.btnIcon setTag:41];
            [cell.btnIcon addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell.btnContent setTitle:@"Register" forState:UIControlStateNormal];
            [cell.btnContent.titleLabel setFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]];
            [cell.btnContent setTag:42];
            [cell.btnContent addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if (indexPath.row ==4)
        {
            
            [cell.btnIcon setBackgroundImage:[UIImage imageNamed:@"setting_icon"] forState:UIControlStateNormal];
            [cell.btnIcon setTag:51];
            [cell.btnIcon addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell.btnContent setTitle:@"Settings" forState:UIControlStateNormal];
            [cell.btnContent.titleLabel setFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]];
            [cell.btnContent setTag:52];
            [cell.btnContent addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        }

    }
    else
    {
        if (indexPath.row ==0)
        {
            [cell.btnIcon setBackgroundImage:[UIImage imageNamed:@"serch_icon"] forState:UIControlStateNormal];
            [cell.btnIcon setTag:11];
            [cell.btnIcon addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            
            [cell.btnContent setTitle:@"Search" forState:UIControlStateNormal];
            [cell.btnContent.titleLabel setFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]];
            [cell.btnContent setTag:12];
            [cell.btnContent addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if (indexPath.row ==1)
        {
            [cell.btnIcon setBackgroundImage:[UIImage imageNamed:@"near_by_icon"] forState:UIControlStateNormal];
            [cell.btnIcon setTag:21];
            [cell.btnIcon addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            
            [cell.btnContent setTitle:@"Near by Hotels" forState:UIControlStateNormal];
            [cell.btnContent.titleLabel setFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]];
            [cell.btnContent setTag:22];
            [cell.btnContent addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if (indexPath.row ==2)
        {
            [cell.btnIcon setBackgroundImage:[UIImage imageNamed:@"myac_icon"] forState:UIControlStateNormal];
            [cell.btnIcon setTag:31];
            [cell.btnIcon addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            
            [cell.btnContent setTitle:@"My Account" forState:UIControlStateNormal];
            [cell.btnContent.titleLabel setFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]];
            [cell.btnContent setTag:32];
            [cell.btnContent addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if (indexPath.row ==3)
        {
            
            [cell.btnIcon setBackgroundImage:[UIImage imageNamed:@"fav_icon"] forState:UIControlStateNormal];
            [cell.btnIcon setTag:41];
            [cell.btnIcon addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            
            [cell.btnContent setTitle:@"My Favourites" forState:UIControlStateNormal];
            [cell.btnContent.titleLabel setFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]];
            [cell.btnContent setTag:42];
            [cell.btnContent addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if (indexPath.row ==4)
        {
            [cell.btnIcon setBackgroundImage:[UIImage imageNamed:@"setting_icon"] forState:UIControlStateNormal];
            [cell.btnIcon setTag:51];
            [cell.btnIcon addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            
            [cell.btnContent setTitle:@"Settings" forState:UIControlStateNormal];
            [cell.btnContent.titleLabel setFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]];
            [cell.btnContent setTag:52];
            [cell.btnContent addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if (indexPath.row ==5)
        {
            
            [cell.btnIcon setBackgroundImage:[UIImage imageNamed:@"logout_icon"] forState:UIControlStateNormal];
            [cell.btnIcon setTag:61];
            [cell.btnIcon addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            
            [cell.btnContent setTitle:@"Signout" forState:UIControlStateNormal];
            [cell.btnContent.titleLabel setFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]];
            [cell.btnContent setTag:62];
            [cell.btnContent addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return cell;
}

-(IBAction)btnClick:(id)sender
{
    UIButton *btnSelected = (UIButton *)sender;
    RevealController *revealController = [self.parentViewController isKindOfClass:[RevealController class]] ? (RevealController *)self.parentViewController : nil;
    
    if (appDel.isLogin==FALSE)
    {
        if (btnSelected.tag==11||btnSelected.tag==12)
        {
            if ([revealController.frontViewController isKindOfClass:[UINavigationController class]] && ![((UINavigationController *)revealController.frontViewController).topViewController isKindOfClass:[SearchViewController class]])
            {
                SearchViewController *searchViewController = [[SearchViewController alloc]init];
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:searchViewController];
                [revealController setFrontViewController:navigationController animated:NO];
                
            }
            // Seems the user attempts to 'switch' to exactly the same controller he came from!
            else
            {
                [revealController revealToggle:self];
            }
            
        }
        else if (btnSelected.tag==21||btnSelected.tag==22)
        {
            NSLog(@"Near by Hotels");
        }
        else if (btnSelected.tag==31||btnSelected.tag==32)
        {
            if ([revealController.frontViewController isKindOfClass:[UINavigationController class]] && ![((UINavigationController *)revealController.frontViewController).topViewController isKindOfClass:[LoginViewController class]])
            {
                LoginViewController *login = [[LoginViewController alloc]init];
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:login];
                [revealController setFrontViewController:navigationController animated:NO];
            }
            // Seems the user attempts to 'switch' to exactly the same controller he came from!
            else
            {
                [revealController revealToggle:self];
            }
        }
        else if (btnSelected.tag==41||btnSelected.tag==42)
        {
            if ([revealController.frontViewController isKindOfClass:[UINavigationController class]] && ![((UINavigationController *)revealController.frontViewController).topViewController isKindOfClass:[RegisterViewController class]])
            {
                RegisterViewController *registerViewController =[[RegisterViewController alloc]init];
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:registerViewController];
                [revealController setFrontViewController:navigationController animated:NO];
            }
            // Seems the user attempts to 'switch' to exactly the same controller he came from!
            else
            {
                [revealController revealToggle:self];
            }
        }
        else if (btnSelected.tag==51||btnSelected.tag==52)
        {
            NSLog(@"Setting =====%@",btnSelected.titleLabel.text);
        }

    }
    else
    {
        if (btnSelected.tag==11||btnSelected.tag==12)
        {
            if ([revealController.frontViewController isKindOfClass:[UINavigationController class]] && ![((UINavigationController *)revealController.frontViewController).topViewController isKindOfClass:[SearchViewController class]])
            {
                SearchViewController *searchViewController = [[SearchViewController alloc]init];
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:searchViewController];
                [revealController setFrontViewController:navigationController animated:NO];
                
            }
            // Seems the user attempts to 'switch' to exactly the same controller he came from!
            else
            {
                [revealController revealToggle:self];
            }
            
        }
        else if (btnSelected.tag==21||btnSelected.tag==22)
        {
            NSLog(@"Near by Hotels");
        }
        else if (btnSelected.tag==31||btnSelected.tag==32)
        {
            if ([revealController.frontViewController isKindOfClass:[UINavigationController class]] && ![((UINavigationController *)revealController.frontViewController).topViewController isKindOfClass:[MyProfileViewController class]])
            {
                MyProfileViewController *myProfile = [[MyProfileViewController alloc]init];
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:myProfile];
                [revealController setFrontViewController:navigationController animated:NO];
            }
            // Seems the user attempts to 'switch' to exactly the same controller he came from!
            else
            {
                [revealController revealToggle:self];
            }
        }
        else if (btnSelected.tag==41||btnSelected.tag==42)
        {
            if ([revealController.frontViewController isKindOfClass:[UINavigationController class]] && ![((UINavigationController *)revealController.frontViewController).topViewController isKindOfClass:[MyFavouritePropertyViewController class]])
            {
                MyFavouritePropertyViewController *myFavourite = [[MyFavouritePropertyViewController alloc]init];
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:myFavourite];
                [revealController setFrontViewController:navigationController animated:NO];
            }
            // Seems the user attempts to 'switch' to exactly the same controller he came from!
            else
            {
                [revealController revealToggle:self];
            }
        }
        else if (btnSelected.tag==51||btnSelected.tag==52)
        {
            NSLog(@"Setting =====%@",btnSelected.titleLabel.text);
        }
        else if (btnSelected.tag==61||btnSelected.tag==62)
        {
            appDel.isLogin = FALSE;
            [mainTableView reloadData];
            if ([revealController.frontViewController isKindOfClass:[UINavigationController class]] && ![((UINavigationController *)revealController.frontViewController).topViewController isKindOfClass:[LoginViewController class]])
            {
                LoginViewController *login = [[LoginViewController alloc]init];
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:login];
                [revealController setFrontViewController:navigationController animated:NO];
            }
            // Seems the user attempts to 'switch' to exactly the same controller he came from!
            else
            {
                [revealController revealToggle:self];
            }
        }
 
    }
    
    
   }
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
