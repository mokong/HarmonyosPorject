import Task from '../model/Task';
import PropPageTop from '../component/PropPageTop';
import PropPageBottom from '../component/PropPageBottom';

@Entry
@Component
struct PropPage {
  @State totalTask: number = 0
  @State finishedTask: number = 0
  @State tasks: Task[] = []
  @State count: number = 0

  updateTaskDisplay() {
    this.finishedTask = this.tasks.filter(item => item.taskFinished).length
    this.totalTask = this.tasks.length
  }


  build() {
    Column() {
      PropPageTop({ totalTask: this.totalTask, finishedTask: this.finishedTask })
        .margin({ top: 20, bottom: 10 })
        .backgroundColor(Color.White)
        .width('90%')
        .border({ width: 1, color: Color.White, radius: 10, style: BorderStyle.Solid })


      PropPageBottom({ tasks: $tasks, count: $count, update: () => {
        this.updateTaskDisplay()
      }})

    }
    .justifyContent(FlexAlign.SpaceAround)
    .backgroundColor('#F1F1F1')

  }
}