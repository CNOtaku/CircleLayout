//
//  CircleLayout.m
//  CircleLayout
//
//  Created by 楊利嘉 on 16/9/20.
//  Copyright © 2016年 楊利嘉. All rights reserved.
//

#import "CircleLayout.h"


#define ITEM_SIZE 70

@interface CircleLayout ()

@property(nonatomic, assign)CGPoint center;
@property(nonatomic, assign)CGFloat radius;
@property(nonatomic, assign)NSInteger cellCount;

@end

@implementation CircleLayout

-(void)prepareLayout
{
    [super prepareLayout];
    
    CGSize size = self.collectionView.frame.size;
    _cellCount = [[self collectionView] numberOfItemsInSection:0];
    _center = CGPointMake(size.width/2.f, size.height/2.f);
    _radius = MIN(size.width, size.height)/2.5;
    
}

-(CGSize)collectionViewContentSize
{
    return self.collectionView.frame.size;
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path
{
    UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
    attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
    attributes.center = CGPointMake(_center.x + _radius * cosf(2 * path.item * M_PI / _cellCount),
                                    _center.y + _radius * sinf(2 * path.item * M_PI / _cellCount));
    return attributes;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *attributes = [NSMutableArray array];
    for (NSInteger i = 0; i<self.cellCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    
    return attributes;
}

-(UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes *attributed = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    
    attributed.alpha = 0.0f;
    attributed.center = _center;
    
    return attributed;
}

//- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForInsertedItemAtIndexPath:(NSIndexPath *)itemIndexPath
//{
//    UICollectionViewLayoutAttributes* attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
//    attributes.alpha = 0.0;
//    attributes.center = CGPointMake(_center.x, _center.y);
//    return attributes;
//}

-(UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0.0f;
    attributes.center = _center;
    
    attributes.transform3D = CATransform3DMakeScale(2.1, 0.5, 2.0);
    
    return attributes;
}




@end
