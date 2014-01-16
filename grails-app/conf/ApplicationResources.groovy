modules = {
  //js
  dropzone{
    dependsOn 'jquery'
    resource url: 'js/lib/dropzone/dropzone.js'
    resource url: 'js/lib/dropzone/css/dropzone.css'
  }
  angular{
    dependsOn 'jquery'
    resource url: 'js/lib/angular-1.2.1/angular-csp.css'
    resource url: 'js/lib/angular-1.2.1/angular.js'
    resource url: 'js/lib/angular-1.2.1/angular-resource.js'
    resource url: 'js/lib/angular-1.2.1/angular-route.js'
    resource url: 'js/lib/angular-1.2.1/angular-sanitize.js'
    resource url: 'js/lib/angular-1.2.1/angular-animate.js'
  }
  angular_app {
    dependsOn 'angular'
    dependsOn 'bootstrap_ui'
    resource id: 'services', url:'js/app/services.js'
    resource id: 'app', url:'js/app/app.js'
    resource id: 'filters', url:'js/app/filters.js'
    resource id: 'controllers', url:'js/app/controllers.js'
    resource id: 'config', url:'js/app/config.js'
    resource id: 'waterbug', url:'js/app/waterbug_prod.js'
  }
  
  //bootstrap and css
  bootstrap_switch {
    dependsOn 'bootstrap'
    resource url: 'js/lib/bootstrap-switch/bootstrap-switch.css'
    resource url: 'js/lib/bootstrap-switch/bootstrap-switch.js'
  }
  bootstrap_ui {
    dependsOn 'bootstrap'
    dependsOn 'angular'
    resource url: 'js/lib/bootstrap-ui-0.7/ui-bootstrap-tpls-0.7.0.js'
  }
  application { resource url:'js/application.js' }
}