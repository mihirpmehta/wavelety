//
//  BlogViewController.h
//  LEAFSTRAIN
//
//  Created by Uttam Bhakhar on 19/04/14.
//  Copyright (c) 2014 mihir mehta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworkActivityIndicatorManager.h>
#import "BusinessDetail.h"

#import "Blog2.h"

@class MenuView;

@interface BlogViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{

}

@property (weak, nonatomic) IBOutlet UITableView *blogTable;

@property (weak, nonatomic) Blog2 *blogData;
@property (nonatomic, strong) NSArray *dataArray;


@end
