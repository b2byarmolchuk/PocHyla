//
//  BSHylaActivationViewController.m
//  PocHyla
//
//  Created by Dima Yarmolchuk on 12/28/15.
//  Copyright © 2015 Dima Yarmolchuk. All rights reserved.
//

#import "BSHylaActivationViewController.h"
#import "BSServiceModel.h"
#import "BSInjectJsModel.h"
#import "BSHylaService.h"

@interface BSHylaActivationViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation BSHylaActivationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://bs1-tz:5000/%@", self.service.url]];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:requestObj];
    self.webView.delegate = self;
}

- (void)js {
    [[BSHylaService sharedInstance] linkInjectjsWithServiceCode:self.service.uid withSuccess:^(BSInjectJsModel *injectJsModel) {
        [self injectJavascript:injectJsModel.js];
    } failure:^(NSError *error) {
        NSLog(@"%@", error);        
    }];
}

- (void)injectJavascript:(NSString *)js {
    [self.webView stringByEvaluatingJavaScriptFromString:js];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self js];
}

@end
