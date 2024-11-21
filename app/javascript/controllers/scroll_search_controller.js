import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["target"]

  scrollToTarget(event) {
    this.targetTarget.scrollIntoView({ behavior: "smooth", block: "start" });
  }
}
