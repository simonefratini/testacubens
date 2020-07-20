const puppeteer = require('puppeteer');
var myArgs = process.argv.slice(2);
if (myArgs.length !== 1  ) {
  console.log(' Usage: nodejs  <URL> ');
  process.exit(1);
}
var url = myArgs[0];
(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  page.on('error', err=> {
    console.log('error happen at the page: ', err);
  });

  // con questo evento si prendono gli errori di jascript nella pagina che si carica
  page.on("pageerror", function(err) {  
    console.log(err.toString()); 
    process.exit(1);
  });

  try {
        console.log('try to open: ', myArgs);
        await page.goto(url);
        const titolo = await page.evaluate(() => {
            return { title: document.title, };
        });
        console.log('Page title:', titolo);
        await browser.close();
  } catch (e) {
      console.log('an expection on page.evaluate ', e);
      console.log(e);
      process.exit(1);
  }
})();
