import { Controller } from "@hotwired/stimulus";
import { animate } from "popmotion";

export default class extends Controller {
  static targets = ["text"];

  connect() {
    this.phrases = [
      "d'aller en partiel",
      "d'aider Alex à déménager",
      "d'aller au spectacle de danse de votre nièce",
      "de vous rendre à l'accouchement de votre femme",
      "de vous rendre au 96ᵉ anniversaire de votre grande-tante"
    ]; // List of phrases
    this.currentPhraseIndex = 0; // Start with the first phrase

    this.loopAnimation(); // Start the animation loop
  }

  loopAnimation() {
    const duration = 1000; // Animation duration

    const animateText = () => {
      // Hide the current text by sliding up
      animate({
        from: { opacity: 1, y: 0 },
        to: { opacity: 0, y: -50 },
        duration: duration / 2, // Half the duration for sliding out
        onUpdate: (latest) => {
          this.textTarget.style.opacity = latest.opacity;
          this.textTarget.style.transform = `translateY(${latest.y}px)`;
        },
        onComplete: () => {
          this.moveToNextPhrase(); // Change to the next phrase
          this.updateText(this.phrases[this.currentPhraseIndex]);

          // Show the next text by sliding in from the bottom
          animate({
            from: { opacity: 0, y: 50 },
            to: { opacity: 1, y: 0 },
            duration: duration / 2, // Half the duration for sliding in
            onUpdate: (latest) => {
              this.textTarget.style.opacity = latest.opacity;
              this.textTarget.style.transform = `translateY(${latest.y}px)`;
            },
            onComplete: () => {
              setTimeout(() => {
                animateText(); // Continue the animation loop
              }, 2000); // Delay before switching to the next phrase
            }
          });
        }
      });
    };

    animateText(); // Start the first animation
  }

  updateText(phrase) {
    this.textTarget.textContent = phrase; // Update the text content
  }

  moveToNextPhrase() {
    this.currentPhraseIndex =
      (this.currentPhraseIndex + 1) % this.phrases.length; // Cycle through phrases
  }
}
