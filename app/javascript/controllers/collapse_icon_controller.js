import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["body", "openIcon", "closeIcon"]

    connect() {
        this.syncIcons()
    }

    toggle() {
        this.bodyTarget.classList.toggle("d-none")
        this.syncIcons()
    }

    syncIcons() {
        const isHidden = this.bodyTarget.classList.contains("d-none")

        this.openIconTarget.classList.toggle("d-none", isHidden)
        this.closeIconTarget.classList.toggle("d-none", !isHidden)
    }
}