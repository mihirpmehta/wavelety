//
//  MenuView.h
//  CANITASTE
//
//  Created by mihir mehta on 12/04/14.
//  Copyright (c) 2014 mihir mehta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuView : UIView
{
    
}
@property(nonatomic,readwrite) BOOL isShown;
@property(nonatomic, weak) UIViewController *parent;
-(id) initWithNib;
- (IBAction)showMenu:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *detailView;
@end
