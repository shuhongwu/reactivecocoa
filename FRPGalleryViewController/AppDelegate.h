//
//  AppDelegate.h
//  FRPGalleryViewController
//
//  Created by Alex on 4/22/15.
//  Copyright (c) 2015 北京咦呀书宏网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <500px-iOS-api/PXAPI.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property(nonatomic,readonly) PXAPIHelper *apiHelper;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

