//
//  BusinessDetailViewController.m
//  LEAFSTRAIN
//
//  Created by Uttam Bhakhar on 17/04/14.
//  Copyright (c) 2014 mihir mehta. All rights reserved.
//

#import "BusinessDetailViewController.h"
#import "BusinessDetails.h"
#import "MenuView.h"
#import <AFNetworking/UIActivityIndicatorView+AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <Social/Social.h>
#import <GoogleOpenSource/GoogleOpenSource.h>
#import <GooglePlus/GooglePlus.h>


#define DIRECTIONTEXT @"Get Directions"
#define PHONE @"(123)4567890"

@interface BusinessDetailViewController ()

@end

@implementation BusinessDetailViewController

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
	// Do any additional setup after loading the view.
    
    // Temp Setup for web service call. Need to change when integrated in flow
    self.businessId = @"1593";

    
    [self getDataFromServer];
    
    self.businessDetailScrollView.layer.cornerRadius = 10;
    
    
}

- (void)setUpContent{

    NSArray *viewsToRemove = [self.businessDetailScrollView subviews];
    for (UIView *v in viewsToRemove) {
        [v removeFromSuperview];
    }

    UIFont *fontToUse = [UIFont systemFontOfSize:19];
    UIColor *fontColor = [UIColor colorWithRed:151.0/255.0 green:159.0/255.0 blue:170.0/255.0 alpha:1.0];
    UIColor *fontColorTitle = [UIColor colorWithRed:2.0/255.0 green:181.0/255.0 blue:255.0/255.0 alpha:1.0];
    
    
    BusinessDetails *dataClass = self.businessDetailData.businessDetails;
    // create UI elements in scrollview.
    if (self.businessDetailData) {
        

        int contentHeight = 20;
        
        // Setup background
        UIImageView *scrollBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.businessDetailScrollView.frame.size.width, self.businessDetailScrollView.frame.size.height)];
        [scrollBackground setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0]];
        [scrollBackground.layer setCornerRadius:10.0];
        //[scrollBackground.layer setBorderColor:[UIColor colorWithRed:231/255 green:132/255 blue:31/255 alpha:1.0].CGColor];
        [self.businessDetailScrollView addSubview:scrollBackground];

        
        if (![dataClass.businessImage isEqualToString:@"false"]&&![dataClass.businessImage isEqualToString:@""]) {
            
            UIImageView *businessImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, contentHeight, 260, 260)];
            [businessImage.layer setBorderWidth:2.0];
            [businessImage.layer setCornerRadius:10.0];
            [businessImage.layer setBorderColor:[UIColor colorWithRed:255.0/255.0 green:147.0/255.0 blue:0.0 alpha:1.0].CGColor];
            [businessImage setBackgroundColor:[UIColor clearColor]];
            
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            
            [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"leafstrain" password:@"leafstrain2014"];
            
            NSString *postString = dataClass.businessImage; // Add image url here
            NSDictionary *parameters = nil;
            AFHTTPRequestOperation *operation =  [manager GET:postString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                businessImage.image = [UIImage imageWithData:responseObject];
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSData *data = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
                businessImage.image = [UIImage imageWithData:data];
            }];

            
            
            [self.businessDetailScrollView addSubview:businessImage];
            
            contentHeight = contentHeight + 20 + 260;
        }
        
        
        // Set up Business title
        
        if (dataClass.businessTitle && ![dataClass.businessTitle isEqualToString:@""]) {
            UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, contentHeight, 260, 60)];
            [titleLabel setFont:[UIFont boldSystemFontOfSize:35]];
            [titleLabel setTextColor:fontColorTitle];
            [titleLabel setTextAlignment:NSTextAlignmentCenter];
            titleLabel.text = dataClass.businessTitle;
            [titleLabel setBackgroundColor:[UIColor clearColor]];
            [self.businessDetailScrollView addSubview:titleLabel];
            
            contentHeight = contentHeight + 10 + 60;
        }
        
        // Set up Business Adress
        
        if (dataClass.businessAddress && ![dataClass.businessAddress isEqualToString:@""]) {
            
          /*  CGSize textViewSize = [dataClass.businessAddress sizeWithFont:[UIFont fontWithName:@"HelveticaNeue" size:20]
                                   constrainedToSize:CGSizeMake(260, 200)
                                       lineBreakMode:NSLineBreakByTruncatingTail];*/
            CGSize textViewSize = [dataClass.businessAddress sizeWithFont:fontToUse
                                                        constrainedToSize:CGSizeMake(260, 200)
                                                            lineBreakMode:NSLineBreakByTruncatingTail];

            
            UITextView * address = [[UITextView alloc]initWithFrame:CGRectMake(20, contentHeight, 260, textViewSize.height + 20)];
            [address setFont:fontToUse];
            [address setTextColor:fontColor];
            address.editable = NO;
            address.text = dataClass.businessAddress;
            [address setBackgroundColor:[UIColor clearColor]];
            [self.businessDetailScrollView addSubview:address];
            
            contentHeight = contentHeight + 15 + textViewSize.height;
        }
        
        // Set up Get Directions
        
        if (dataClass.businessAddress && ![dataClass.businessAddress isEqualToString:@""]) {
            UILabel * getDirection = [[UILabel alloc]initWithFrame:CGRectMake(20, contentHeight, 260, 30)];
            [getDirection setFont:fontToUse];
            [getDirection setTextColor:fontColorTitle];
            getDirection.text = DIRECTIONTEXT;
            [getDirection setBackgroundColor:[UIColor clearColor]];
            [self.businessDetailScrollView addSubview:getDirection];
            
            UIButton *directionButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [directionButton setFrame:getDirection.frame];
            [directionButton addTarget:self action:@selector(getDirection:) forControlEvents:UIControlEventTouchUpInside];
            [self.businessDetailScrollView addSubview:directionButton];
            
            contentHeight = contentHeight + 10 + 30;
        }
        
        // Set up Phone Number
        
        if (dataClass.businessPhone && ![dataClass.businessPhone isEqualToString:@""]) {
            UILabel * phone = [[UILabel alloc]initWithFrame:CGRectMake(20, contentHeight, 260, 30)];
            [phone setFont:fontToUse];
            [phone setTextColor:fontColor];
            phone.text = [NSString stringWithFormat:@"Phone Number %@",dataClass.businessPhone];
            [phone setBackgroundColor:[UIColor clearColor]];
            [self.businessDetailScrollView addSubview:phone];
            
            contentHeight = contentHeight + 10 + 30;
        }

        // set up website
        if (dataClass.businessWebsite && ![dataClass.businessWebsite isEqualToString:@""]) {
            UILabel * website = [[UILabel alloc]initWithFrame:CGRectMake(20, contentHeight, 260, 30)];
            [website setFont:fontToUse];
            [website setTextColor:fontColorTitle];
            website.text = dataClass.businessWebsite;
            [website setBackgroundColor:[UIColor clearColor]];
            [self.businessDetailScrollView addSubview:website];
            
            UIButton *webButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [webButton setFrame:website.frame];
            [webButton addTarget:self action:@selector(goTOWebSite:) forControlEvents:UIControlEventTouchUpInside];
            [self.businessDetailScrollView addSubview:webButton];
            
            contentHeight = contentHeight + 15 + 30;
        }

        // set up Monday
        if (dataClass.monday && ![dataClass.monday isEqualToString:@""]) {
            UILabel * monday = [[UILabel alloc]initWithFrame:CGRectMake(20, contentHeight, 80, 30)];
            [monday setFont:fontToUse];
            [monday setTextColor:fontColor];
            monday.text = @"Mon";
            [monday setBackgroundColor:[UIColor clearColor]];
            [self.businessDetailScrollView addSubview:monday];
            
            UILabel * mondayData = [[UILabel alloc]initWithFrame:CGRectMake(80, contentHeight, 170, 30)];
            [mondayData setFont:fontToUse];
            [mondayData setTextColor:fontColor];
            mondayData.text = dataClass.monday;
            [mondayData setBackgroundColor:[UIColor clearColor]];
            [self.businessDetailScrollView addSubview:mondayData];
            
            contentHeight = contentHeight + 5 + 30;
        }
        
        // set up Tuesday
        if (dataClass.tuesday && ![dataClass.tuesday isEqualToString:@""]) {
            UILabel * tuesday = [[UILabel alloc]initWithFrame:CGRectMake(20, contentHeight, 80, 30)];
            [tuesday setFont:fontToUse];
            [tuesday setTextColor:fontColor];
            tuesday.text = @"Tue";
            [tuesday setBackgroundColor:[UIColor clearColor]];
            [self.businessDetailScrollView addSubview:tuesday];
            
            UILabel * tuesdayData = [[UILabel alloc]initWithFrame:CGRectMake(80, contentHeight, 170, 30)];
            [tuesdayData setFont:fontToUse];
            [tuesdayData setTextColor:fontColor];
            tuesdayData.text = dataClass.tuesday;
            [tuesdayData setBackgroundColor:[UIColor clearColor]];
            [self.businessDetailScrollView addSubview:tuesdayData];
            
            contentHeight = contentHeight + 5 + 30;
        }

        // set up Wednesday
        if (dataClass.wedneday && ![dataClass.wedneday isEqualToString:@""]) {
            UILabel * wedneday = [[UILabel alloc]initWithFrame:CGRectMake(20, contentHeight, 80, 30)];
            [wedneday setFont:fontToUse];
            [wedneday setTextColor:fontColor];
            wedneday.text = @"Wed";
            [wedneday setBackgroundColor:[UIColor clearColor]];
            [self.businessDetailScrollView addSubview:wedneday];
            
            UILabel * wednedayData = [[UILabel alloc]initWithFrame:CGRectMake(80, contentHeight, 170, 30)];
            [wednedayData setFont:fontToUse];
            [wednedayData setTextColor:fontColor];
            wednedayData.text = dataClass.wedneday;
            [wednedayData setBackgroundColor:[UIColor clearColor]];
            [self.businessDetailScrollView addSubview:wednedayData];
            
            contentHeight = contentHeight + 5 + 30;
        }

        // set up Thursday
        if (dataClass.thursday && ![dataClass.thursday isEqualToString:@""]) {
            UILabel * thursday = [[UILabel alloc]initWithFrame:CGRectMake(20, contentHeight, 80, 30)];
            [thursday setFont:fontToUse];
            [thursday setTextColor:fontColor];
            thursday.text = @"Thu";
            [thursday setBackgroundColor:[UIColor clearColor]];
            [self.businessDetailScrollView addSubview:thursday];
            
            UILabel * thursdayData = [[UILabel alloc]initWithFrame:CGRectMake(80, contentHeight, 170, 30)];
            [thursdayData setFont:fontToUse];
            [thursdayData setTextColor:fontColor];
            thursdayData.text = dataClass.thursday;
            [thursdayData setBackgroundColor:[UIColor clearColor]];
            [self.businessDetailScrollView addSubview:thursdayData];
            
            contentHeight = contentHeight + 5 + 30;
        }

        // set up Friday
        if (dataClass.friday && ![dataClass.friday isEqualToString:@""]) {
            UILabel * friday = [[UILabel alloc]initWithFrame:CGRectMake(20, contentHeight, 80, 30)];
            [friday setFont:fontToUse];
            [friday setTextColor:fontColor];
            friday.text = @"Fri";
            [friday setBackgroundColor:[UIColor clearColor]];
            [self.businessDetailScrollView addSubview:friday];
            
            UILabel * fridayData = [[UILabel alloc]initWithFrame:CGRectMake(80, contentHeight, 170, 30)];
            [fridayData setFont:fontToUse];
            [fridayData setTextColor:fontColor];
            fridayData.text = dataClass.friday;
            [fridayData setBackgroundColor:[UIColor clearColor]];
            [self.businessDetailScrollView addSubview:fridayData];
            
            contentHeight = contentHeight + 5 + 30;
        }

        // set up Saturday
        if (dataClass.saturday && ![dataClass.saturday isEqualToString:@""]) {
            UILabel * saturday = [[UILabel alloc]initWithFrame:CGRectMake(20, contentHeight, 80, 30)];
            [saturday setFont:fontToUse];
            [saturday setTextColor:fontColor];
            saturday.text = @"Sat";
            [saturday setBackgroundColor:[UIColor clearColor]];
            [self.businessDetailScrollView addSubview:saturday];
            
            UILabel * saturdayData = [[UILabel alloc]initWithFrame:CGRectMake(80, contentHeight, 170, 30)];
            [saturdayData setFont:fontToUse];
            [saturdayData setTextColor:fontColor];
            saturdayData.text = dataClass.saturday;
            [saturdayData setBackgroundColor:[UIColor clearColor]];
            [self.businessDetailScrollView addSubview:saturdayData];
            
            contentHeight = contentHeight + 5 + 30;
        }


        // set up sunday
        if (dataClass.sunday && ![dataClass.sunday isEqualToString:@""]) {
            UILabel * sunday = [[UILabel alloc]initWithFrame:CGRectMake(20, contentHeight, 80, 30)];
            [sunday setFont:fontToUse];
            [sunday setTextColor:fontColor];
            sunday.text = @"Sun";
            [sunday setBackgroundColor:[UIColor clearColor]];
            [self.businessDetailScrollView addSubview:sunday];
            
            UILabel * sundayData = [[UILabel alloc]initWithFrame:CGRectMake(80, contentHeight, 170, 30)];
            [sundayData setFont:fontToUse];
            [sundayData setTextColor:fontColor];
            sundayData.text = dataClass.sunday;
            [sundayData setBackgroundColor:[UIColor clearColor]];
            [self.businessDetailScrollView addSubview:sundayData];
            
            contentHeight = contentHeight + 20 + 30;
        }

        // To Do replace images for all 3
        
        UIButton *FacebookButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [FacebookButton setFrame:CGRectMake(135, contentHeight, 30, 30)];
        [FacebookButton setImage:[UIImage imageNamed:@"like heart in search page"] forState:UIControlStateNormal];
        [FacebookButton addTarget:self action:@selector(shareFacebook:) forControlEvents:UIControlEventTouchUpInside];
        [self.businessDetailScrollView addSubview:FacebookButton];

        UIButton *twitterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [twitterButton setFrame:CGRectMake(100, contentHeight, 30, 30)];
        [twitterButton addTarget:self action:@selector(shareTwitter:) forControlEvents:UIControlEventTouchUpInside];
        [twitterButton setImage:[UIImage imageNamed:@"like heart in search page"] forState:UIControlStateNormal];
        [self.businessDetailScrollView addSubview:twitterButton];

        UIButton *GoogleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [GoogleButton setFrame:CGRectMake(170, contentHeight, 30, 30)];
        [GoogleButton addTarget:self action:@selector(shareGooglePlus:) forControlEvents:UIControlEventTouchUpInside];
        [GoogleButton setImage:[UIImage imageNamed:@"like heart in search page"] forState:UIControlStateNormal];
        [self.businessDetailScrollView addSubview:GoogleButton];

        contentHeight = contentHeight + 50;
        
        [scrollBackground setFrame:CGRectMake(scrollBackground.frame.origin.x, scrollBackground.frame.origin.y, scrollBackground.frame.size.width, contentHeight)];
        [self.businessDetailScrollView setContentSize:CGSizeMake(self.businessDetailScrollView.frame.size.width, contentHeight)];
    }
    
    
    
}

- (void)goTOWebSite:(id)sender{

    NSLog(@"goTOWebSite:(id)sender");
    BusinessDetails *dataClass = self.businessDetailData.businessDetails;
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@",dataClass.businessWebsite]]];
}

- (void)getDirection:(id)sender{
    NSLog(@"getDirection:(id)sender");
    
    BusinessDetails *dataClass = self.businessDetailData.businessDetails;
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://maps.apple.com/?daddr=%@&saddr=Current+Location",[dataClass.businessAddress stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]];

}

- (void)shareFacebook:(id)sender{
    NSLog(@"shareFacebook:(id)sender");
    BusinessDetails *dataClass = self.businessDetailData.businessDetails;
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *fbSheetOBJ = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [fbSheetOBJ setInitialText:[NSString stringWithFormat:@"%@ %@",dataClass.businessTitle,dataClass.businessWebsite]];
        [self presentViewController:fbSheetOBJ animated:YES completion:Nil];
    }
    else{
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please set up your Facebook account in Setting." message:Nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }

}

- (void)shareTwitter:(id)sender{
   
    
    BusinessDetails *dataClass = self.businessDetailData.businessDetails;
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheetOBJ = [SLComposeViewController
                                                  composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheetOBJ setInitialText:[NSString stringWithFormat:@"%@ %@",dataClass.businessTitle,dataClass.businessWebsite]];
        [self presentViewController:tweetSheetOBJ animated:YES completion:nil];
    }
    else{
    
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please set up your Twitter account in Setting." message:Nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }

}

- (void)shareGooglePlus:(id)sender{
    
     BusinessDetails *dataClass = self.businessDetailData.businessDetails;
    
    id<GPPShareBuilder> shareBuilder = [[GPPShare sharedInstance] shareDialog];
    
    // This line will fill out the title, description, and thumbnail from
    // the URL that you are sharing and includes a link to that URL.
    [shareBuilder setURLToShare:[NSURL URLWithString:dataClass.businessWebsite]];
    
    
    [shareBuilder open];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) getDataFromServer
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //
    //manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //manager.responseSerializer.acceptableCont    entTypes = [NSSet setWithObject:@"text/html"];
    
    UIActivityIndicatorView *actView = (UIActivityIndicatorView *)[self.view viewWithTag:1000];
    
    AFJSONResponseSerializer *ser = (AFJSONResponseSerializer *) manager.responseSerializer;
    
    [ser setReadingOptions:NSJSONReadingAllowFragments];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"leafstrain" password:@"leafstrain2014"];
    
    NSString *postString = [NSString stringWithFormat:@"%@%@%@",BASE_URL,@"business-details.php?business_id=",self.businessId];
    
   // UIActivityIndicatorView *actView = (UIActivityIndicatorView *)[self.view viewWithTag:123];
    NSDictionary *parameters = nil;
    AFHTTPRequestOperation *operation =  [manager GET:postString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        self.businessDetailData =[BusinessDetail modelObjectWithDictionary:(NSDictionary *)responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        NSLog(@"%@",operation.responseString);
        NSData *data = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
        id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        self.businessDetailData =[BusinessDetail modelObjectWithDictionary:(NSDictionary *)obj];
        //self.dataArray = [base allpost];
        //[actView stopAnimating];
        
        // Set up content
        if (self.businessDetailData) {
             [self setUpContent];
        }
       
        
    }];
    [actView setAnimatingWithStateOfOperation:operation];
}




@end
