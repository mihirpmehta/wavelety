//
//  BusinessDetailViewController.h
//  LEAFSTRAIN
//
//  Created by Uttam Bhakhar on 17/04/14.
//  Copyright (c) 2014 mihir mehta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworkActivityIndicatorManager.h>
#import "BusinessDetail.h"

@class MenuView;
@interface BusinessDetailViewController : BaseViewController


@property(nonatomic,retain) NSString *businessId;

@property (weak, nonatomic) IBOutlet UIScrollView *businessDetailScrollView;
@property(nonatomic,retain) BusinessDetail *businessDetailData;

@end
