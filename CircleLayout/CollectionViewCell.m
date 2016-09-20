//
//  CollectionViewCell.m
//  CircleLayout
//
//  Created by 楊利嘉 on 16/9/20.
//  Copyright © 2016年 楊利嘉. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.contentView.layer.cornerRadius = 35.f;
        self.contentView.layer.borderWidth = 2.f;
        self.contentView.layer.borderColor = [UIColor cyanColor].CGColor;
        self.contentView.backgroundColor = [UIColor grayColor];
    }
    return self;
}
@end
