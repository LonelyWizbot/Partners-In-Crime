import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="animate-text"
export default class extends Controller {
  connect() {
    var example = ["d'aller en partiel", "d'aider Alex à déménager", "vous rendre à l’enterrement de Patrick", "vous rendre à l’enterrement de Patrick", "se rendre au 96ᵉ anniversaire de votre grande-tante"];

    textSequence(0);
    function textSequence(i) {

        if (example.length > i) {
            setTimeout(function() {
                document.getElementById("sequence").innerHTML = example[i];
                textSequence(++i);
            }, 3000); // 1 second (in milliseconds)

        } else if (example.length == i) { // Loop
            textSequence(0);
        }

    }
  //   var ml4 = {};
  //   ml4.opacityIn = [0,1];
  //   ml4.scaleIn = [0.2, 1];
  //   ml4.scaleOut = 3;
  //   ml4.durationIn = 800;
  //   ml4.durationOut = 600;
  //   ml4.delay = 500;

  // anime.timeline({loop: true})
  //   .add({
  //     targets: '.ml4 .letters-1',
  //     opacity: ml4.opacityIn,
  //     scale: ml4.scaleIn,
  //     duration: ml4.durationIn
  //   }).add({
  //     targets: '.ml4 .letters-1',
  //     opacity: 0,
  //     scale: ml4.scaleOut,
  //     duration: ml4.durationOut,
  //     easing: "easeInExpo",
  //     delay: ml4.delay
  //   }).add({
  //     targets: '.ml4 .letters-2',
  //     opacity: ml4.opacityIn,
  //     scale: ml4.scaleIn,
  //     duration: ml4.durationIn
  //   }).add({
  //     targets: '.ml4 .letters-2',
  //     opacity: 0,
  //     scale: ml4.scaleOut,
  //     duration: ml4.durationOut,
  //     easing: "easeInExpo",
  //     delay: ml4.delay
  //   }).add({
  //     targets: '.ml4 .letters-3',
  //     opacity: ml4.opacityIn,
  //     scale: ml4.scaleIn,
  //     duration: ml4.durationIn
  //   }).add({
  //     targets: '.ml4 .letters-3',
  //     opacity: 0,
  //     scale: ml4.scaleOut,
  //     duration: ml4.durationOut,
  //     easing: "easeInExpo",
  //     delay: ml4.delay
  //   }).add({
  //     targets: '.ml4',
  //     opacity: 0,
  //     duration: 500,
  //     delay: 500
  //   });
  }
}
