export default class Task {
  taskId: number = 0
  taskName: string = '任务'
  taskFinished: boolean = false

  constructor(taskId: number) {
    this.taskId = taskId
    this.taskName = "任务" + this.taskId.toString()
  }
}

