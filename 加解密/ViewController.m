//
//  ViewController.m
//  加解密
//
//  Created by lotawei on 17/1/22.
//  Copyright © 2017年 lotawei. All rights reserved.
//
#import "ViewController.h"
#import "FBEncryptorAES.h"
#import "NSData+Base64.h"
#import "NSString+Format.h"
@interface ViewController ()
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //加密
    NSDictionary   *dic = [NSDictionary  dictionaryWithObjectsAndKeys:@"晴",@"weather",@"38",@"temp", nil];
    NSString  *encdata =  [FBEncryptorAES  curencryptData:dic];
    NSLog(@"%@",encdata);
    //解密
    NSDictionary *decrydic =  [FBEncryptorAES  curdecryptData:encdata];
    NSLog(@"%@",decrydic[@"weather"]);
    
    NSLog(@"hello");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
