//
//  BlogViewCell.h
//  LEAFSTRAIN
//
//  Created by Uttam Bhakhar on 20/04/14.
//  Copyright (c) 2014 mihir mehta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlogViewCell : UITableViewCell{

}


@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *dateLbl;
@property (weak, nonatomic) IBOutlet UILabel *commentLbl;
@property (weak, nonatomic) IBOutlet UILabel *tagLbl;
@property (weak, nonatomic) IBOutlet UITextView *detailText;
@property (weak, nonatomic) IBOutlet UIButton *twitterButton;
@property (weak, nonatomic) IBOutlet UIButton *fbButton;
@property (weak, nonatomic) IBOutlet UIButton *gPlusButton;
@property (weak, nonatomic) IBOutlet UIButton *seeMoreButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;

@property (weak, nonatomic) IBOutlet UIImageView *centreImage;

@end
