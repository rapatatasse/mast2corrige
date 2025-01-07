// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"

import HelloController from "./hello_controller"
import ProductController from "./product_controller"

application.register("hello", HelloController)
application.register("product", ProductController)

console.log("DEBUG: Controllers registered:", {
    hello: HelloController,
    product: ProductController
})
