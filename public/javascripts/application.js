$(document).on('ready', function() {
  Thunder.run();
  // I could put a bunch of my logic here, but instead I'd rather just tell my
  // javascript app to start running

  // This decouples my Javascript Objects from the DOMLoad event, which makes
  // them far easier to test
});
