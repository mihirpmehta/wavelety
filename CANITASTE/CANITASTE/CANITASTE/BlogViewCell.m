//
//  BlogViewCell.m
//  LEAFSTRAIN
//
//  Created by Uttam Bhakhar on 20/04/14.
//  Copyright (c) 2014 mihir mehta. All rights reserved.
//

#import "BlogViewCell.h"

@implementation BlogViewCell
@synthesize titleLbl,dateLbl,commentLbl,tagLbl,centreImage,twitterButton,fbButton,gPlusButton,seeMoreButton,detailText,commentButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
