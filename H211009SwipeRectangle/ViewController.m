//
//  ViewController.m
//  H211009SwipeRectangle
//
//  Created by houwei2021 on 2021/10/9.
//

//屏幕尺寸
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

#import "ViewController.h"
#import "H211009SwipeRectangle-Swift.h"

@interface ViewController ()

@property (strong, nonatomic) UIScrollView *scrollView;

//@property (strong, nonatomic) RectView *rectView;

@property (strong, nonatomic) UIView *dragView;

@property (nonatomic) CGFloat dragViewWidth;
@property (nonatomic) CGFloat dragViewHeight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.dragViewWidth = 150;
    self.dragViewHeight = 100;
    
    [self addSubviews];
    [self addRecognizer];
}

- (void)addSubviews {
    
    self.dragView = [[UIView alloc] init];
    self.dragView.backgroundColor = [UIColor yellowColor];
    self.dragView.frame = CGRectMake(100, 100, self.dragViewWidth, self.dragViewHeight);
    self.dragView.layer.cornerRadius = 3;
    self.dragView.layer.masksToBounds = YES;
    [self.view addSubview:self.dragView];
}

- (void)addRecognizer {
    
//    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureRecognizerAction:)];
//    recognizer.direction = UISwipeGestureRecognizerDirectionDown;
//    [self.view addGestureRecognizer:recognizer];
    
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizerAction:)];
    [self.dragView addGestureRecognizer:recognizer];
}

- (void)panGestureRecognizerAction:(UIPanGestureRecognizer *)recognizer {
    
    if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [recognizer translationInView:self.dragView];
        
        CGFloat tempX = self.dragView.center.x + translation.x;
        CGFloat tempY = self.dragView.center.y + translation.y;
        CGFloat tempWidth = self.dragViewWidth / 2;
        CGFloat tempHeight = self.dragViewHeight / 2;
        
        //防止 x 坐标越界
        if (tempX <= tempWidth || tempX > kScreenWidth - tempWidth) {
            return;
        }
        
        //防止 y 坐标越界
        if (tempY <= tempHeight || tempY > kScreenHeight - tempHeight) {
            return;
        }
        
        self.dragView.center = CGPointMake(tempX, tempY);
        
        //关键:不设为零会不断递增，视图会突然不见
        [recognizer setTranslation:CGPointZero inView:self.view];
    }
}

//- (void)swipeGestureRecognizerAction:(UISwipeGestureRecognizer *)recognizer {
//
//    if (recognizer.state == UIGestureRecognizerStateBegan) {
//
//        CGPoint point = [recognizer locationInView:self.view];
//        NSLog(@"-->> 1 point:%@", NSStringFromCGPoint(point));
//
//    } else if(recognizer.state == UIGestureRecognizerStateEnded){
//        //起点坐标
//        CGPoint point = [recognizer locationInView:self.view];
//        NSLog(@"-->> start point:%@", NSStringFromCGPoint(point));
//    }
//}

@end
