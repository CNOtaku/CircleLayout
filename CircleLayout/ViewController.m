//
//  ViewController.m
//  CircleLayout
//
//  Created by 楊利嘉 on 16/9/20.
//  Copyright © 2016年 楊利嘉. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
@interface ViewController ()

@property(nonatomic, assign)NSInteger cellCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.cellCount = 20;
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self.collectionView addGestureRecognizer:tapGes];
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.collectionView reloadData];
    
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.cellCount;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}
-(void)tapped:(UITapGestureRecognizer *)tap
{
    if (tap.state == UIGestureRecognizerStateEnded) {
        CGPoint initalPinchPoint = [tap locationInView:self.collectionView];
        
        NSIndexPath *tappedCellPath = [self.collectionView indexPathForItemAtPoint:initalPinchPoint];
        
        if (tappedCellPath != nil) {
            self.cellCount =self.cellCount -1;
            [self.collectionView performBatchUpdates:^{
                [self.collectionView deleteItemsAtIndexPaths:@[tappedCellPath]];
            } completion:nil];
        }else
        {
            self.cellCount = self.cellCount + 1;
            [self.collectionView performBatchUpdates:^{
                [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]]];
            } completion:nil];
            
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
