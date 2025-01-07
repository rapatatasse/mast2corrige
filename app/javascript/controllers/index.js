// Import and register all your controllers from the importmap under controllers/**/*_controller
console.log("DEBUG: Loading controllers/index.js");
import { application } from "./application"
import HelloController from "./hello_controller"
console.log("DEBUG: Registering HelloController");
application.register("hello", HelloController)
import ProductController from "./product_controller"
console.log("DEBUG: Registering ProductController");
application.register("product", ProductController)
