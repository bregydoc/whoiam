import "./main.css";
import { Elm } from "./Main.elm";
import * as serviceWorker from "./serviceWorker";

const getSettings = () => {
    const strSettings = localStorage.getItem("settings") || `{ language: "EN", theme: "Dark" }`;
    try {
        return JSON.parse(strSettings);
    } catch {
        return { language: "EN", theme: "Dark" };
    }
};

const app = Elm.Main.init({
    node: document.getElementById("root"),
    flags: {
        currentDate: Date.now(),
        width: window.innerWidth,
        settings: getSettings(),
    },
});

app.ports.saveSettings.subscribe((settings) => {
    const settingsStr = JSON.stringify(settings);
    localStorage.setItem("settings", settingsStr);
});

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
