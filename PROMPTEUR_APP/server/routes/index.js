module.exports = function(app) {
  require('./generic/routes')(app);
  require('./pre_onboarding/routes')(app);
};