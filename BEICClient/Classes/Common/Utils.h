//
//  Utils.h
//  BEICClient
//
//  Created by 璐 李 on 11-8-15.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

BOOL isCameraAvailable();
BOOL doesCameraSupportMediaType(NSString *paramMediaType, UIImagePickerControllerSourceType paramSourceType);
BOOL doesCameraSupportShootingVideos();
BOOL doesCameraSupportTakingPhotos();
BOOL isFrontCameraAvailable();
BOOL isRearCameraAvailable();
BOOL isFlashAvailableOnFrontCamera();
BOOL isFlashAvailableOnRearCamera();

BOOL isPhotoLibraryAvailable();
BOOL canUserPickVideosFromPhotoLibrary();
BOOL canUserPickPhotosFromPhotoLibrary();

NSString *makeUUID();
