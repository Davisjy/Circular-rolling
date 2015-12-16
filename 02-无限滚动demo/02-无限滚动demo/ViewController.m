//
//  ViewController.m
//  02-无限滚动demo
//
//  Created by qingyun on 15/12/16.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "HMNewsCell.h"
#import "HMNews.h"
#import "MJExtension.h"

#define kIdentifier @"news"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *images;
@end

@implementation ViewController

- (NSArray *)images
{
    if (_images == nil) {
        _images = [HMNews objectArrayWithFilename:@"newses.plist"];
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HMNewsCell" bundle:nil] forCellWithReuseIdentifier:kIdentifier];
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:50] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HMNewsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kIdentifier forIndexPath:indexPath];
    cell.news = self.images[indexPath.item];
    return cell;
}

@end
