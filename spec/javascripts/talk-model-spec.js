describe('Talk', function () {
  var xhr, lastRequest;
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

  context("When the talk is new", function() {
    var talk;
    beforeEach(function() {
      talk = new Talk({name: "Do the dance" });
      talk.save();
    });

    describe("#save", function() {
      it("sends the request to /talks", function() {
        expect(lastRequest.url).toEqual('/talks');
      });

      it("sends the request as a POST method", function() {
        expect(lastRequest.method).toEqual('POST');
      });
    });

    describe('#isPersisted', function() {
      it("is false", function() {
        expect(talk.isPersisted()).toBeFalsy();
      });
    });
  });

  context("When the talks already has an id", function() {
    var talk;
    beforeEach(function() {
      talk = new Talk({id: 1, name: "Do the dance" });
      talk.save();
    });

    describe('#save', function() {
      it("sends the request to /talks/:talk_id", function() {
        expect(lastRequest.url).toEqual('/talks/1');
      });

      it("sends the request using the PUT method", function() {
        expect(lastRequest.method).toEqual('PUT');
      });
    });

    describe('#isPersisted', function() {
      it("is true", function() {
        expect(talk.isPersisted()).toBeTruthy();
      });
    });
  });

  describe('#save', function() {
    var talk, returnValue;
    beforeEach(function() {
      talk = new Talk({id: 5, name: "Do the dance" });
      returnValue = talk.save();
    });
    it("sends the talks data in the request body", function() {
      expect(lastRequest.requestBody).toEqual(jQuery.param({ talk: talk.attributes}));
    });

    it("returns a deferred object", function() {
      expect(returnValue.done).toBeDefined();
      expect(returnValue.fail).toBeDefined();
      expect(returnValue.always).toBeDefined();
      expect(returnValue.then).toBeDefined();
    });
  });
});
