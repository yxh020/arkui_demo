import { router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 10 }) {
      Button('返回', { type: ButtonType.Circle, stateEffect: true })
        .width('100')
        .onClick(()=>{
          router.back()
        })
      Button({ type: ButtonType.Normal }) {
        Row() {
          Text('底部').fontSize(18).fontColor(Color.Pink)
          Text('对齐').fontSize(12)
        }
        .alignItems(VerticalAlign.Bottom)
      }.width('100')

      Button('换肤')
        .fontColor(Color.Red)
        .position({ x: '20%', y: 300 })
        .onClick(() => {
          console.log('点击了删除')
          router.pushUrl({
            url: 'pages/Theme/index'
          })
        })
    }.width('100%')
  }
}