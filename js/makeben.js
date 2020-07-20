#!/usr/bin/env node
const puppeteer = require('puppeteer');
var myArgs = process.argv.slice(2);
if (myArgs.length !== 2  ) {
  console.log(' Usage: nodejs makeben.js SOURCE.FILE RELEASE_NOTE.MD');
  process.exit(1);
}
var sourceFile = myArgs[0];
var releaseNote = myArgs[1];
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
        var url = 'http://ktulu/view/ben.php';
        console.log('try to open: ', url);
        await page.goto(url);
        const titolo = await page.evaluate(() => {
            return { title: document.title, };
        });
        console.log('Page title:', titolo);
        // uncheck local 
        await page.click('#checkLocal');
        // seleziono la famiglia 
        await page.select('#family_id', '118');
        await page.waitFor(500);
        // seleziono connectivity
        await page.click('#componente_radio438');   
        // carico file  
        const input = await page.$('#inputSourceFile00');
        const fileToUpload = sourceFile;
        await input.uploadFile(fileToUpload);
        await page.waitFor(500);
        // carico release note 
        const inputReleaseNote = await page.$('#inputReleaseNote');
        const fileToUploadReleaseNote = releaseNote;
        await inputReleaseNote.uploadFile(fileToUploadReleaseNote);
        await page.waitFor(500);
        // Sets the value of the file input to fileToUpload
        await page.click('#makeBen');
        // non riesco a fare click se c'e' 
        await page.waitFor(1000);
        await page.waitForSelector('#outputmake');
        const result = await page.evaluate(el => el.innerHTML, await page.$('#outputmake'));
        if (result.search('Click to download ben') == -1) {
            console.log('Risultato', result);
            process.exit(1);
        }
        await page._client.send('Page.setDownloadBehavior', {behavior: 'allow', downloadPath: './'});
        await page.click("a#benSuccess");
        await page.waitFor(3000);

        await page.screenshot({path: 'example.png'});
        await browser.close();
  } catch (e) {
      console.log('an expection on page.evaluate ', e);
      console.log(e);
      process.exit(1);
  }
})();
