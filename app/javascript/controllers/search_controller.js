import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input"];

  connect() {
    const urlParams = new URLSearchParams(window.location.search);
    const queryParam = urlParams.get("query");

    queryParam && (this.inputTarget.value = queryParam);
  }

  replaceState() {
    const { origin, pathname, search } = window.location;
    const inputValue = this.inputTarget.value;
    const newParams = new URLSearchParams(search);

    newParams.set("query", inputValue);
    history.replaceState(null, null, `${origin}${pathname}?${newParams}`);
  }
}