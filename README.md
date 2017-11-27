# SwiftEmojiDemo
# 11月27日练习
* 使用pickerView模拟“老虎机”，模仿大佬的文章：[自学 iOS - 三十天三十个 Swift 项目](https://weibo.com/ttarticle/p/show?id=2309403942494873235448)中的第14项。
* 使用 arc4random() 方法生成随机数，在代理方法viewForRow中返回一个UILabel，以随机数作为下标选择emojiArray中的Emoji表情并分别赋值给给每一行的label.text：
```
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 70)
        pickerLabel.textAlignment = .center
        switch component {
        case 0:
            pickerLabel.text = emojiArray[Int(arrayOne[row])]
        case 1:
            pickerLabel.text = emojiArray[Int(arrayTwo[row])]
        case 2:
            pickerLabel.text = emojiArray[Int(arrayThree[row])]
        default:
            break
        }
        return pickerLabel
    }
```
