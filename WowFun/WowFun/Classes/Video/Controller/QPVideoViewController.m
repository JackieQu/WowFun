//
//  QPVideoViewController.m
//  WowFun
//
//  Created by JackieQu on 2019/8/7.
//  Copyright © 2019 WowFun. All rights reserved.
//

#import "QPVideoViewController.h"
#import "QPVideoCell.h"

@interface QPVideoViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView * collectionView;

@property (nonatomic, strong) NSMutableArray * dataList;

@end

@implementation QPVideoViewController

- (UICollectionView *)collectionView {
 
    if (!_collectionView) {
        
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        CGFloat itemW = (self.view.frame.size.width - 10 * 3) / 2;
        
        flowLayout.itemSize = CGSizeMake(itemW, itemW / 0.618);
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        [_collectionView registerClass:[QPVideoCell class] forCellWithReuseIdentifier:@"cellID"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerID"];
    }
    return _collectionView;
}

- (NSMutableArray *)dataList {
    
    if (!_dataList) {
        
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)initUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
 
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
 
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
 
    QPVideoCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor orangeColor];
    
//    UIView * avatarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
//    avatarView.backgroundColor = [UIColor blueColor];
//    [cell.contentView addSubview:avatarView];
//    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
 
    if (kind == UICollectionElementKindSectionHeader) {
        
        UICollectionReusableView * headerView = [[UICollectionReusableView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
        headerView.backgroundColor = [UIColor blueColor];
        return headerView;
    }
    return nil;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 
    NSLog(@"section: %@, row: %@", @(indexPath.section), @(indexPath.row));
}

#pragma mark - UICollectionViewDelegateFlowLayout

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//
//    if (indexPath.section == 0) {
//        return CGSizeMake(20, 20);
//    }
//    return CGSizeMake(40, 40);
//}

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//
//    if (section == 0) {
//        return UIEdgeInsetsMake(20, 30, 40, 50);
//    }
//    return UIEdgeInsetsMake(10, 10, 10, 10);
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
