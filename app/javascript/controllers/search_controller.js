import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input"];
  
  clearSearchInput() {
    setTimeout(() => {
      this.inputTarget.value = "";
    }, 0);
  }
}