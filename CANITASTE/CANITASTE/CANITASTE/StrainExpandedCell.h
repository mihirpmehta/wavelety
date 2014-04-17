//
//  StrainExpandedCell.h
//  LEAFSTRAIN
//
//  Created by mihir mehta on 15/04/14.
//  Copyright (c) 2014 mihir mehta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StrainExpandedCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UIButton *favorited;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIButton *starred;
@property (weak, nonatomic) IBOutlet UIImageView *strainImage;
@property (weak, nonatomic) IBOutlet UILabel *ingredientLbl;
@end
