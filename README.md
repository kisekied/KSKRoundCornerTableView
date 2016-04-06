# KSKRoundCornerTableView

## 实现TableViewCell每个section的圆角

![效果预览](https://github.com/kisekied/KKRoundCornerTableView/blob/master/ScreenShot.png?raw=true)

## 使用
1. 在需要使用的地方导入头文件 `#import "KKRoundCornerCell.h"`
2. 使用 `+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style radius:(CGFloat)radius indexPath:(NSIndexPath *)indexPath strokeLineWidth:(CGFloat)lineWidth strokeColor:(UIColor *)strokeColor;` 一句话即可


``` objc
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KSKRoundCornerCell *cell = [KSKRoundCornerCell cellWithTableView:tableView style:UITableViewCellStyleDefault radius:10.0f indexPath:indexPath strokeLineWidth:2 strokeColor:nil];
    
    return cell;
}

```

#Change history
2016.4.6 增加边框功能

2016.2.4 再次重写代码，使用更加简单，一句话即可。

2015.12.31 重新修改代码,无需手动判断cell类型。

2015.12.30 修正了删除样式不正常显示的问题。
