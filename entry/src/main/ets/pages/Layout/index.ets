import { mediaquery, window } from '@kit.ArkUI'
import { common } from '@kit.AbilityKit'
import { util } from '@kit.ArkTS'

let AlignRue1: Record<string, Record<string, string | VerticalAlign | HorizontalAlign>> = {
  'top': { 'anchor': '__container__', 'align': VerticalAlign.Top },
  'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start }
}
let AlignRue2: Record<string, Record<string, string | VerticalAlign | HorizontalAlign>> = {
  'top': { 'anchor': 'row1', 'align': VerticalAlign.Bottom },
  'left': { 'anchor': 'row1', 'align': HorizontalAlign.End }
}
let Mleft: Record<string, number> = { 'left': 10 }
let BWC: Record<string, number | string> = { 'width': 2, 'color': '#6699FF' }

class Contact {
  key: string = util.generateRandomUUID(true);
  name: string;
  icon: Resource;

  constructor(name: string, icon: Resource) {
    this.name = name;
    this.icon = icon;
  }
}

@Entry
@Component
struct Layout {
  @State color: string = '#DB7093';
  @State text: string = 'Portrait';
  @State isListReachEnd: boolean = false;
  @State contacts: Array<Contact> = [
    new Contact('小红', $r("app.media.iconA")),
    new Contact('小明', $r("app.media.iconB")),
    new Contact('小王', $r("app.media.iconC")),
    new Contact('小红', $r("app.media.iconA")),
    new Contact('小明', $r("app.media.iconB")),
    new Contact('小王', $r("app.media.iconC")),
    new Contact('小红', $r("app.media.iconA")),
    new Contact('小明', $r("app.media.iconB")),
    new Contact('小王', $r("app.media.iconC")),
    new Contact('小红', $r("app.media.iconA")),
    new Contact('小明', $r("app.media.iconB")),
    new Contact('小王', $r("app.media.iconC")),
  ]

  loadMore() {
    this.contacts.push(new Contact(`新人_${this.contacts.length}`, $r("app.media.iconA")))
  }

  listener: mediaquery.MediaQueryListener = mediaquery.matchMediaSync('(orientation: landscape)')

  aboutToAppear() {
    // 绑定当前应用实例
    // 绑定回调函数
    this.listener.on('change', (res: mediaquery.MediaQueryResult) => {
      if (res.matches as boolean) {
        console.log('------1')
        this.color = '#FFD700';
        this.text = 'Landscape';
      } else {
        console.log('------2')
        this.color = '#DB7093';
        this.text = 'Portrait';
      }
    })
  }

  // 改变设备横竖屏状态函数
  private changeOrientation(isLandscape: boolean) {
    // 获取UIAbility实例的上下文信息
    let context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
    // 调用该接口手动改变设备横竖屏状态
    window.getLastWindow(context).then((lastWindow) => {
      lastWindow.setPreferredOrientation(isLandscape ? window.Orientation.LANDSCAPE : window.Orientation.PORTRAIT)
    });
  }

  build() {
    Scroll() {
      Column() {
        Text('列表（list）').margin({ top: 20 })
        List() {
          ForEach(this.contacts, (item: Contact) => {
            ListItem() {
              Row() {
                Image(item.icon).width(40).height(40).margin(10)
                Text(item.name).fontSize(20)
              }.width('100%').justifyContent(FlexAlign.Start)
            }
          }, (item: Contact) => item.key)
        }
        .width('100%')
        .height(250)
        .listDirection(Axis.Vertical)
        .onReachEnd(() => {
          console.log('----滑动到底了')
          this.isListReachEnd = true;
        })
        .parallelGesture(
          PanGesture({ distance: PanDirection.Up, direction: 80 })
            .onActionStart(() => {
              if (this.isListReachEnd) {
                this.loadMore();
                this.isListReachEnd = false;
              }
            })
        )

        // 媒体查询
        Text('媒体查询').margin({ top: 20 })
        Text(this.text).fontSize(50).fontColor(this.color)
        Text('Landscape').fontSize(50).fontColor(this.color).backgroundColor(Color.Orange)
          .onClick(() => {
            this.changeOrientation(true);
          })
        Text('Portrait').fontSize(50).fontColor(this.color).backgroundColor(Color.Orange)
          .onClick(() => {
            this.changeOrientation(false);
          })
        // Text('栅格布局（RelativeContainer）').margin({ top: 20 })
        Text('相对布局（RelativeContainer）').margin({ top: 20 })
        RelativeContainer() {
          Row() {
            Text('row1')
          }
          .width(100)
          .height(100)
          .backgroundColor(Color.Pink)
          .id('row1')
          .alignRules(AlignRue1)
          .offset({
            x: 50,
            y: 20
          })

          Row() {
            Text('row2')
          }
          .width(100)
          .height(100)
          .backgroundColor("#FFCC00")
          .alignRules(AlignRue2)
          .id("row2")
        }.width(300).height(300).margin(Mleft).border(BWC)

        Text('线性布局（Row）').margin({ top: 20 })
        Row({ space: 10 }) {
          Row().width(40).height(20).backgroundColor(0xF5DEB3)
          Row().width(30).height(20).backgroundColor(0xF5DEB3)
          Row().width(40).height(40).backgroundColor(0xF5DEB3)
        }
        .width('80%')
        .border({ width: 1, color: '#000' })
        .alignItems(VerticalAlign.Bottom)
        .justifyContent(FlexAlign.SpaceBetween)

        Text('线性布局（Column）').margin({ top: 20 })
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
        Text('层叠布局（Stack）').margin({ top: 20 })
        Stack({ alignContent: Alignment.Top }) {
          Column().width('90%').height('100%').backgroundColor('#ff58b87c').align(Alignment.BottomStart)
          Text('text').width('60%').height('60%').backgroundColor('#ffc3f6aa').zIndex(2)
          Button('button2').width('30%').height('30%').backgroundColor('#ff8ff3eb')
        }.width('100%').height(150)

        Text('弹性布局（Flex）').margin({ top: 20 })
        Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceBetween }) {
          Text('1').width('30%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('30%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('30%').height(50).backgroundColor(0xF5DEB3)
          Text('4').width('30%').height(50).backgroundColor(0xF5EB3)
        }
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

      }.width('100%')
    }
  }
}