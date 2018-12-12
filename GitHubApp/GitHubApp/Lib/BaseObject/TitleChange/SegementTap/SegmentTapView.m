//
//  SegmentTapView.m
//  SegmentTapView

#import "SegmentTapView.h"
@interface SegmentTapView ()
@property (nonatomic, strong)NSMutableArray *buttonsArray;
@property (nonatomic, strong)UIImageView *lineImageView;
@property (nonatomic, assign)NSInteger selectFont;
@property (nonatomic, assign)NSInteger defaultFont;
@property (nonatomic, assign)CGSize lineSize;
@property (nonatomic, assign)BOOL isBorder;

@end
@implementation SegmentTapView

-(instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray *)dataArray withFont:(CGFloat)font withSelectFont:(CGFloat)selectFont lineSize:(CGSize)lineSize isBorder:(BOOL)isBorder{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        _buttonsArray = [[NSMutableArray alloc] init];
        _dataArray = dataArray;
        _titleFont = font;
        _selectFont = selectFont;
        _defaultFont = font;
        self.lineSize = lineSize;
        self.isBorder = isBorder;
        //默认
        self.textNomalColor    = [UIColor blackColor];
        self.textSelectedColor = [UIColor blackColor];
        self.lineColor = [UIColor redColor];
        
        [self addSubSegmentView];
    }
    return self;
}

-(void)addSubSegmentView
{
    float width = self.frame.size.width / _dataArray.count;
    
    for (int i = 0 ; i < _dataArray.count ; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * width, 0, width, self.frame.size.height)];
        button.tag = i+1;
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:[_dataArray objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:self.textNomalColor    forState:UIControlStateNormal];
        [button setTitleColor:self.textSelectedColor forState:UIControlStateSelected];
        if (i == 0) {
            button.titleLabel.font = [UIFont systemFontOfSize:_selectFont];
        }else{
            button.titleLabel.font = [UIFont systemFontOfSize:_defaultFont];
        }
        
        [button addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
        //默认第一个选中
        if (i == 0) {
            button.selected = YES;
        }
        else{
            button.selected = NO;
        }
        
        [self.buttonsArray addObject:button];
        [self addSubview:button];
        
//        if (i != _dataArray.count || i != 0) {
//            UILabel *line = [[UILabel alloc ] initWithFrame:CGRectMake(i * width , 0, 0.45, 40)];
//            line.backgroundColor = [UIColor whiteColor];
//            [self bringSubviewToFront:line];
//            [self addSubview:line];
//        }
    }
    
    if (self.lineSize.width != 0) {
         self.lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake((width-self.lineSize.width)/2, self.frame.size.height-self.lineSize.height, self.lineSize.width, self.lineSize.height)];
    }else{
        self.lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-1, width, 1)];
    }
    if (self.isBorder) {
//        self.lineImageView.layer.cornerRadius = 3;
        self.lineImageView.layer.cornerRadius = self.lineImageView.height/2+1;
        self.lineImageView.layer.masksToBounds = YES;
        
    }
    
//    self.lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-1, width, 1)];
    self.lineImageView.backgroundColor = _lineColor;
    [self addSubview:self.lineImageView];
}

- (void)changeImageFrame:(CGRect)sender{
    if (self.lineSize.width != 0) {
        self.lineImageView.frame = CGRectMake(sender.origin.x+(sender.size.width-self.lineImageView.frame.size.width)/2, self.frame.size.height-self.lineSize.height, self.lineImageView.frame.size.width, self.lineImageView.frame.size.height);
    }else{
        self.lineImageView.frame = CGRectMake(sender.origin.x, self.frame.size.height-1, sender.size.width, 1);
    }
}

-(void)tapAction:(id)sender{
    UIButton *button = (UIButton *)sender;
    [UIView animateWithDuration:0.2 animations:^{
        [self changeImageFrame:button.frame];
    }];
    for (UIButton *subButton in self.buttonsArray) {
        if (button == subButton) {
            subButton.selected = YES;
            subButton.titleLabel.font = [UIFont systemFontOfSize:self.selectFont];
        }
        else{
            subButton.selected = NO;
            subButton.titleLabel.font = [UIFont systemFontOfSize:self.defaultFont];

        }
    }
    if ([self.delegate respondsToSelector:@selector(selectedIndex:)]) {
        [self.delegate selectedIndex:button.tag -1];
    }
}
-(void)selectIndex:(NSInteger)index
{
    for (UIButton *subButton in self.buttonsArray) {
        if (index != subButton.tag) {
            subButton.selected = NO;
            subButton.titleLabel.font = [UIFont systemFontOfSize:self.defaultFont];

        }
        else{
            subButton.selected = YES;
            [UIView animateWithDuration:0.2 animations:^{
                [self changeImageFrame:subButton.frame];
                subButton.titleLabel.font = [UIFont systemFontOfSize:self.selectFont];

            }];
        }
    }
}
#pragma mark -- set
-(void)setLineColor:(UIColor *)lineColor{
    if (_lineColor != lineColor) {
        self.lineImageView.backgroundColor = lineColor;
        _lineColor = lineColor;
    }
}
-(void)setTextNomalColor:(UIColor *)textNomalColor{
    if (_textNomalColor != textNomalColor) {
        for (UIButton *subButton in self.buttonsArray){
            [subButton setTitleColor:textNomalColor forState:UIControlStateNormal];
        }
        _textNomalColor = textNomalColor;
    }
}
-(void)setTextSelectedColor:(UIColor *)textSelectedColor{
    if (_textSelectedColor != textSelectedColor) {
        for (UIButton *subButton in self.buttonsArray){
            [subButton setTitleColor:textSelectedColor forState:UIControlStateSelected];
        }
        _textSelectedColor = textSelectedColor;
    }
}
-(void)setTitleFont:(CGFloat)titleFont{
    if (_titleFont != titleFont) {
        for (UIButton *subButton in self.buttonsArray){
            subButton.titleLabel.font = [UIFont systemFontOfSize:titleFont] ;
        }
        _titleFont = titleFont;
    }
}
@end
