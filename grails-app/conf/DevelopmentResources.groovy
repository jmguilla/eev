environment {
  development {
      modules = {
          overrides {
              angular_app {
                resource id: 'waterbug', url:'js/app/waterbug.js'
              }
          }
      }
  }
}