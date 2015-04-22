//
//  FRPGalleryFlowLayout.m
//  FRPGalleryViewController
//
//  Created by Alex on 4/22/15.
//  Copyright (c) 2015 北京咦呀书宏网络科技有限公司. All rights reserved.
//

#import "FRPGalleryFlowLayout.h"

@implementation FRPGalleryFlowLayout

-(instancetype)init{

    if(!(self = [super init])) return nil;
    
    self.itemSize = CGSizeMake(145, 145);
    self.minimumInteritemSpacing = 10;
    self.minimumLineSpacing = 10;
    self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    return self;
    
}

@end
