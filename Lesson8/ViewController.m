//
//  ViewController.m
//  Lesson8
//
//  Created by iOS-School-2 on 22.04.17.
//  Copyright © 2017 iOS-School-2. All rights reserved.
//

#import "ViewController.h"
#import "Canvas.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *canvas;

@end

@implementation ViewController

//- (instancetype) init {
//    return [super init];
//}
//
//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    return [super initWithCoder:aDecoder];
//}
//
//- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//}

#pragma mark - Life Cycle

- (void)loadView {
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureUI];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Configuration

- (void) configureUI {
    self.view.backgroundColor = [UIColor blackColor];
    self.canvas = [Canvas new];
    [self.view addSubview:self.canvas];
     }

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGFloat horizontalOffset = 20;
    CGFloat verticalOffset = 50;
    
    CGFloat width = self.view.bounds.size.width - 2* horizontalOffset;
    CGFloat height = self.view.bounds.size.height - 2* verticalOffset;
    
    self.canvas.frame = CGRectMake(horizontalOffset, verticalOffset, width, height);
    
}


@end
