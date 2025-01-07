// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
console.log("DEBUG: Starting application.js load");

import "@hotwired/turbo-rails"
console.log("DEBUG: Turbo Rails loaded");

import "./controllers"
console.log("DEBUG: Controllers loaded");

// Import all Bootstrap
import * as bootstrap from "bootstrap"
console.log("DEBUG: Bootstrap loaded:", Object.keys(bootstrap));

// Make Bootstrap available globally
window.bootstrap = bootstrap
console.log("DEBUG: Bootstrap made global");

// Initialize Bootstrap components on page load
document.addEventListener("turbo:load", () => {
    console.log("DEBUG: turbo:load event fired");
    
    // Enable all tooltips
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
    
    // Enable all popovers
    const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
    const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
    
    console.log("DEBUG: Bootstrap components initialized");
})

console.log("DEBUG: Application.js loaded successfully");
