import { Tooltip } from "bootstrap";

let tooltipList;

document.addEventListener("turbo:load", () => {
  tooltipList = initTooltips();
});

document.addEventListener("turbo:before-stream-render", async event => {
  const originalRender = event.detail.render;

  event.detail.render = function (streamElement) {
    originalRender(streamElement);
    document.dispatchEvent(new Event("after-turbo-stream-render", { streamElement }));
  };
});

document.addEventListener("after-turbo-stream-render", streamElement => {
  tooltipList.forEach(tooltip => tooltip.hide());
  tooltipList = [...tooltipList, ...initTooltips(streamElement.templateContent)];
});

const initTooltips = (domTarget = document) => {
  const tooltipElements = domTarget.querySelectorAll('[data-bs-toggle="tooltip"]');
  
  return [...tooltipElements].map(tooltipTriggerEl => new Tooltip(tooltipTriggerEl));
}
