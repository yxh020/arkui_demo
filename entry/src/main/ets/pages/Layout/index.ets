@Entry
@Component
struct Layout {
  build() {
    Column() {
      Text('Row布局').margin({ top: 20 })
      Row({ space: 10 }) {
        Row().width(40).height(20).backgroundColor(0xF5DEB3)
        Row().width(30).height(20).backgroundColor(0xF5DEB3)
        Row().width(40).height(40).backgroundColor(0xF5DEB3)
      }
      .width('80%')
      .border({ width: 1, color: '#000' })
      .alignItems(VerticalAlign.Bottom)
      .justifyContent(FlexAlign.SpaceBetween)

      Text('Column布局').margin({ top: 20 })
      Column({ space: 10 }) {
        Row().width('80%').height(20).backgroundColor(0xF5DEB3)
        Row().width('60%').height(20).backgroundColor(0xF5E4)
        Row().width('50%').height(30).backgroundColor(0xF5DEB)
        // 空白填充组件
        Blank()
      }
      .height(150)
      .border({ width: 1, color: '#000' })
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Center)

      // 层叠布局，子元素默认进行居中堆叠
      Text('Stack布局').margin({ top: 20 })
      Stack({ alignContent: Alignment.Top }) {
        Column().width('90%').height('100%').backgroundColor('#ff58b87c').align(Alignment.BottomStart)
        Text('text').width('60%').height('60%').backgroundColor('#ffc3f6aa').zIndex(2)
        Button('button2').width('30%').height('30%').backgroundColor('#ff8ff3eb')
      }.width('100%').height(150)

      Text('Flex布局').margin({ top: 20 })
      Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceBetween }) {
        Text('1').width('30%').height(50).backgroundColor(0xF5DEB3)
        Text('2').width('30%').height(50).backgroundColor(0xD2B48C)
        Text('3').width('30%').height(50).backgroundColor(0xF5DEB3)
        Text('4').width('30%').height(50).backgroundColor(0xF5EB3)
      }
      .width('90%')
      .padding(10)
      .backgroundColor(0xAFEEEE)

      Text('RelativeContainer布局').margin({ top: 20 })

    }.width('100%')
  }
}