//
//  XHMusicViewController.m
//  HXReader
//
//  Created by 小黑 on 16/9/22.
//  Copyright © 2016年 小黑. All rights reserved.
//

#import "XHMusicViewController.h"
#import "XHTestController.h"
#import <AVFoundation/AVFoundation.h>
#import <Masonry.h>

@interface XHMusicViewController ()
@property(nonatomic,strong)AVPlayer * player;
@end

@implementation XHMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //创建UI子控件
    [self setupSubViews];
}

#pragma mark - 自定义方法
-(void)setupSubViews{
    
    UIImageView * bgView=[self setupImageViewWithName:@"t_1"];
    bgView.frame=self.view.bounds;
    
    UIImageView * speckView=[self setupImageViewWithName:@"file_56989dd35a5b5"];
    
    UIImageView * oneView=[self setupImageViewWithName:@"o_14"];
    
    UIImageView * twoView=[self setupImageViewWithName:@"file_5698adcd2beb6"];
    
    UIImageView * threeView=[self setupImageViewWithName:@"file_5698ae37a2425"];
    
    //音乐播放
    UIButton * musicBtn=[[UIButton alloc]init];
    [musicBtn setImage:[UIImage imageNamed:@"audio1"] forState:UIControlStateNormal];
    [musicBtn setImage:[UIImage imageNamed:@"audio2"] forState:UIControlStateSelected];
    [self.view addSubview:musicBtn];
    [musicBtn addTarget:self action:@selector(clickPlayerMusic:) forControlEvents:UIControlEventTouchUpInside];
    //加载音乐
    NSURL * url=[[NSURL alloc]initWithString:@"http://36.250.76.62/thirdparty.gtimg.com/C100001Z7sB532o6L0.m4a?fromtag=38&songid=7261453&wsiphost=ipdb"];
    self.player=[AVPlayer playerWithURL:url];
    [self.player play];
    
    //点击测试按钮
    UIButton * clickBtn=[[UIButton alloc]init];
    [clickBtn setBackgroundColor:[UIColor colorWithRed:175/256.0 green:43/256.0 blue:38/256.0 alpha:1]];
    [clickBtn setTitle:@"点击测试" forState:UIControlStateNormal];
    [self.view addSubview:clickBtn];
    clickBtn.titleLabel.font=[UIFont systemFontOfSize:20];
    
    clickBtn.layer.cornerRadius=20;
    clickBtn.layer.masksToBounds=YES;
    
    [clickBtn addTarget:self action:@selector(clickText) forControlEvents:UIControlEventTouchUpInside];
    
    /*************************Masonry******************************/
    
    [speckView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
    }];
    
    [oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-30);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    [twoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(oneView);
        make.centerY.equalTo(oneView).offset(-20);
    }];
    
    [threeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(twoView);
        make.width.height.equalTo(self.view.mas_width);
    }];
    
    [musicBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(30);
        make.right.equalTo(self.view).offset(-30);
        make.size.mas_equalTo(40);
    }];
    
    [clickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-50);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    
    /*************************动画效果******************************/
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 20;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = MAXFLOAT;
    
    [musicBtn.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    [threeView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    [speckView.layer addAnimation:[self opacityForever_Animation:3] forKey:nil];
    
}

-(UIImageView *)setupImageViewWithName:(NSString *)name{
    UIImageView * imgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:name]];
    [self.view addSubview:imgView];
    return imgView;
}

 //闪烁效果
-(CABasicAnimation *)opacityForever_Animation:(float)time{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];//必须写opacity才行。
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    animation.toValue = [NSNumber numberWithFloat:0.0f];//这是透明度。
    animation.autoreverses = YES;
    animation.duration = time;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];///没有的话是均匀的动画。
    return animation;
}

#pragma mark - 事件源
//音乐播放
-(void)clickPlayerMusic:(UIButton *)btn{
    btn.selected=!btn.selected;
    if (btn.selected) {
        [self.player pause];
    }else{
        [self.player play];
    }
}

//点击测试
-(void)clickText{
    UICollectionViewFlowLayout * layout =[[UICollectionViewFlowLayout alloc]init];
    layout.itemSize=[UIScreen mainScreen].bounds.size;
    layout.minimumLineSpacing=0;
    layout.minimumInteritemSpacing=0;
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    
    XHTestController * testCtr=[[XHTestController alloc]initWithCollectionViewLayout:layout];
    
    UIWindow * win=[UIApplication sharedApplication].keyWindow;
    win.rootViewController=testCtr;
}
@end
