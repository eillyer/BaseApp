//
//  WebViewVC.m
//  baishanghui
//
//  Created by Test on 2019/2/28.
//  Copyright © 2019 eillyer. All rights reserved.
//

#import "WebViewVC.h"

@interface WebViewVC ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *web;

@end

@implementation WebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];

    
    NSURL *url = [NSURL URLWithString:self.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.web.delegate = self;
    [self.web loadRequest:request];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString * requestString = request.URL.scheme;
    NSArray *pathComponents = [request.URL pathComponents];
    
    NSLog(@"%@",requestString);

    
    if ([requestString isEqualToString:@"exitGame"]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    return YES;
}



- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}

- (void )webViewDidFinishLoad:(UIWebView  *)webView{
     
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    
}
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

-(NSString *)convertToJsonData:(NSDictionary *)dict
{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}

- (void)CallOCFunctionFirstParameter:(NSString *)Parameter{
    NSLog(@"===%@",Parameter);
    
}

@end
