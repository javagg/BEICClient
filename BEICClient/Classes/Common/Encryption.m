//
//  Encryption.m
//  BEICClient
//
//  Created by 璐 李 on 11-8-20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <CommonCrypto/CommonCryptor.h>
#import "Encryption.h"

@implementation NSData (Encryption)

- (NSData *)transpose:(NSString *)_key forOperation:(CCOperation)operation {
    char key[kCCKeySizeAES256 + 1];
    bzero(key, sizeof(key));
    [_key getCString:key maxLength:sizeof(key) encoding:NSUTF8StringEncoding];
    size_t allocatedSize = self.length + kCCBlockSizeAES128;
    void *output = malloc(allocatedSize);
    size_t actualSize = 0;
    CCCryptorStatus resultCode = CCCrypt(operation, kCCAlgorithmAES128, kCCOptionPKCS7Padding, key, kCCKeySizeAES256, nil, self.bytes, self.length, output, allocatedSize, &actualSize);
    if (resultCode != kCCSuccess) {
        free(output);
        return nil;
    }
    return [NSData dataWithBytesNoCopy:output length:actualSize];
}

- (NSData *)encryptWithKey:(NSString *)key {
    return [self transpose:key forOperation:kCCEncrypt];
}

- (NSData *)decryptWithKey:(NSString *)key {
    return [self transpose:key forOperation:kCCDecrypt];
}
@end
