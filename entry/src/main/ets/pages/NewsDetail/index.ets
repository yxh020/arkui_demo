import { ComposeTitleBar } from '@kit.ArkUI'

@Entry
@Component
struct NewsDetail {

  build() {
    Column() {
      ComposeTitleBar({
        title:'水泥网周报：湖北省水泥窑产量',
      })
      Text('水泥网周报：湖北省水泥窑产量监测报告 (10.14-10.20)')
        .fontSize(22).fontWeight(600).fontColor('#333')
        .margin({top:0}).lineHeight(35)
      Row(){

      }
    }.padding({left:10,right:10})
  }
}
