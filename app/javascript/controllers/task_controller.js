import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="task"
export default class extends Controller {
  static targets = [ "dueDate", "currentDueDate"]

  new(e) {
    if (e.target.closest("form") || e.target.tagName === "INPUT") {
      return
    }

    e.preventDefault()

    const date = e.currentTarget.dataset.taskDate

    const dialog = document.getElementById("new-task-dialog");
    dialog.showModal()

    const currentDate = new Date(date)
    const currentDateFormatted = currentDate.toISOString().slice(0, 16)
    this.currentDueDateTarget.value = currentDateFormatted
  }

  close(e) {
    e.preventDefault()

    const dialog = document.getElementById("new-task-dialog");
    dialog.close()
  }
}
