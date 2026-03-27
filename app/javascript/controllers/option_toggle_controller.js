import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["panel", "icon"]

    toggle() {
        this.panelTarget.classList.toggle("d-none")
        this.iconTarget.classList.toggle("rotate-180")
    }
}