import { common, ConfigurationConstant } from '@kit.AbilityKit'

@Entry
@Component
struct Themed {
  private context = getContext(this) as common.UIAbilityContext;
  @State title:string = '换肤文字'
  build() {
    Column() {
      Text(this.title)
        .fontColor($r('app.color.app_title_color'))
      Text('默认颜色会适应换肤')
      Button('默认模式')
        .onClick(() => {
          console.info('默认--->')
          // 发布订阅消息
          // this.context.eventHub.emit('diyEvent','msg--->')
          this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT)
        })
        .margin({top:20 })
      Button('黑暗模式')
        .onClick(() => {
          console.info('黑暗--->')
          this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_DARK)
        })
        .margin({top:20 })
    }.width('100%').alignItems(HorizontalAlign.Center).padding({top:50})
  }
}