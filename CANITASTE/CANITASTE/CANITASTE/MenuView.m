//
//  MenuView.m
//  CANITASTE
//
//  Created by mihir mehta on 12/04/14.
//  Copyright (c) 2014 mihir mehta. All rights reserved.
//

#import "MenuView.h"



@implementation MenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(id) initWithNib
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil] objectAtIndex:0];
    return self;
}

- (IBAction)showMenu:(id)sender {
    if (self.isShown == TRUE) {
        [self.topView setHidden:FALSE];
        [self.detailView setHidden:TRUE];
         [self setFrame:CGRectMake(0, 0, 320, 60)];
        self.isShown = FALSE;
    }
    else
    {
        [self.topView setHidden:FALSE];
        [self.detailView setHidden:FALSE];
         [self setFrame:CGRectMake(0, 0, 320, 310)];
        self.isShown = TRUE;
    }
}

- (IBAction)myFavs:(id)sender{

}


- (IBAction)rateCAnitaste:(id)sender{

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
