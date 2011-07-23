#import <Three20/Three20.h>

typedef enum {
  MockPhotoSourceNormal = 0,
  MockPhotoSourceDelayed = 1,
  MockPhotoSourceVariableCount = 2,
  MockPhotoSourceLoadError = 4,
} PhotoSourceType;

@interface PhotoSource : TTURLRequestModel <TTPhotoSource> {
  NSTimer * _fakeLoadTimer;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) PhotoSourceType sourceType;
@property (nonatomic, retain) NSArray *tempPhotos;
@property (nonatomic, retain) NSArray *photos;

- (id)initWithType:(PhotoSourceType)type title:(NSString*)title photos:(NSArray*)photos photos2:(NSArray*)photos2;

@end

@interface Photo : NSObject <TTPhoto> {

}

@property (nonatomic, assign) id <TTPhotoSource> photoSource;
@property (nonatomic, copy) NSString *thumbURL;
@property (nonatomic, copy) NSString *smallURL;
@property (nonatomic, copy) NSString *URL;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, copy) NSString *caption;

- (id)initWithURL:(NSString*)URL smallURL:(NSString*)smallURL size:(CGSize)size;
- (id)initWithURL:(NSString*)URL smallURL:(NSString*)smallURL size:(CGSize)size caption:(NSString*)caption;

@end
