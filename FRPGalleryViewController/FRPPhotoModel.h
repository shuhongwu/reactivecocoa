//
//  FRPPhotoModel.h
//  FRPGalleryViewController
//
//  Created by Alex on 4/22/15.
//  Copyright (c) 2015 北京咦呀书宏网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRPPhotoModel:NSObject

@property(nonatomic,strong)NSString *photoName;
@property(nonatomic,strong)NSNumber *identifier;
@property(nonatomic,strong)NSString *photographerName;
@property(nonatomic,strong)NSNumber *rating;
@property(nonatomic,strong)NSString *thumbnailURL;
@property(nonatomic,strong)NSData *thumbnailData;
@property(nonatomic,strong)NSString *fullsizedURL;
@property(nonatomic,strong)NSData *fullsizedData;

@end
