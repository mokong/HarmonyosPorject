@Component
export default struct PropPageTop {

  @Prop finishedTask: number
  @Prop totalTask: number

  build() {
    // 进度展示
    Row() {
      Text("任务进度：")
        .fontSize(32)
        .fontWeight(FontWeight.Bold)

      Stack() {
        Progress({ value: this.finishedTask, total: this.totalTask, type: ProgressType.Ring })

        Row() {
          Text(this.finishedTask.toString())

          Text(' / ' + this.totalTask.toString() )
        }
      }
    }
    .padding({ top: 10, bottom: 10 })
    .justifyContent(FlexAlign.SpaceEvenly)
    .width('100%')
  }
}