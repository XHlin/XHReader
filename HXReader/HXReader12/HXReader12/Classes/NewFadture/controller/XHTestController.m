//
//  XHTestController.m
//  HXReader12
//
//  Created by 小黑 on 16/9/22.
//  Copyright © 2016年 小黑. All rights reserved.
//

#import "XHTestController.h"
#import "XHTestCell.h"

@interface XHTestController ()

@end

@implementation XHTestController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[XHTestCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.pagingEnabled=YES;
    self.collectionView.bounces=NO;
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XHTestCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    return cell;
}

@end
