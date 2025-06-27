import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["checkbox", "amount", "name", "link", "submit"]
  static values = { prices: Object }

  connect() {
    this.updateTotal()
    this.checkboxTargets.forEach(cb =>
      cb.addEventListener("change", () => {
        this.updateTotal()
        this.toggleSubmit()
      })
    )
    this.nameTarget.addEventListener("input", () => this.toggleSubmit())
    this.linkTarget.addEventListener("input", () => this.toggleSubmit())
    this.toggleSubmit()
  }

  updateTotal() {
    let total = 0
    this.checkboxTargets.forEach(cb => {
      const price = this.pricesValue[cb.value]
      if (cb.checked && price !== undefined && !isNaN(price)) {
        total += parseFloat(price)
      }
    })

    const formatted = `$${total.toFixed(2)}`
    this.amountTargets.forEach(el => {
      el.textContent = formatted
    })
  }

  toggleSubmit() {
    const isAnyChecked = this.checkboxTargets.some(cb => cb.checked)
    const nameFilled = this.nameTarget.value.trim() !== ""
    const linkFilled = this.linkTarget.value.trim().match(/^https?:\/\/.+/)

    this.submitTarget.disabled = !(isAnyChecked && nameFilled && linkFilled)
  }

  openModal() {
    const modalElement = document.getElementById("paymentModal")
    const modal = new bootstrap.Modal(modalElement)
    modal.show()
  }   
}
