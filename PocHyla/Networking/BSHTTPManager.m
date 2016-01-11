//
//  BSHTTPManager.m
//  PocHyla
//
//  Created by Dima Yarmolchuk on 12/28/15.
//  Copyright © 2015 Dima Yarmolchuk. All rights reserved.
//

#import "BSHTTPManager.h"
#import "SBMappingProvider+SBServiceModel.h"

@implementation BSHTTPManager

+ (BSHTTPManager *)sharedInstance {
    static BSHTTPManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BSHTTPManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://bs1-tz:5000/"]];
    });
    
    return sharedInstance;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    
    if (self) {
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}

- (BOOL)connected {
    return YES;
}

- (void)receiveDataByLink:(NSString *)url withSuccess:(void (^)(id response))success failure:(void (^)(NSError *error))failure {
    if ([self connected]) {        
        [self GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            if (success) {
                success(responseObject);
            }
        }
        failure:^(NSURLSessionDataTask *dataTask, NSError *error) {
            if (failure) {
                failure(error);
            }
        }];
    } else {
        // not connected
        failure(nil);
    }
}

@end
