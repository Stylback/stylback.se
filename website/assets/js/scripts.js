
/** --------------------------------------- */
/** DARKMODE/LIGHTMODE SWITCHER
 * Logic:
 *  1. Find out if dark mode is prefered by the visitor, set the initial theme according to this.
 *  2. Ensure persistency of theme value through the use of localStorage.
 *  3. Let the user switch theme by updating the theme value in localStorage.
 * 
 * In addition, the toggle-button symbol is switched alongside the theme.
 * This is made possible by the use of the "data-theme" syntax in css, where we specify the color values.
*/

function switchTheme({ theme }) {
  document.querySelector("html").setAttribute("data-theme", theme);
  if (theme === "light") {
    document.getElementById("highlight-style").href="/assets/css/gruvbox-light.css";
  } else {
    document.getElementById("highlight-style").href="/assets/css/gruvbox-dark.css";
  }
}

function updateButton({ buttonElement }) {
  if (localStorage.getItem("theme") === "light" ) {
    button.setAttribute("aria-label", sun);
    button.innerText = sun;
  } else {
    button.setAttribute("aria-label", moon);
    button.innerText = moon;
  }
}

const sun = "\u263C"; /** White sun with rays */
const moon = "\u263D"; /** First Quarter Moon */
const darkModePreference = window.matchMedia("(prefers-color-scheme: dark)"); /** boolean*/
var theme;
if (darkModePreference == true) {
  theme = "dark"
} else {
  theme = "light"
}

if (localStorage.getItem("theme") == null) {
  localStorage.setItem("theme", "dark");
}

switchTheme({ theme: localStorage.getItem("theme") });
const button = document.querySelector("[data-theme-toggle]");
updateButton({buttonElement: button})

button.addEventListener("click", (event) => {
  if (localStorage.getItem("theme") === "light" ) {
    switchTheme({ theme: "dark" });
    localStorage.setItem("theme", "dark");
    updateButton({buttonElement: button})
  } else {
    switchTheme({ theme: "light" });
    localStorage.setItem("theme", "light");
    updateButton({buttonElement: button})
  }
});
/** --------------------------------------- */