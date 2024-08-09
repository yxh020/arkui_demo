import { hilog } from '@kit.PerformanceAnalysisKit';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct PopupExample {
  @State handlePopup: boolean = false

  build() {
    Column() {
      Button('PopupOptions')
        .onClick(() => {
          this.handlePopup = !this.handlePopup
        })
        .bindPopup(this.handlePopup, {
          message: 'This is a popup with PopupOptions',
          primaryButton: {
            value: 'Confirm',
            action: () => {
              this.handlePopup = !this.handlePopup
              hilog.debug(0x0001, "testTag", "%{public}s World %{private}d", "hello", 3);
            }
          },
          secondaryButton: {
            value: 'Cancel',
            action: () => {
              this.handlePopup = !this.handlePopup
            }
          },
        })
      Button('页面菜单')
        .bindMenu([
          {
            value: 'home',
            action: () => {
              router.pushUrl({
                url: 'pages/Home/index'
              })
            }
          },
          {
            value: 'button组件',
            action: () => {
              router.pushUrl({
                url: 'pages/Button/index'
              })
            }
          },
          {
            value: '其他组件',
            action: () => {
              router.pushUrl({
                url: 'pages/OtherComponents/index'
              })
            }
          },
          {
            value: '换肤',
            action: () => {
              router.pushUrl({
                url: 'pages/Theme/index'
              })
            }
          },
          {
            value: '布局',
            action: () => {
              router.pushUrl({
                url: 'pages/Layout/index'
              })
            }
          },
        ])
    }.width('100%').padding({ top: 5 })
  }
}