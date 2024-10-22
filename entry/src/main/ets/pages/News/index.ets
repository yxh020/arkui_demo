import newsItem from './components/newsItem'
import { hilog } from '@kit.PerformanceAnalysisKit'

@Entry
@Component
struct News {
  @State currentIndex: number = 0
  @State isRefreshing: boolean = false

  @Builder tabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? '#333' : '#999')
        .fontSize(this.currentIndex === index ? 22 : 18)
        .fontWeight(this.currentIndex === index ? 600 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 })
        .animation({
          duration: 200,
          curve: Curve.Linear,
        })
      Divider()
        .width(20)
        .strokeWidth(4)
        .lineCap(LineCapStyle.Round)
        .color('#064696')
        .opacity(this.currentIndex === index ? 1 : 0)
    }.margin({left:10,right:10})
  }

  build() {
    Column() {
      Tabs({ index: this.currentIndex }) {
        TabContent() {
          Refresh({
            refreshing:this.isRefreshing,
          }){
            List() {
              ForEach([1,2,3,4,5,6,7,8], (item: Number) => {
                ListItem() {
                  newsItem()
                }
              })
            }.width('100%').height('100%')
          }.onRefreshing(() => {
            this.isRefreshing = true
            hilog.info(0x0000, 'testTag', '%{public}s', this.isRefreshing);

            setTimeout(()=>{
              this.isRefreshing = false
              hilog.info(0x0000, 'testTag', '%{public}s', this.isRefreshing);

            },2000)
          })
        }.tabBar(this.tabBuilder(0, '最新鲜'))
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF')
        }.tabBar(this.tabBuilder(1, '精选'))
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00')
        }.tabBar(this.tabBuilder(2, '视频'))
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#E67C92')
        }.tabBar(this.tabBuilder(3, '行情'))
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }.tabBar(this.tabBuilder(4, '百强榜'))
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF')
        }.tabBar(this.tabBuilder(5, '研究院'))
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00')
        }.tabBar(this.tabBuilder(6, '人物'))
      }
      .vertical(false)
      .barMode(BarMode.Scrollable,{margin:10,nonScrollableLayoutStyle:LayoutStyle.ALWAYS_CENTER})
      .barWidth('100%')
      .animationDuration(300)
      .animationMode(AnimationMode.CONTENT_FIRST)
      .width('100%')
      .height('100%')
      .backgroundColor('#fff')
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }.width('100%')
  }
}