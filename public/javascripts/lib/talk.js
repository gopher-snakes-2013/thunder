function Talk(attributes) {
  this.attributes = attributes;
}

Talk.prototype.save = function() {
  $.ajax({
    url: '/talks',
    method: "post",
    contentType: "json",
    data: JSON.stringify(this.attributes)
  });
}
