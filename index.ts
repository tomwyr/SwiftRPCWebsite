import "./styles.css";
import { runApplication } from "elementary-ui-browser-runtime";
import appInit from "virtual:swift-wasm?init";

await runApplication(appInit);

const header = document.querySelector<HTMLElement>("[data-site-header]");
const hero = document.querySelector<HTMLElement>(".hero");

if (header && hero) {
  const observer = new IntersectionObserver(
    ([entry]) => header.classList.toggle("is-scrolled", !entry.isIntersecting),
    { rootMargin: "-72px 0px 0px" },
  );
  observer.observe(hero);
}

document.addEventListener("keydown", (event) => {
  const currentTab = (event.target as HTMLElement).closest<HTMLButtonElement>("[role='tab']");
  if (currentTab) {
    const tabs = Array.from(
      currentTab.closest("[role='tablist']")?.querySelectorAll<HTMLButtonElement>("[role='tab']") ?? [],
    );
    const index = tabs.indexOf(currentTab);
    let nextIndex: number | undefined;

    if (event.key === "ArrowRight" || event.key === "ArrowDown") nextIndex = (index + 1) % tabs.length;
    if (event.key === "ArrowLeft" || event.key === "ArrowUp") nextIndex = (index - 1 + tabs.length) % tabs.length;
    if (event.key === "Home") nextIndex = 0;
    if (event.key === "End") nextIndex = tabs.length - 1;

    if (nextIndex !== undefined) {
      event.preventDefault();
      tabs[nextIndex].focus();
      tabs[nextIndex].click();
    }
  }

  if (event.key === "Escape") {
    const menu = document.querySelector<HTMLElement>("[data-mobile-menu]");
    const toggle = document.querySelector<HTMLButtonElement>(".menu-button");
    if (menu && toggle) {
      toggle.click();
      toggle.focus();
    }
  }
});

document.addEventListener("click", async (event) => {
  const button = (event.target as HTMLElement).closest<HTMLButtonElement>("[data-copy-code]");
  if (!button) return;

  const label = button.querySelector<HTMLElement>("[data-copy-label]");
  const status = button.closest(".code-window")?.querySelector<HTMLElement>("[data-copy-status]");
  const text = button.dataset.copyCode ?? "";

  button.classList.remove("is-error");

  try {
    await navigator.clipboard.writeText(text);
    button.classList.add("is-success");
    if (label) label.textContent = "Copied";
    if (status) status.textContent = "Code copied to clipboard.";
  } catch {
    button.classList.add("is-error");
    if (label) label.textContent = "Failed";
    if (status) status.textContent = "Copy failed. Select and copy the code manually.";
  }

  window.setTimeout(() => {
    button.classList.remove("is-success", "is-error");
    if (label) label.textContent = "Copy";
    if (status) status.textContent = "";
  }, 2000);
});

window.addEventListener("resize", () => {
  if (window.innerWidth > 820) {
    const menu = document.querySelector<HTMLElement>("[data-mobile-menu]");
    const toggle = document.querySelector<HTMLButtonElement>(".menu-button");
    if (menu && toggle) toggle.click();
  }
});
