//
//  XHTestCell.m
//  HXReader12
//
//  Created by 小黑 on 16/9/22.
//  Copyright © 2016年 小黑. All rights reserved.
//

#import "XHTestCell.h"
#import <Masonry.h>

@implementation XHTestCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        //创建ui控件
        [self createAnswerView];
    }
    return self;
}

-(void)createAnswerView{
    UIImageView * bgView_one=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"file_5"]];
    bgView_one.frame=self.contentView.bounds;
    [self.contentView addSubview:bgView_one];
    
    UIImageView * bgView_two=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"file_1"]];
    [bgView_one addSubview:bgView_two];
    
    [bgView_two mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(30);
        make.right.equalTo(self.contentView).offset(-30);
        make.bottom.equalTo(self.contentView).offset(-70);
        make.top.equalTo(self.contentView);
    }];
}
@end
