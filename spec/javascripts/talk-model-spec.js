describe('Talk', function () {
  var xhr, lastRequest;
  describe('#save', function() {
    beforeEach(function() {
      xhr = sinon.useFakeXMLHttpRequest();
      // Sinon allows us to intercept all AJAX calls, regardless of whether
      // we're using jQuery or another library.

      xhr.onCreate = function(request) {
      // by setting  onCreate to a function, we make it so every time a new
      // AJAX call is created we can capture it and store it somewhere.
        lastRequest = request;
        // In this case, we're storing it as 'lastRequest'
      };
    });

    afterEach(function() {
      xhr.restore();
      // We want to turn AJAX back on. Just in case.
    });

    it("sends the talks data in the request body", function() {
        var talk = new Talk({id: 5, name: "Do the dance" });

        talk.save();

        expect(lastRequest.requestBody).toEqual(JSON.stringify(talk.attributes));
    });
    it("returns a deferred object");
    context("When the talk is new", function() {
      it("POSTs a request to /talks", function() {
        var talk = new Talk({name: "Do the dance" });
        // Let's create a new talk to save. We're not going to use an id

        talk.save();
        // save is our method under test, so let's call it!

        expect(lastRequest.url).toEqual('/talks');
        // Let's make sure the request was sent to the right place!
      });
    });

    context("When the talks already has an id", function() {
      xit("PUTs the request to /talks/:talk_id");
    });
  });
});

