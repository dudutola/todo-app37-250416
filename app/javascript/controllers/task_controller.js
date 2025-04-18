import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="task"
export default class extends Controller {
  static targets = [ "dueDate", "currentDueDate"]

  new(e) {
    if (e.target.closest("form") || e.target.tagName === "INPUT") return;

    e.preventDefault();

    const date = e.currentTarget.dataset.taskDate

    const dialog = document.getElementById("new-task-dialog");
    dialog.showModal();

    const currentDate = new Date(date);
    const now = new Date();
    currentDate.setHours(now.getHours(), now.getMinutes())

    const year = currentDate.getFullYear();
    const month = String(currentDate.getMonth() + 1).padStart(2, "0");
    const day = String(currentDate.getDate()).padStart(2, "0");
    const hours = String(currentDate.getHours()).padStart(2, "0");
    const minutes = String(currentDate.getMinutes()).padStart(2, "0");

    const currentDateFormatted = `${year}-${month}-${day}T${hours}:${minutes}`;
    // const currentDateFormatted = currentDate.toISOString().slice(0, 16);
    this.currentDueDateTarget.value = currentDateFormatted;
  }

  close(e) {
    e.preventDefault()

    const dialog = document.getElementById("new-task-dialog");
    dialog.close()
  }
}
