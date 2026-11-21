const { chromium } = require('playwright');
const path = require('path');
(async () => {
  const [,, input, output] = process.argv;
  const browser = await chromium.launch();
  const page = await browser.newPage();
  await page.goto('file://' + path.resolve(input), { waitUntil: 'load' });
  await page.pdf({
    path: output, format: 'A4', printBackground: true, preferCSSPageSize: true,
    displayHeaderFooter: true,
    headerTemplate: '<div></div>',
    footerTemplate: '<div style="width:100%;font-family:Liberation Sans,sans-serif;font-size:8pt;color:#777;text-align:center;"><span class="pageNumber"></span> / <span class="totalPages"></span></div>',
  });
  await browser.close();
})();
