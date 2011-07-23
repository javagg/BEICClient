#import "PhotoSource.h"

@implementation PhotoSource

@synthesize title, sourceType, tempPhotos, photos;

// private

- (void)fakeLoadReady {
  _fakeLoadTimer = nil;

  if (sourceType & MockPhotoSourceLoadError) {
      [_delegates perform: @selector(model:didFailLoadWithError:)
                                withObject: self
                                withObject: nil];
  } else {
    NSMutableArray* newPhotos = [NSMutableArray array];

    for (int i = 0; i < self.photos.count; ++i) {
      id<TTPhoto> photo = [self.photos objectAtIndex:i];
      if ((NSNull*)photo != [NSNull null]) {
        [newPhotos addObject:photo];
      }
    }

    [newPhotos addObjectsFromArray:self.tempPhotos];
      self.tempPhotos = nil;

      self.photos = newPhotos;

    for (int i = 0; i < self.photos.count; ++i) {
      id<TTPhoto> photo = [self.photos objectAtIndex:i];
      if ((NSNull*)photo != [NSNull null]) {
        photo.photoSource = self;
        photo.index = i;
      }
    }

    [_delegates perform:@selector(modelDidFinishLoad:) withObject:self];
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithType:(PhotoSourceType)type title:(NSString *)aTitle photos:(NSArray *)aPhotos photos2:(NSArray *)aPhotos2 {
    self = [super init];
    if (self != nil) {
        self.sourceType = type;
        self.title = aTitle;
        self.photos = aPhotos2 ? [aPhotos mutableCopy] : [[NSMutableArray alloc] init];
        self.tempPhotos = aPhotos2 ? aPhotos2 : aPhotos;
        _fakeLoadTimer = nil;
        
        for (int i = 0; i < aPhotos.count; ++i) {
            id<TTPhoto> photo = [aPhotos objectAtIndex:i];
            if ((NSNull*)photo != [NSNull null]) {
                photo.photoSource = self;
                photo.index = i;
            }
        }
        
        if (!(sourceType & MockPhotoSourceDelayed || aPhotos2)) {
            [self performSelector:@selector(fakeLoadReady)];
        }
    }
    return self;
}

- (id)init {
    return [self initWithType:MockPhotoSourceNormal title:nil photos:nil photos2:nil];
}

- (void)dealloc {
  [_fakeLoadTimer invalidate];
    self.photos = nil;
    self.tempPhotos = nil;
    self.title = nil;
    [super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTModel

- (BOOL)isLoading {
  return !!_fakeLoadTimer;
}

- (BOOL)isLoaded {
  return !!self.photos;
}

- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more {
  if (cachePolicy & TTURLRequestCachePolicyNetwork) {
    [_delegates perform:@selector(modelDidStartLoad:) withObject:self];

      self.photos = nil;
    _fakeLoadTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self
      selector:@selector(fakeLoadReady) userInfo:nil repeats:NO];
  }
}

- (void)cancel {
  [_fakeLoadTimer invalidate];
  _fakeLoadTimer = nil;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTPhotoSource

- (NSInteger)numberOfPhotos {
  if (self.tempPhotos) {
    return self.photos.count + (sourceType & MockPhotoSourceVariableCount ? 0 : self.tempPhotos.count);
  } else {
    return self.photos.count;
  }
}

- (NSInteger)maxPhotoIndex {
  return self.photos.count-1;
}

- (id<TTPhoto>)photoAtIndex:(NSInteger)photoIndex {
  if (photoIndex < self.photos.count) {
    id photo = [self.photos objectAtIndex:photoIndex];
    if (photo == [NSNull null]) {
      return nil;
    } else {
      return photo;
    }
  } else {
    return nil;
  }
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////

@implementation Photo

@synthesize URL, smallURL, thumbURL, photoSource, size, index, caption;

- (id)initWithURL:(NSString *)aURL smallURL:(NSString *)aSmallURL size:(CGSize)aSize {
    return [self initWithURL:aURL smallURL:aSmallURL size:aSize caption:nil];
}

- (id)initWithURL:(NSString *)aURL smallURL:(NSString *)aSmallURL size:(CGSize)aSize
    caption:(NSString *)aCaption {
    self = [super init];
    if (self != nil) {
        self.photoSource = nil;
        self.URL = aURL;
        self.smallURL = aSmallURL;
        self.thumbURL = aSmallURL;;
        self.size = aSize;
        self.caption = aCaption;
        self.index = NSIntegerMax;
    }
    return self;
}

- (void)dealloc {
    self.URL = nil;
    self.smallURL = nil;
    self.thumbURL = nil;
    self.caption = nil;
    [super dealloc];
}

- (NSString *)URLForVersion:(TTPhotoVersion)version {
    if (version == TTPhotoVersionLarge) {
        return self.URL;
    } else if (version == TTPhotoVersionMedium) {
        return self.URL;
    } else if (version == TTPhotoVersionSmall) {
        return self.smallURL;
    } else if (version == TTPhotoVersionThumbnail) {
        return self.thumbURL;
    } else {
        return nil;
    }
}

@end
