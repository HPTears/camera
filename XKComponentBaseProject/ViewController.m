//
//  ViewController.m
//  XKComponentBaseProject
//
//  Created by Jamesholy on 2019/2/27.
//  Copyright © 2019 Jamesholy. All rights reserved.
//

#import "ViewController.h"
#import <XKAuthorityTool.h>

#import "HVideoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self takeFromCamera];
}

#pragma mark - 拍摄
- (void)takeFromCamera {
    [XKAuthorityTool judegeCanRecord:^{
        [XKAuthorityTool judgeAuthorityType:PrivacyAuthorityTypeAlbum needGuide:YES has:^{
            [self takeFromCameraAction];
        } hasnt:^{
            //
        }];
    }];
}

- (void)takeFromCameraAction {
    HVideoViewController *ctrl = [[NSBundle mainBundle] loadNibNamed:@"HVideoViewController" owner:nil options:nil].lastObject;
    ctrl.HSeconds = 15;//设置可录制最长时间
    ctrl.takeBlock = ^(id item, UIImage *firstImg) {
      
    };
    [self presentViewController:ctrl animated:YES completion:nil];
}


@end
