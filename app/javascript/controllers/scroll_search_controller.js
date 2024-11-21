import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["target"]

  scrollToTarget(event) {
    event.preventDefault();
    console.log("Scrolling to target:", this.targetTarget);
    this.targetTarget.scrollIntoView({ behavior: "smooth", block: "start" });
  }
}
