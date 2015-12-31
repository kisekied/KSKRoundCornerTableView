# KKRoundCornerTableView

## 实现TableViewCell每个section的圆角

![效果预览](https://github.com/kisekied/KKRoundCornerTableView/blob/master/ScreenShot.png?raw=true)

## 使用
1. 在需要使用的地方导入头文件 `#import "KKRoundCornerCell.h"`
2. 在代理中设置圆角尺寸并判断cell样式

``` objc
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellID = @"CELLID";
    KKRoundCornerCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    if (!cell) {
        cell = [[KKRoundCornerCell alloc] initWithCornerRadius:10.0f Style:UITableViewCellStyleDefault reuseIdentifier:kCellID];
    }
    
    if ([tableView numberOfRowsInSection:indexPath.section] == 1) {
        cell.roundCornerType = KKRoundCornerCellTypeSingleRow;
    } else if (indexPath.row == 0) {
        cell.roundCornerType = KKRoundCornerCellTypeTop;
    } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
        cell.roundCornerType = KKRoundCornerCellTypeBottom;
    } else {
        cell.roundCornerType = KKRoundCornerCellTypeDefault;
    }
    
//    cell.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 256.0
//                                     green:arc4random() % 256 / 256.0
//                                      blue:arc4random() % 256 / 256.0
//                                     alpha:1.0];
    cell.backgroundColor = [UIColor cyanColor];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld组第%ld行", indexPath.section + 1, indexPath.row + 1];
    
    if (indexPath.section == 3) {
        cell.textLabel.text = [_dataArr objectAtIndex:indexPath.row];
    }
    
    return cell;
}
```

#Change history
2015.12.30 修正了删除样式不正常显示的问题.

2015.12.31 重新修改代码