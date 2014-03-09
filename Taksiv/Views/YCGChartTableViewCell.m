//
//  YCGChartTableViewCell.m
//  Taksiv
//
//  Created by yaakov gamliel on 3/8/14.
//  Copyright (c) 2014 Yaakov Gamliel. All rights reserved.
//

#import "YCGChartTableViewCell.h"
#import <QuartzCore/CAAnimation.h>


@interface YCGChartTableViewCell ()
@property (nonatomic, strong) UILongPressGestureRecognizer *gestureRecognizer;
@end

@implementation YCGChartTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initializeRecognizer];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self initializeRecognizer];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UILongGestureRecognizer setup
- (void)initializeRecognizer {
    self.gestureRecognizer = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(cellLongTouched)];
    self.gestureRecognizer.minimumPressDuration = 1.0;
    [self.contentView addGestureRecognizer:self.gestureRecognizer];
}

- (void)cellLongTouched {
    NSLog(@"Long touch!!");
    NSLog(@"%@", NSStringFromCGRect(self.contentView.bounds));
    [self animateInCellContentView];
}
- (void)animateInCellContentView {
    UIView *animatedView = [[UIView alloc]initWithFrame:self.contentView.frame];
    animatedView.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:animatedView];
    
    [UIView animateWithDuration:0.5 animations:^{
        animatedView.frame = CGRectMake(0.0, 0.0, 320.0, 500.0);
    }];
}
@end
