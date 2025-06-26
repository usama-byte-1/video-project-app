import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["checkbox", "amount"]
  static values = { prices: Object }

  connect() {
    this.updateTotal()
    this.checkboxTargets.forEach(cb =>
      cb.addEventListener("change", () => this.updateTotal())
    )
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
}
