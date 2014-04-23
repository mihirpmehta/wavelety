//
//  SearchViewController.m
//  CANITASTE
//
//  Created by mihir mehta on 13/04/14.
//  Copyright (c) 2014 mihir mehta. All rights reserved.
//

#import "SearchViewController.h"
#import "StrainNormalCell.h"
#import "StrainExpandedCell.h"
#import <AFNetworking/UIActivityIndicatorView+AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>

#import "BusinessDetailViewController.h" // Added temp
#import "BlogViewController.h"


@interface SearchViewController ()

@end

@implementation SearchViewController

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
    //
    //manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //manager.responseSerializer.acceptableCont    entTypes = [NSSet setWithObject:@"text/html"];
    
AFJSONResponseSerializer *ser = (AFJSONResponseSerializer *) manager.responseSerializer;
    
    [ser setReadingOptions:NSJSONReadingAllowFragments];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"leafstrain" password:@"leafstrain2014"];
    
    NSString *postString = [NSString stringWithFormat:@"%@%@",BASE_URL,@"get-all-post.php"];
    
    UIActivityIndicatorView *actView = (UIActivityIndicatorView *)[self.view viewWithTag:123];
    NSDictionary *parameters = nil;
    AFHTTPRequestOperation *operation =  [manager GET:postString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        BaseClass *base =[BaseClass modelObjectWithDictionary:(NSDictionary *)responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        NSLog(@"%@",operation.responseString);
        NSData *data = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
        id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        BaseClass *base =[BaseClass modelObjectWithDictionary:(NSDictionary *)obj];
        self.dataArray = [base allpost];
        //[actView stopAnimating];
        [self.strainTable reloadData];
        
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
    Allpost *post = [self.dataArray objectAtIndex:indexPath.row];
    if (post.isExpanded == FALSE) {
        StrainNormalCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"StrainNormalCell" forIndexPath:indexPath];
        cell.titleLbl.text = post.postTitle;
        return cell;
    }
    else
    {
        StrainExpandedCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"StrainExpandedCell" forIndexPath:indexPath];
        cell.titleLbl.text = post.postTitle;
        //cell.strainImage setImageWithURL:post.po
        cell.descriptionTextView.text = post.postContent;
        //cell.ingredientLbl.text = post.po
        return cell;
    }
    
   // return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     Allpost *post = [self.dataArray objectAtIndex:indexPath.row];
    if (post.isExpanded == FALSE) {
        return 64.0;
    }
    else
    {
        return 177.0;
    }

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Allpost *post = [self.dataArray objectAtIndex:indexPath.row];
    if (post.isExpanded == FALSE) {
        post.isExpanded = TRUE;
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    else
    {
        //
    }

}
- (IBAction)indicaClicked:(id)sender {
    
    // Added temp
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    BusinessDetailViewController *vc = (BusinessDetailViewController *)[storyboard instantiateViewControllerWithIdentifier:@"BusinessDetail"];
    
    [self.navigationController pushViewController:vc animated:YES];

}

- (IBAction)hybridClicked:(id)sender {
    
    // Added temp
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    BlogViewController *vc = (BlogViewController *)[storyboard instantiateViewControllerWithIdentifier:@"BlogController"];
    
    
    [self.navigationController pushViewController:vc animated:YES];

    
}

- (IBAction)sativaClicked:(id)sender {
}

- (IBAction)searchStrainProperties:(id)sender {
}

- (IBAction)searchStrainEffect:(id)sender {
}
@end
