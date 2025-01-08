import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "name","result" ]
  connect() {
    console.log("DEBUG: HelloController connected")
  }


  greet() {
    const element = this.nameTarget
    const name = element.value
    console.log(`Helloooooo, ${name}!`)
    this.resultTarget.innerHTML = `
    <p>Vous utilisez  stimulus pour marquer : ${name}!</p>
    <p>ça sert a rien mais c'est une bonne base :)</p>
    <p>Retrouvez moi dans hello_controlleur</p>
`  
}
}
