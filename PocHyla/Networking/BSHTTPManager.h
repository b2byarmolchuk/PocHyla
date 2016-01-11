//
//  BSHTTPManager.h
//  PocHyla
//
//  Created by Dima Yarmolchuk on 12/28/15.
//  Copyright © 2015 Dima Yarmolchuk. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface BSHTTPManager : AFHTTPSessionManager

+ (BSHTTPManager *)sharedInstance;

- (void)receiveDataByLink:(NSString *)url withSuccess:(void (^)(id response))success
                                              failure:(void (^)(NSError *error))failure;

@end
