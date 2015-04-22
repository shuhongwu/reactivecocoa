//
//  FRPPhotoImporter.h
//  FRPGalleryViewController
//
//  Created by Alex on 4/22/15.
//  Copyright (c) 2015 北京咦呀书宏网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>


@interface FRPPhotoImporter : NSObject

+(RACSignal*)importPhotos;


@end
