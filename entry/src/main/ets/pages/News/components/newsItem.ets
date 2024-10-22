import { router } from '@kit.ArkUI';

@Entry
@Component
export default struct NewsItem {
  build() {
    Row() {
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween }) {
        Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceBetween }) {
          Text('水泥网周报：河北省水泥窑产量监测报告市场监测市场监测')
            .fontColor('#333')
            .fontSize(18)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .maxLines(2)
            .lineHeight(26)
          Flex({ }) {
            Text('水泥大数据')
              .fontColor('#666')
              .fontSize(14)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .maxLines(1)
            Text('24小时之前')
              .fontColor('#666')
              .fontSize(14)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .maxLines(1)
              .flexShrink(0)
              .margin({ left: 20 })
          }
        }.height('100%').flexGrow(1)

        // .backgroundColor(Color.Pink)

        RelativeContainer() {
          Image($r('app.media.testImg'))
            .width('100%')
            .height('100%')
            .objectFit(ImageFit.Cover)
          Text('精选·市场报告')
            .fontColor('#fff')
            .padding({
              top: 2,
              bottom: 2,
              left: 6,
              right: 6
            })
            .borderRadius(4)
            .fontSize(11)
            .alignRules({
              right: { anchor: '__container__', align: HorizontalAlign.End }
            })
            .offset({
              x: -4,
              y: 4
            })
            .linearGradient({
              angle: 90,
              direction: GradientDirection.Right,
              colors: [['#E1C086', 0], ['#C3904C', 100]]
            })
        }
        .width(220)
        .height('100%')
        .margin({ left: 20 })
        .borderRadius(4)
        .clip(true)
      }
      .width('100%')
      .height(110)
      .border({ width: { bottom: '1px' }, color: '#ffd4d0d0' })
      .padding({ bottom: 15, top: 18 })

    }.width('100%').padding({ left: 15, right: 15 })
    .onClick(() => {
      router.pushUrl({
        url: 'pages/NewsDetail/index'
      })
    })
  }
}