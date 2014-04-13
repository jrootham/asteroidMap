# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = () ->
  ge
  google.load("earth", "1")
  
  
  init = () ->
    console.log("Show Map")
    google.earth.createInstance('canmap', initCB, failureCB)
  
  initCB = (instance) ->
    ge = instance
    ge.getWindow().setVisibility(true)
    # add a navigation control
    ge.getNavigationControl().setVisibility(ge.VISIBILITY_AUTO)

    lookAt = ge.createLookAt('')
    ge.getOptions().setMapType(ge.MAP_TYPE_SKY)
    lookAt.set(-59.65189337195337, -18.799770300376053, 200, ge.ALTITUDE_RELATIVE_TO_GROUND, 0, 0, 36817)

    getFlyIn(-44, -434, 1)
    getFlyIn(-100, -433, 2)
    getFlyIn(-330, -504, 3)
  
  failureCB = (errorCode) ->
    console.log(errorCode)
  
  
  
  # fly in 
  getFlyIn = (numLat, numLng, numMove) ->
    console.log(numMove)
    fts = ge.getOptions().getFlyToSpeed()
    ge.getOptions().setFlyToSpeed(.2) # Slow Down
    lookAt = ge.getView().copyAsLookAt(ge.ALTITUDE_RELATIVE_TO_GROUND)
    lookAt.set(numLat, numLng, ge.ALTITUDE_RELATIVE_TO_GROUND, 0, 0, 368, ge.getView().setAbstractView(lookAt))

    ge.getView().setAbstractView(lookAt)
    ge.getOptions().setFlyToSpeed(oldFlyToSpeed)

  
  makeFlickrShow = (json) ->
  
  
  
  
  google.setOnLoadCallback(init)
  

$(document).ready(ready)
$(document).on('page:load', ready)
