//
//  FRPGalleryViewController.h
//  FRPGalleryViewController
//
//  Created by Alex on 4/22/15.
//  Copyright (c) 2015 北京咦呀书宏网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FRPGalleryFlowLayout.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <libextobjc/EXTScope.h>



@interface FRPGalleryViewController : UICollectionViewController

@property(nonatomic,strong) NSArray *photosArray;

@end
