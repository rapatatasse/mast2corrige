import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["checkbox", "submitButton"]
  static values = {
    selectedProducts: Array
  }

  connect() {
    console.log("DEBUG: ProductController connected")
    this.selectedProductsValue = []
  }


  toggleProduct(event) {
    const checkbox = event.target
    const productId = checkbox.dataset.productId
    console.log("Toggle product:", productId)

    if (checkbox.checked) {
      console.log("Adding product:", productId)
      this.selectedProductsValue = [...this.selectedProductsValue, productId]
    } else {
      console.log("Removing product:", productId)
      this.selectedProductsValue = this.selectedProductsValue.filter(id => id !== productId)
    }

    this.updateSubmitButton()
    console.log("Current selection:", this.selectedProductsValue)
  }

  updateSubmitButton() {
    this.submitButtonTarget.value = JSON.stringify(this.selectedProductsValue)
  }
}
