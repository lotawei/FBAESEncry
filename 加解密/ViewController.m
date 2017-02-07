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
    //解密
    //原文
    //NSString   *plaintext = @"eyJpdiI6IjlSNGJhSHVoWU5pWW1OM0QzdzE5ZEE9PSIsInZhbHVlIjoiSXZTVmFkeFRqayszM1h5U1dQU3lYbjBBTnNHSHhUMXBKNjJqcmpcL01PNUZ2TDNPaTdiY2tYNEhOTkd0cEdocUJRMmk5Tk1reFZKQTlKMmNQc1wvM1VQMDBndUhOXC90ODMrODJwTzV0eFRxV1U9IiwibWFjIjoiYTBjOGJjOGJjOTJmZTg0NjhkZGRjMTY1MjE2YjViYjVjMzMzZjFlMTRjOGZiMzQ2NDU3MjdkZTg4N2EzNWVmNyJ9";
    //原文的值
    NSString  *value  = @"IvSVadxTjk+33XySWPSyXn0ANsGHxT1pJ62jrj\\/MO5FvL3Oi7bckX4HNNGtpGhqBQ2i9NMkxVJA9J2cPs\\/3UP00guHN\\/t83+82pO5txTqWU=";
    //base64解码
    NSData *decodedata = [[NSData alloc] initWithBase64EncodedString:value options:NSDataBase64DecodingIgnoreUnknownCharacters];
    //密钥
    NSString   *key = @"tCptz1sCsdv+5A8/heOy+J99XsQoo2xWwgWrcMX0rX4=";
    //base64解码
    NSData *keydecodedata = [[NSData alloc] initWithBase64EncodedString:key options:NSDataBase64DecodingIgnoreUnknownCharacters];
    //向量原文
    NSString  *iv = @"9R4baHuhYNiYmN3D3w19dA==";
    //向量base64解码
    NSData *ivdecodedata = [[NSData alloc] initWithBase64EncodedString:iv options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSData   *decrytor = [FBEncryptorAES  decryptData:decodedata key:keydecodedata iv:ivdecodedata];
    NSString   *result = [[ NSString alloc] initWithData:decrytor encoding:NSUTF8StringEncoding];
    NSLog(@"%@",result);
    //加密

    NSData   *encrydata = [FBEncryptorAES encryptData:decrytor key:keydecodedata iv:ivdecodedata ];
    NSString   *str =  [encrydata base64EncodedString];
    NSLog(@"%@",str);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
