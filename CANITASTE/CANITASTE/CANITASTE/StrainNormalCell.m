//
//  StrainNormalCell.m
//  LEAFSTRAIN
//
//  Created by mihir mehta on 15/04/14.
//  Copyright (c) 2014 mihir mehta. All rights reserved.
//

#import "StrainNormalCell.h"

@implementation StrainNormalCell

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

- (IBAction)favorited:(id)sender {
}

- (IBAction)starred:(id)sender {
}
@end
