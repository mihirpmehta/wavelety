//
//  StrainNormalCell.h
//  LEAFSTRAIN
//
//  Created by mihir mehta on 15/04/14.
//  Copyright (c) 2014 mihir mehta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StrainNormalCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
- (IBAction)favorited:(id)sender;
- (IBAction)starred:(id)sender;
@end
