import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["checkbox", "submitButton", "name", "result"]
  static values = {
    selectedProducts: Array
  }

  connect() {
    console.log("DEBUG: ProductController connected")
    this.selectedProductsValue = []
  }
  greet() {
    const element = this.nameTarget
    const name = element.value
    console.log(`Helloooo, ${name}!`)
    this.resultTarget.innerHTML = `
    <p>Vous utilisez  pour marquer : ${name}!</p>
    <p>ça sert a rien mais c'est une bonne base :)</p>
    <p>Retrouvez moi dans hello_controlleur</p>
`
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
