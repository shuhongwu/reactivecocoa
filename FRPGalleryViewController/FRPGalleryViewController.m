//
//  FRPGalleryViewController.m
//  FRPGalleryViewController
//
//  Created by Alex on 4/22/15.
//  Copyright (c) 2015 北京咦呀书宏网络科技有限公司. All rights reserved.
//

#import "FRPGalleryViewController.h"
#import "FRPPhotoImporter.h"
#import "FRPCell.h"

@interface FRPGalleryViewController ()

@end

@implementation FRPGalleryViewController

static NSString * const reuseIdentifier = @"Cell";



-(id)init
{
     FRPGalleryFlowLayout *flowLayout = [[FRPGalleryFlowLayout alloc] init];
     self = [self initWithCollectionViewLayout:flowLayout];
     if (!self) return nil;
    
     return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Popular on 500px";
    
    [self.collectionView registerClass:[FRPCell class] forCellWithReuseIdentifier:reuseIdentifier];

    
    
    //Reactive Stuff
    @weakify(self);
    
    [RACObserve(self, photosArray) subscribeNext:^(id x) {
        @strongify(self);
        [self.collectionView reloadData];
    }];
    
    [self loadPopularPhotos];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    
    // Do any additional setup after loading the view.
}



-(void)loadPopularPhotos{
    [[FRPPhotoImporter importPhotos] subscribeNext:^(id x) {
        self.photosArray = x;
        
    }error:^(NSError *error) {
        NSLog(@"Couldn't fetch photos from 500px: %@",error);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
     return self.photosArray.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath{
    
    FRPCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell setPhotoModel:self.photosArray[indexPath.row]];
    return cell;
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
