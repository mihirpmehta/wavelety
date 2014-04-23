//
//  BlogViewController.m
//  LEAFSTRAIN
//
//  Created by Uttam Bhakhar on 19/04/14.
//  Copyright (c) 2014 mihir mehta. All rights reserved.
//

#import "BlogViewController.h"
#import "BlogViewCell.h"
#import "Blog.h"
#import <Social/Social.h>
#import <AFNetworking/UIActivityIndicatorView+AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>

#import <GoogleOpenSource/GoogleOpenSource.h>
#import <GooglePlus/GooglePlus.h>


@interface BlogViewController ()

@end

@implementation BlogViewController

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
    
    [self getDataFromServer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) getDataFromServer
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    UIActivityIndicatorView *actView = (UIActivityIndicatorView *)[self.view viewWithTag:50001];
    
    AFJSONResponseSerializer *ser = (AFJSONResponseSerializer *) manager.responseSerializer;
    
    [ser setReadingOptions:NSJSONReadingAllowFragments];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"leafstrain" password:@"leafstrain2014"];
    
    NSString *postString = [NSString stringWithFormat:@"%@%@",BASE_URL,@"get-blog.php"];
    
    NSDictionary *parameters = nil;
    AFHTTPRequestOperation *operation =  [manager GET:postString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        self.blogData =[Blog2 modelObjectWithDictionary:(NSDictionary *)responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        NSLog(@"%@",operation.responseString);
        NSData *data = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
        id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
    
        self.blogData =[Blog2 modelObjectWithDictionary:(NSDictionary *)obj];
        self.dataArray = [self.blogData blog];
        [self.blogTable reloadData];
        [actView stopAnimating];
        
    }];
    [actView setAnimatingWithStateOfOperation:operation];
}



#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    BlogViewCell *cell = (BlogViewCell *)[tableView dequeueReusableCellWithIdentifier:@"BlogViewCellIdentifier"];
    
    Blog *blogDta = [self.dataArray objectAtIndex:indexPath.row];
    
    cell.titleLbl.text = blogDta.blogTitle;
    cell.dateLbl.text = [NSString stringWithFormat:@"%@ %@,%@",blogDta.blogMonth,blogDta.blogDay,blogDta.blogYear];
    cell.commentLbl.text = [NSString stringWithFormat:@"%@ comments",blogDta.blogComments];
    cell.tagLbl.text = @"Tags";
    
    // Lazy load image
    if (blogDta.blogThumbnail && ![blogDta.blogThumbnail isEqualToString:@""]) {
        
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"leafstrain" password:@"leafstrain2014"];
        
        NSString *postString = blogDta.blogThumbnail;
        NSDictionary *parameters = nil;
        AFHTTPRequestOperation *operation =  [manager GET:postString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            cell.centreImage.image = [UIImage imageWithData:responseObject];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSData *data = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
            cell.centreImage.image = [UIImage imageWithData:data];
        }];
    }
    
    [cell.detailText setTextColor:[UIColor whiteColor]];
    cell.detailText.text = blogDta.blogContent;
    
    [cell.twitterButton setTag:1000 + indexPath.row];
    [cell.twitterButton addTarget:self action:@selector(twitterClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.fbButton setTag:2000 + indexPath.row];
    [cell.fbButton addTarget:self action:@selector(fbClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.gPlusButton setTag:3000 + indexPath.row];
    [cell.gPlusButton addTarget:self action:@selector(googlePlusClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.seeMoreButton setTag:4000 + indexPath.row];
    [cell.seeMoreButton addTarget:self action:@selector(seeMoreClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.commentButton setTag:5000 + indexPath.row];
    [cell.commentButton addTarget:self action:@selector(commentClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
    
}



- (void)twitterClicked:(id)sender {
    
    NSLog(@"twitter");
    
    UIButton *btn = (UIButton *)sender;
    int indexpath = 1000 - [btn tag];
    Blog *blogDta = [self.dataArray objectAtIndex:indexpath];

    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheetOBJ = [SLComposeViewController
                                                  composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheetOBJ setInitialText:[NSString stringWithFormat:@"%@ %@",blogDta.blogTitle, blogDta.blogPermalink]];
        [self presentViewController:tweetSheetOBJ animated:YES completion:nil];
    }
    else{
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please set up your Twitter account in Setting." message:Nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }

}

- (void)fbClicked:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
    int indexpath = 2000 - [btn tag];
    Blog *blogDta = [self.dataArray objectAtIndex:indexpath];
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *fbSheetOBJ = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [fbSheetOBJ setInitialText:[NSString stringWithFormat:@"%@ %@",blogDta.blogTitle, blogDta.blogPermalink]];
        [self presentViewController:fbSheetOBJ animated:YES completion:Nil];
    }
    else{
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please set up your Facebook account in Setting." message:Nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }

}


- (void)googlePlusClicked:(id)sender {
    NSLog(@"googlePlusClicked");
    
    UIButton *btn = (UIButton *)sender;
    int indexpath = 3000 - [btn tag];
    Blog *blogDta = [self.dataArray objectAtIndex:indexpath];
    
    id<GPPShareBuilder> shareBuilder = [[GPPShare sharedInstance] shareDialog];
    
    // This line will fill out the title, description, and thumbnail from
    // the URL that you are sharing and includes a link to that URL.
    [shareBuilder setURLToShare:[NSURL URLWithString:blogDta.blogPermalink]];

    [shareBuilder open];

    
}

- (void)seeMoreClicked:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
    int indexpath = 4000 - [btn tag];
    Blog *blogDta = [self.dataArray objectAtIndex:indexpath];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",blogDta.blogPermalink]]];
}

- (void)commentClicked:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
    int indexpath = 5000 - [btn tag];
    Blog *blogDta = [self.dataArray objectAtIndex:indexpath];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",blogDta.blogPermalink]]];
}



@end
