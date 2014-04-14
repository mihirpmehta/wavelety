//
//  ViewController.m
//  CANITASTE
//
//  Created by mihir mehta on 31/03/14.
//  Copyright (c) 2014 mihir mehta. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavigationBackground"] forBarMetrics:UIBarMetricsDefault];
    
    UIImageView *uView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NavigationMenu"]];
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.bounds = CGRectMake( 0, 25, uView.frame.size.width, uView.frame.size.height + 10);
    [leftButton setImage:uView.image forState:UIControlStateNormal];
    
    [leftButton setImage:[UIImage imageNamed:@"NavigationMenuSelected"]forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *aButton = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    
   // [[UIBarButtonItem appearance] setCustomView:leftButton]
    
   // UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //[negativeSpacer setWidth:-10];
    //[negativeSpacer set]
    
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:aButton,nil];
    
   // self.navigationItem.leftBarButtonItem = aButton;
    self.navigationItem.hidesBackButton = YES;
    
    //[self.navigationController.navigationBar setTi]
    
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
