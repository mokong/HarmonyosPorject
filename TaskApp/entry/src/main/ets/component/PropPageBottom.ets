import Task from '../model/Task'

@Component
export default struct PropPageBottom {
  @Link tasks: [Task]
  @Link count: number

  update: () => void

  @Styles card() {
    .backgroundColor(Color.White)
    .width('100%')
    .border({ width: 1, color: Color.White, radius: 10, style: BorderStyle.Solid })
  }

  @Builder deleteBtn(index: number) {
    Button() {
      Image($r('app.media.app_icon'))
        .fillColor(Color.White)
        .width(20)
    }
    .onClick(() => {
      this.tasks.splice(index, 1)
      this.update()
    })
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor(Color.Red)
    .margin(5)
  }

  build() {
    Column() {
      // 新增任务按钮
      Button('新增任务')
        .backgroundColor('#36D')
        .onClick(() => {
          this.tasks.push(new Task(this.count))
          this.count++
          this.update()
        })
        .width('80%')
        .height(56)
        .margin({ bottom: 10 })

      // 任务列表
      List({ space: 20 }) {
        ForEach(this.tasks, (item: Task, index) => {
          ListItem() {
            Row() {
              Text(item.taskName)

              Checkbox()
                .select(item.taskFinished)
                .onChange((val) => {
                  item.taskFinished = val
                  this.update()
                })
            }
            .card()
            .justifyContent(FlexAlign.SpaceBetween)
            .padding({ top: 10, left: 20, bottom: 10, right: 20 })
            .width('90%')
          }
          .swipeAction({ end: this.deleteBtn(index) })
        })
      }
      .width('100%')
      .height('100%')
      .alignListItem(ListItemAlign.Center)
    }
  }
}