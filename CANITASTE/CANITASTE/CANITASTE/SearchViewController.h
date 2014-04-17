//
//  SearchViewController.h
//  CANITASTE
//
//  Created by mihir mehta on 13/04/14.
//  Copyright (c) 2014 mihir mehta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "DataModels.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworkActivityIndicatorManager.h>


@interface SearchViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UITableView *strainTable;
@property (nonatomic, strong) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UIButton *searchStrainPropertyBtn;
@property (weak, nonatomic) IBOutlet UIButton *searchStrainEffectBtn;
@property (weak, nonatomic) IBOutlet UIButton *indicaBtn;
@property (weak, nonatomic) IBOutlet UIButton *hybridButton;
@property (weak, nonatomic) IBOutlet UIButton *sativaBtn;

- (IBAction)indicaClicked:(id)sender;
- (IBAction)hybridClicked:(id)sender;
- (IBAction)sativaClicked:(id)sender;

- (IBAction)searchStrainProperties:(id)sender;
- (IBAction)searchStrainEffect:(id)sender;

@end
