const assert = require("assert");
const { openBrowser, goto, text, $, closeBrowser, below } = require('taiko');
(async () => {
    try {
        console.log(`Current directory: ${process.cwd()}`);
        await openBrowser({args: [" --window-position=2000,3000"]});
        await goto("file:///" + process.cwd() + "/examples/BasicAreachart.html");
        
        await ["00:00","01:00","02:00","03:00","06:00"].forEach(async el => {
            assert.ok(await text(el.toString(), below($('text.apexcharts-text > tspan'))).exists());
        });

        assert.ok(await $(".apexcharts-area").exists());
    } finally {
        await closeBrowser();
    }
})();


