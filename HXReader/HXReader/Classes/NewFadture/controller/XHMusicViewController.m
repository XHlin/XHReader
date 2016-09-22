//
//  XHMusicViewController.m
//  HXReader
//
//  Created by 小黑 on 16/9/22.
//  Copyright © 2016年 小黑. All rights reserved.
//

#import "XHMusicViewController.h"

@interface XHMusicViewController ()

@end

@implementation XHMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //创建UI子控件
    [self setupSubViews];
}

#pragma mark - 自定义方法
-(void)setupSubViews{
    
    UIImageView * bgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"t_14528469155698af434e0a6"]];
    [self.view addSubview:bgView];
    bgView.frame=self.view.bounds;
    
    UIImageView * speckView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"file_56989dd35a5b5"]];
    [self.view addSubview:speckView];
    speckView.frame=self.view.bounds;
}

@end
