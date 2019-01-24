//
//  Canvas.m
//  Lesson8
//
//  Created by iOS-School-2 on 22.04.17.
//  Copyright © 2017 iOS-School-2. All rights reserved.
//

#import "Canvas.h"

@implementation Canvas

#pragma mark - Init
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configure];
    }
    return self;
}

#pragma mark - configuration

- (void) configure {
    self.backgroundColor = [UIColor whiteColor];
//    self.layer.cornerRadius = 100;
    
}

#pragma mark - layout

- (void) layoutSubviews {
    [super layoutSubviews];
//    self.layer.cornerRadius = self.bounds.size.width/2;
}

- (void)drawRect:(CGRect)rect {
    [self drawAHouseInRect:rect];
//    CGContextRef context = UIGraphicsGetCurrentContext();
    //    [self drawCurveInContext:context inRect:rect];
//        [self drawPictureInRect:rect];

}

- (void)drawCurveInContext:(CGContextRef)context inRect:(CGRect)rect {
//        CGColorRef color = [[UIColor blackColor] CGColor];
//    
//        CGContextSetStrokeColorWithColor(context, color);
//        CGContextSetLineWidth(context, 5.0);
//        CGContextMoveToPoint(context, CGPointZero.x, CGPointZero.y);
//        CGContextAddLineToPoint(context, rect.size.width, rect.size.height/2);
//        CGContextAddLineToPoint(context, 0.0, rect.size.height);
//        CGContextDrawPath(context, kCGPathStroke);
}

- (void)drawAHouseInRect:(CGRect)rect  {
    [self drawRoofInRect:rect];
    [self drawWallsInRect:rect];
    [self drawTubeInRect:rect];
    [self drawOvalWindowInRect:rect];
    [self drawWindowInRect:rect];
    [self drawFenceInRect:rect];
    [self drawBirdsInRect:rect];
    
}

// 1
- (void)drawRoofInRect:(CGRect)rect  {
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    [[UIColor blackColor] setStroke];
    
    CGFloat topOffset = 200;
    CGFloat roofHeight = 150;
    CGFloat edgeOffset = 20;
    CGFloat newLeftEdgeOffset = edgeOffset + rect.size.width/3;
    CGFloat xCenter = 2*rect.size.width/3;
    
    CGPoint startPoint = CGPointMake(newLeftEdgeOffset, topOffset + roofHeight);
    CGPoint topPoint = CGPointMake(xCenter, topOffset);
    CGPoint endPoint = CGPointMake(rect.size.width - edgeOffset, topOffset + roofHeight);
    
    [aPath moveToPoint:startPoint];
    [aPath addLineToPoint:topPoint];
    [aPath addLineToPoint:endPoint];
    
    [aPath closePath];
    [aPath stroke];
}

// 2
- (void)drawWallsInRect:(CGRect)rect  {

    CGFloat topOffset = 200;
    CGFloat roofHeight = 150;
    CGFloat edgeOffset = 20;
    CGFloat newLeftEdgeOffset = edgeOffset + rect.size.width/3;
    
    CGRect wallsRect = CGRectMake(newLeftEdgeOffset,
                                  topOffset + roofHeight + 5.0,
                                  2*rect.size.width/3 - 2*edgeOffset,
                                  rect.size.height - roofHeight- topOffset - edgeOffset);
    
    UIBezierPath *aPath = [UIBezierPath bezierPathWithRect:wallsRect];
    aPath.lineWidth = 5.0;
    [[UIColor blackColor] setStroke];
    
    [aPath stroke];
    
}

// 3
- (void)drawTubeInRect:(CGRect)rect {
    
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    [[UIColor blackColor] setStroke];
    
    CGFloat topOffset = 220;
    CGFloat tubeHeight = 25;
    CGFloat tubeWidth = 15;
    CGFloat edgeOffset = 40;
    CGFloat newLeftEdgeOffset = edgeOffset + rect.size.width/3;
    
    CGPoint startPoint = CGPointMake(newLeftEdgeOffset, topOffset + tubeHeight + 70);
    CGPoint topPointOne = CGPointMake(newLeftEdgeOffset, topOffset);
    CGPoint topPointTwo = CGPointMake(newLeftEdgeOffset + tubeWidth, topOffset);
    CGPoint endPoint = CGPointMake(newLeftEdgeOffset + tubeWidth, topOffset + 3*tubeHeight);
    
    [aPath moveToPoint:startPoint];
    [aPath addLineToPoint:topPointOne];
    [aPath addLineToPoint:topPointTwo];
    [aPath addLineToPoint:endPoint];
    
    [aPath closePath];
    [aPath stroke];
    
}

// 4
- (void)drawOvalWindowInRect:(CGRect)rect {
    
    CGFloat topOffset = 200;
    CGFloat roofHeight = 150;
    CGFloat width = 70;
    CGFloat xCenter = 2*rect.size.width/3;
    
    CGFloat x = xCenter - width/2;
    CGFloat y = topOffset + 2*(roofHeight - width)/3;
    CGRect windowRect = CGRectMake(x, y, width, width);
    
    UIBezierPath *aPath = [UIBezierPath bezierPathWithOvalInRect:windowRect];
    aPath.lineWidth = 5.0;
    [[UIColor blackColor] setStroke];
    [aPath stroke];
    
    UIBezierPath *bPath = [UIBezierPath bezierPath];
    bPath.lineWidth = 5.0;
    [[UIColor blackColor] setStroke];
    
    CGPoint startPointVertical = CGPointMake(xCenter, topOffset + 2*(roofHeight - width)/3);
    CGPoint endPointVertical = CGPointMake(xCenter, topOffset + 2*roofHeight/3 + width/3);
    
    [bPath moveToPoint:startPointVertical];
    [bPath addLineToPoint:endPointVertical];
    
    [bPath stroke];
    
    UIBezierPath *cPath = [UIBezierPath bezierPath];
    cPath.lineWidth = 5.0;
    [[UIColor blackColor] setStroke];
    
    CGPoint startPointHorizontal = CGPointMake(xCenter - width/2, topOffset + 2*roofHeight/3 - width/6);
    CGPoint endPointHorizontal  = CGPointMake(xCenter + width/2, topOffset + 2*roofHeight/3 - width/6);
    
    [cPath moveToPoint:startPointHorizontal ];
    [cPath addLineToPoint:endPointHorizontal ];
    
    [cPath stroke];
    
    
}

// 5
- (void)drawWindowInRect:(CGRect)rect  {
    
    CGFloat topOffset = 200;
    CGFloat roofHeight = 150;
    CGFloat xCenter = 2*rect.size.width/3;
    CGFloat width = 80;
    
    CGRect windowRect = CGRectMake(xCenter - width/2, topOffset + roofHeight + 100, width, width);
    
    UIBezierPath *aPath = [UIBezierPath bezierPathWithRect:windowRect];
    aPath.lineWidth = 5.0;
    [[UIColor blackColor] setStroke];
    
    [aPath stroke];
    
    UIBezierPath *bPath = [UIBezierPath bezierPath];
    bPath.lineWidth = 5.0;
    [[UIColor blackColor] setStroke];
    
    CGPoint startPointVertical = CGPointMake(xCenter, topOffset + roofHeight + 100);
    CGPoint endPointVertical = CGPointMake(xCenter, topOffset + roofHeight + 100 + width);
    
    [bPath moveToPoint:startPointVertical];
    [bPath addLineToPoint:endPointVertical];
    
    [bPath stroke];
    
    UIBezierPath *cPath = [UIBezierPath bezierPath];
    cPath.lineWidth = 5.0;
    [[UIColor blackColor] setStroke];
    
    CGPoint startPointHorizontal = CGPointMake(xCenter - width/2, topOffset + roofHeight + 100 + width/2);
    CGPoint endPointHorizontal  = CGPointMake(xCenter + width/2, topOffset + roofHeight + 100 + width/2);
    
    [cPath moveToPoint:startPointHorizontal ];
    [cPath addLineToPoint:endPointHorizontal ];

    [cPath stroke];
    
}

- (void)drawFenceInRect:(CGRect)rect {
    
    CGFloat topOffset = 200;
    CGFloat roofHeight = 150;
    CGFloat width = 40;
    CGFloat newLeftEdgeOffset = 20 + rect.size.width/3;
    
    UIBezierPath *bPath = [UIBezierPath bezierPath];
    bPath.lineWidth = 5.0;
    [[UIColor blackColor] setStroke];
    
    CGPoint firstPoint = CGPointMake(newLeftEdgeOffset, topOffset + roofHeight + 100 + width/2);
    CGPoint secondPoint = CGPointMake(newLeftEdgeOffset - 0.5*width, topOffset + roofHeight + 100 + width);
    CGPoint thirdPoint = CGPointMake(newLeftEdgeOffset - width, topOffset + roofHeight + 100 + width/2);
    CGPoint forthPoint = CGPointMake(newLeftEdgeOffset - 1.5*width, topOffset + roofHeight + 100 + width);
    CGPoint fifthPoint = CGPointMake(newLeftEdgeOffset - 2*width, topOffset + roofHeight + 100 + width/2);
    CGPoint sixthPoint = CGPointMake(newLeftEdgeOffset - 2.5*width, topOffset + roofHeight + 100 + width);
    CGPoint seventhPoint = CGPointMake(newLeftEdgeOffset - 2.5*width, rect.size.height - 15);
    CGPoint eigthPoint = CGPointMake(newLeftEdgeOffset, rect.size.height - 15);
    
    [bPath moveToPoint:firstPoint];
    [bPath addLineToPoint:secondPoint];
    [bPath addLineToPoint:thirdPoint];
    [bPath addLineToPoint:forthPoint];
    [bPath addLineToPoint:fifthPoint];
    [bPath addLineToPoint:sixthPoint];
    [bPath addLineToPoint:seventhPoint];
    [bPath addLineToPoint:eigthPoint];

    [bPath stroke];
    
}

- (void)drawBirdsInRect:(CGRect)rect {
    
    for (int i = 0; i < 3; i++) {
        
        CGFloat leftWing = 50;
        
        UIBezierPath *bPath = [UIBezierPath bezierPath];
        bPath.lineWidth = 5.0;
        [[UIColor blackColor] setStroke];
        
        CGPoint firstPoint = CGPointMake(leftWing + 70 * i - 20, 200 - 70 * i);
        CGPoint secondPoint = CGPointMake(leftWing + 70 * i, 200 - 70 * i + 45);
        CGPoint thirdPoint = CGPointMake(leftWing + 70 * i + 20, 200 - 70 * i);
        
        [bPath moveToPoint:firstPoint];
        [bPath addLineToPoint:secondPoint];
        [bPath addLineToPoint:thirdPoint];
        
        [bPath stroke];
    }
    
}

#pragma mark - bezier path

- (void)drawPictureInRect:(CGRect)rect {
    
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    [[UIColor blueColor] setStroke];
    
    CGPoint startPoint = CGPointMake(10, 100);
    CGPoint endPoint = CGPointMake(100,10);
    [aPath moveToPoint:startPoint];
    [aPath addLineToPoint:endPoint];
    
//    [[UIColor whiteColor] setFill];
//    [aPath fill];
    [aPath stroke];
    
}



@end
