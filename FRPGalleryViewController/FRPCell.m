//
//  FRPCell.m
//  FRPGalleryViewController
//
//  Created by Alex on 4/22/15.
//  Copyright (c) 2015 北京咦呀书宏网络科技有限公司. All rights reserved.
//

#import "FRPCell.h"
#import "FRPPhotoModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>



@interface  FRPCell()

@property(nonatomic,weak)UIImageView *imageView;
@property(nonatomic,strong)RACDisposable *subscription;

@end

@implementation FRPCell


-(id)initWithFrame:(CGRect)frame{
     self = [super initWithFrame:frame];
     if (!self) return nil;
    
     // Configure self
     self.backgroundColor = [UIColor darkGrayColor];
    
     // Configure subivews
     UIImageView *imageView = [[UIImageView alloc]
                                 initWithFrame:self.bounds];
     imageView.autoresizingMask =
     UIViewAutoresizingFlexibleHeight |
     UIViewAutoresizingFlexibleWidth;
     [self.contentView addSubview:imageView];
     self.imageView = imageView;
    
     return self;
}


-(void)setPhotoModel:(FRPPhotoModel*)photoModel{ self.subscription =
    [[[RACObserve(photoModel,thumbnailData)
       filter:^BOOL(id value) {
        return value != nil;
       }] map:^id(id value) {
            return [UIImage imageWithData:value];
       }] setKeyPath:@keypath(self.imageView, image)
          onObject:self.imageView];
}

-(void)prepareForReuse{
    [super prepareForReuse];
    [self.subscription dispose], self.subscription = nil;
}



@end
