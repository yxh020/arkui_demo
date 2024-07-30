@Entry
@Component
struct Index {
  dialogController: CustomDialogController = new CustomDialogController({
    builder: DiyCustomDialog(),
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 },
    cornerRadius: 15,
  })

  build() {
    Column({ space: 10 }) {
      Row({ space: 10 }) {
        Radio({ value: 'radio1', group: 'radioGroup' })
          .checked(false)
        Radio({ value: 'radio2', group: 'radioGroup' })
          .checked(false)
          .onChange((e) => {
            console.log('change----> ', e)
          })
      }.width('100%')

      Toggle({ type: ToggleType.Switch, isOn: true })
      Toggle({ type: ToggleType.Checkbox, isOn: true })

      Progress({ value: 24, total: 100, type: ProgressType.Capsule })

      Text('text组件') {
        Span('span1 ')
        Span('span2').textCase(TextCase.UpperCase)
      }.borderWidth(1).padding(10)

      Text('我是超长文本，超出的部分显示省略号。I am an extra long text, with ellipses displayed for any excess。')
        .width(250)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(2)
        .lineHeight(20)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
      Text('当文本溢出其尺寸时，文本将滚动显示。When the text overflows its dimensions, the text will scroll for displaying.')
        .width(250)
        .textOverflow({ overflow: TextOverflow.MARQUEE })
        .maxLines(1)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
      TextInput({ text: '', placeholder: '请输入~' })
        .type(InputType.Password)
      Image('https://placebear.com/400/400')
        .width(200)
        .height(200)
        .border({ width: 1 })
        .objectFit(ImageFit.Contain)
      Button('打开弹窗')
        .onClick(()=>{
          this.dialogController.open()
        })
    }
  }
}

@CustomDialog
struct DiyCustomDialog {
  controller: CustomDialogController = new CustomDialogController({
    builder: DiyCustomDialog()
  })

  build() {
    Column() {
      Text('我是内容').fontSize(20).margin({ top: 10, bottom: 10 })
    }
  }
}
