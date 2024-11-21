import { Application } from "@hotwired/stimulus";

const application = Application.start();

// Optional: Set up debugging
application.debug = false;
window.Stimulus = application;

export { application };
