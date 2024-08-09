

@Entry
@Component
struct Home {
  build() {
    Column(){
      Text('home页面').margin({top:20})
      Row(){
        Row().width(50).height(50).backgroundColor(Color.Green).offset({top:10,left:30})
        Row().width(50).height(50).backgroundColor(Color.Brown).position({bottom:10,left:5})
        Row().width(50).height(50).backgroundColor(Color.Pink)
      }.size({width:'100%',height:200}).border({width:1,color:'#999'}).alignItems(VerticalAlign.Top)
    }.size({width:'100%'}).padding(14)
  }
}
