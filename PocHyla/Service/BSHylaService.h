//
//  BSHylaService.h
//  PocHyla
//
//  Created by Dima Yarmolchuk on 12/28/15.
//  Copyright © 2015 Dima Yarmolchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BSInjectJsModel;

@interface BSHylaService : NSObject

+ (BSHylaService *)sharedInstance;

- (void)listServiceWithSuccess:(void (^)(NSArray *services))success
                       failure:(void (^)(NSError *error))failure;

- (void)linkInjectjsWithServiceCode:(NSString *)code withSuccess:(void (^)(BSInjectJsModel *injectJsModel))success
                                                         failure:(void (^)(NSError *error))failure;

@end
