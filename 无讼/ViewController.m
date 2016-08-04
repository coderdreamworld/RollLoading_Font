//
//  ViewController.m
//  无讼
//
//  Created by mac on 16/8/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    img1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    img1.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/1.png",[[NSBundle mainBundle] bundlePath]]];
////    img1.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"./1.png"]];
//    [self.view addSubview:img1];
//    img1.layer.anchorPoint = CGPointMake(0, 0);
//    img1.frame = CGRectMake(0, 0, 100, 100);
//    
//    img2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    img2.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/2.png",[[NSBundle mainBundle] bundlePath]]];
//    [self.view addSubview:img2];
//    img2.layer.anchorPoint = CGPointMake(0.2, 0.2);
//    img2.frame = CGRectMake(0, 0, 100, 100);
//    
//    img3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    img3.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/3.png",[[NSBundle mainBundle] bundlePath]]];
//    [self.view addSubview:img3];
//    img3.layer.anchorPoint = CGPointMake(0.4, 0.4);
//    img3.frame = CGRectMake(0, 0, 100, 100);
//    
//    img4 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    img4.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/4.png",[[NSBundle mainBundle] bundlePath]]];
//    [self.view addSubview:img4];
//    img4.layer.anchorPoint = CGPointMake(0.6, 0.6);
//    img4.frame = CGRectMake(0, 0, 100, 100);
    
    for (int i = 0; i < 9; i++) {
        UIImageView*imageV = [[UIImageView alloc] init];
        imageV.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%d.png",[[NSBundle mainBundle] bundlePath],i+1]];
        [self.view addSubview:imageV];
        imageV.layer.anchorPoint = CGPointMake(1-0.1*i, 1-0.1*i);
        imageV.frame = CGRectMake(0, 0, i<4?100:200, 100);
        arr[8-i] = imageV;
    }
    
//    CALayer *layer = img1.layer;
    CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
//    rotationAndPerspectiveTransform.m34 = 1.0 / -500;
    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 180.0f * M_PI / 180.0f, 0.5f, 1.0f, 0.5f);
    [UIView animateWithDuration:3 animations:^(){
//        img1.layer.transform = rotationAndPerspectiveTransform;
//        img2.layer.transform = rotationAndPerspectiveTransform;
//        img3.layer.transform = rotationAndPerspectiveTransform;
//        img4.layer.transform = rotationAndPerspectiveTransform;
    }];
    
    
//    arr[3]=img1;
//    arr[2]=img2;
//    arr[1]=img3;
//    arr[0]=img4;
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(100, 200, 200, 30)];
    [self.view addSubview:slider];
    [slider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
    slider.value = 1.0;
    [self rotate:1.0];
    
}

- (void)sliderValueChange:(id)sender {
    
    
    CGFloat f = ((UISlider *)sender).value;
    [self rotate:f];
    
    
    
    
//    img1.layer.transform = CATransform3DRotate(rotationAndPerspectiveTransform, (-f * M_PI+fX[0])>0?0:(-f * M_PI+fX[0]), f, 0.5, 1);
//    img2.layer.transform = rotationAndPerspectiveTransform;
//    img3.layer.transform = rotationAndPerspectiveTransform;
//    img4.layer.transform = rotationAndPerspectiveTransform;
}

- (void)rotate:(float)f {
    float fX[9] = {0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9};
    CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
    //    rotationAndPerspectiveTransform.m34 = 1.0 / -500;
    //    rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, -f * M_PI, f, 0.5, 1);
    
    for (int i = 0; i < 9; i++) {
        arr[i].layer.transform = CATransform3DRotate(rotationAndPerspectiveTransform, (-f * M_PI+fX[i])>0?0:(-f * M_PI+fX[i]), f, 0.5, 0.7*f);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
