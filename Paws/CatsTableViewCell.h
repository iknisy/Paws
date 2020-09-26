//
//  CatsTableViewCell.h
//  Paws
//
//  Created by 陳昱宏 on 2020/9/23.
//  Copyright © 2020 iknisy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CatsTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *catNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *catVotesLabel;
@property (nonatomic, weak) IBOutlet UILabel *catCreditLabel;
@property (nonatomic, weak) IBOutlet UIImageView *catImageView;
@property (nonatomic, weak) IBOutlet UIImageView *pawImageView;
@property (nonatomic) NSInteger index;
@property (nonatomic) NSNumber *votes;

@end

NS_ASSUME_NONNULL_END
