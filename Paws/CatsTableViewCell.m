//
//  CatsTableViewCell.m
//  Paws
//
//  Created by 陳昱宏 on 2020/9/23.
//  Copyright © 2020 iknisy. All rights reserved.
//

#import "CatsTableViewCell.h"
#import "DataService.h"

@implementation CatsTableViewCell

@synthesize catNameLabel;
@synthesize catVotesLabel;
@synthesize catCreditLabel;
@synthesize catImageView;
@synthesize pawImageView;
@synthesize index;
@synthesize votes;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onDoubleTap:)];
    gesture.numberOfTapsRequired = 2;
    [self.contentView addGestureRecognizer:gesture];
    pawImageView.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) onDoubleTap:(id)sender {
    
    pawImageView.hidden = NO;
    pawImageView.alpha = 1.0;
    [UIView animateWithDuration:1.0 delay:1.0 options:(UIViewAnimationOptionTransitionNone) animations:^{
        self.pawImageView.alpha = 0;
    } completion:^(BOOL finished) {
        self.pawImageView.hidden = YES;
        [self voteCat];
    }];
}

- (void)voteCat {
    votes = [NSNumber numberWithLong:votes.longValue+1];
    NSString *path = [NSString stringWithFormat:@"%ld/votes", index];
    [[DataService.sharedInstance.RESULTS_REF child:path] setValue:votes];
}

@end
