function Talk() {

}

Talk.prototype.save = function() {
  $.post('/talks');
}
