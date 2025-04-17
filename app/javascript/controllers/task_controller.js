import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="task"
export default class extends Controller {
  // targets form + due date??
  static targets = [ "dueDate", "form", "currentDueDate"]
  connect() {
    console.log("hee")
  }

  new(e) {
    console.log("hoo")

    e.preventDefault()
    const date = e.currentTarget.dataset.taskDate

    const dialog = document.getElementById("new-task-dialog");
    dialog.showModal()

    const currentDate = new Date(date)
    const currentDateFormatted = currentDate.toISOString().slice(0, 16)
    this.currentDueDateTarget.value = currentDateFormatted
  }
}
