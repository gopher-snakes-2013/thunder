function Talk(attributes) {
  this.attributes = attributes;
}

Talk.prototype.save = function() {
  return $.ajax({
    url: this.__url(),
    method: this.__method(),
    contentType: "json",
    data: JSON.stringify(this.attributes)
  });
}

Talk.prototype.__url = function() {
// The double underscores indicate that this function is private.
  if (this.isPersisted()) {
    return  "/talks/" + this.attributes.id
  } else {
    return "/talks"
  }
}

Talk.prototype.__method = function() {
  if (this.isPersisted()) {
    return "PUT"
  } else {
    return "POST"
  }
}

Talk.prototype.isPersisted = function() {
  return (typeof this.attributes.id !== "undefined")
}
