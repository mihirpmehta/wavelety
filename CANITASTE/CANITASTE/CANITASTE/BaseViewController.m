//
//  BaseViewController.m
//  CANITASTE
//
//  Created by mihir mehta on 01/04/14.
//  Copyright (c) 2014 mihir mehta. All rights reserved.
//

#import "BaseViewController.h"
#import "MenuView.h"

#define NAVIGATION_BAR_HEIGHT  [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? 64 : 44

@interface BaseViewController ()

@end

@implementation BaseViewController

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
    if (IS_iOS7) {
         self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
   
     [self createCustomNavigationBar];
	// Do any additional setup after loading the view.
}
-(void) viewDidLayoutSubviews
{
    //[self.customNavigationBar setFrame:CGRectMake(0, 0, 320, 60)];
    //[self.customNavigationBar setBounds:CGRectMake(0, 0, 320, 60)];
}
#pragma marks UI Creation methods
-(void) createCustomNavigationBar
{
    self.customNavigationBar = [[MenuView alloc] initWithNib];
    self.customNavigationBar.autoresizingMask = UIViewAutoresizingFlexibleHeight;
   // self.customNavigationBar.autoresizesSubviews = TRUE;
    [self.customNavigationBar.topView setHidden:FALSE];
     [self.customNavigationBar.detailView setHidden:TRUE];
    [self.customNavigationBar setFrame:CGRectMake(0, 0, 320, 60)];
   // [self.customNavigationBar setBounds:CGRectMake(0, 0, 320, 60)];
    
    [self.view addSubview:self.customNavigationBar];
    //[self.view sendSubviewToBack:self.customNavigationBar];
}
-(void) createBackButton
{
    
    
   
    
    UIImageView *uView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NavigationMenu"]];
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake( 0, 0, uView.frame.size.width, uView.frame.size.height -16);
    [leftButton setImage:uView.image forState:UIControlStateNormal];
    
    [leftButton setImage:[UIImage imageNamed:@"NavigationMenuSelected"]forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.customNavigationBar addSubview:leftButton];
    

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) popViewControllerAnimated:(id) sender
{
    
}
@end
