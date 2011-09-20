//
//  Utils.m
//  BEICClient
//
//  Created by 璐 李 on 11-8-15.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Availability.h>
#import <Foundation/Foundation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>

#import "Utils.h"

BOOL isCameraAvailable() {
    return([UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypeCamera]);
}

BOOL doesCameraSupportMediaType(NSString *paramMediaType, UIImagePickerControllerSourceType paramSourceType) {
    BOOL result = NO;
    if (paramMediaType == nil || [paramMediaType length] == 0) {
        return NO; 
    }
    
    if ([UIImagePickerController isSourceTypeAvailable:paramSourceType] == NO) {
        return NO;
    }
    
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    if (mediaTypes == nil) {
        return NO; 
    }
    
    for (NSString *mediaType in mediaTypes) {
        if ([mediaType isEqualToString:paramMediaType] == YES) {
            return(YES);
        }
    }
    
    return result;
}

BOOL doesCameraSupportShootingVideos() {
    return doesCameraSupportMediaType((NSString *)kUTTypeMovie, UIImagePickerControllerSourceTypeCamera); 
}

BOOL doesCameraSupportTakingPhotos() {
    return doesCameraSupportMediaType((NSString *)kUTTypeImage, UIImagePickerControllerSourceTypeCamera);
}

BOOL isFrontCameraAvailable() { 
    BOOL result = NO;
#ifdef __IPHONE_4_0
#if (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_0)
    result = [UIImagePickerController isCameraDeviceAvailable: UIImagePickerControllerCameraDeviceFront];
#endif
#endif
    return result; 
}

BOOL isRearCameraAvailable() {
    BOOL result = NO;
#ifdef __IPHONE_4_0
#if (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_0)
    result = [UIImagePickerController isCameraDeviceAvailable: UIImagePickerControllerCameraDeviceRear];
#endif
#endif
    return result;
}

BOOL isFlashAvailableOnRearCamera() {
    BOOL result = NO;
#ifdef __IPHONE_4_0
#if (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_0)
    result = [UIImagePickerController isFlashAvailableForCameraDevice: UIImagePickerControllerCameraDeviceRear];
#endif
#endif
    return result;
}

BOOL isFlashAvailableOnFrontCamera() {
    BOOL result = NO;
#ifdef __IPHONE_4_0
#if (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_0)
    result = [UIImagePickerController isFlashAvailableForCameraDevice: UIImagePickerControllerCameraDeviceFront];
#endif
#endif
    return result;
}


BOOL isAudioInputAvailable() {
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    return audioSession.inputIsAvailable;
}

BOOL isPhotoLibraryAvailable() {
    return ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary]);
}

BOOL canUserPickVideosFromPhotoLibrary() {
    return doesCameraSupportMediaType((NSString *)kUTTypeMovie, UIImagePickerControllerSourceTypePhotoLibrary);
}

BOOL canUserPickPhotosFromPhotoLibrary() {
    return doesCameraSupportMediaType((NSString *)kUTTypeImage, UIImagePickerControllerSourceTypePhotoLibrary);
}

BOOL isMultitaskingSupported() {
    BOOL result = NO;
    UIDevice *device = [UIDevice currentDevice];
    if ([device respondsToSelector:@selector(isMultitaskingSupported)]) {
#ifdef __IPHONE_4_0
#if (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_0)
        result = [device isMultitaskingSupported];
#endif
#endif
    }    
    return result;
}

NSString *makeUUID() {
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    NSString* uuid = [NSString stringWithString:(NSString *)uuidStringRef];
    CFRelease(uuidStringRef);
    return uuid;
}

//IplImage *CreateIplImageFromUIImage(UIImage *image) {
//	CGImageRef imageRef = image.CGImage;
//	
//	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//	IplImage *iplimage = cvCreateImage(cvSize(image.size.width, image.size.height), IPL_DEPTH_8U, 4);
//	CGContextRef contextRef = CGBitmapContextCreate(iplimage->imageData, iplimage->width, iplimage->height,
//													iplimage->depth, iplimage->widthStep,
//													colorSpace, kCGImageAlphaPremultipliedLast|kCGBitmapByteOrderDefault);
//	CGContextDrawImage(contextRef, CGRectMake(0, 0, image.size.width, image.size.height), imageRef);
//	CGContextRelease(contextRef);
//	CGColorSpaceRelease(colorSpace);
//	
//	IplImage *ret = cvCreateImage(cvGetSize(iplimage), IPL_DEPTH_8U, 3);
//	cvCvtColor(iplimage, ret, CV_RGBA2BGR);
//	cvReleaseImage(&iplimage);
//	
//	return ret;
//}
//
//UIImage *UIImageFromIplImage(IplImage *image) {
//	NSLog(@"IplImage (%d, %d) %d bits by %d channels, %d bytes/row %s", image->width, image->height, image->depth, image->nChannels, image->widthStep, image->channelSeq);
//	
//	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//	NSData *data = [NSData dataWithBytes:image->imageData length:image->imageSize];
//	CGDataProviderRef provider = CGDataProviderCreateWithCFData((CFDataRef)data);
//	CGImageRef imageRef = CGImageCreate(image->width, image->height,
//										image->depth, image->depth * image->nChannels, image->widthStep,
//										colorSpace, kCGImageAlphaNone|kCGBitmapByteOrderDefault,
//										provider, NULL, false, kCGRenderingIntentDefault);
//	UIImage *ret = [UIImage imageWithCGImage:imageRef];
//	CGImageRelease(imageRef);
//	CGDataProviderRelease(provider);
//	CGColorSpaceRelease(colorSpace);
//	return ret;
//}
