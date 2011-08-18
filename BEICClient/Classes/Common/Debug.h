//
//  Debug.h
//  BEICClient
//
//  Created by 璐 李 on 11-8-13.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG
    #define PRPLog(format...) PRPDebug(__FILE__, __LINE__, format)
#else
    #define PRPLog(format...)
#endif