function FakeTalk() {

}

FakeTalk.prototype.save = function() {
  return this.deferred = $.Deferred();
}

FakeTalk.prototype.pretendSaveWorked = function(response) {
  this.deferred.resolve(response);
  // The `deferred.resolve` method says that the save completed
  // successfuly.
}

FakeTalk.prototype.pretendSaveFailed = function(response) {
  this.deferred.reject(response);
  // The `deferred.reject` method says that the save failed
}
