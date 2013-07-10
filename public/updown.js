(function(window, document) {
  var characters = 'abcdefghijklmnopqrstuvwxyz';

  function getRandomCharacter(str) {
    return str.charAt(Math.floor(Math.random() * str.length));
  }

  function createRandomString(length) {
    var name = '';
    while (name.length < length) {
      name += getRandomCharacter(characters);
    }
    return name;
  }

  function createCallbackName() {
    var callbackName = createRandomString(10);
    while (callbackName in window) {
      callbackName = createRandomString(10);
    }
    return callbackName;
  }

  function createCallback(callback) {
    var callbackName = createCallbackName();

    window[callbackName] = function() {
      try {
        callback.apply(this, arguments);
      } finally {
        delete window[callbackName];
      }
    };

    return callbackName;
  }

  function getCurrentUrl() {
    return window.location.hostname + window.location.pathname;
  }

  function makeRequest(route, callback) {
    var script = document.createElement('script');
    script.src = 'http://updown.herokuapp.com/' + route +
      '?url=' + encodeURIComponent(getCurrentUrl()) +
      '&callback=' + createCallback(callback);
    document.head.appendChild(script);
  }

  window.UpDown = {
    voteUp: function(callback) {
      makeRequest('up', callback);
    },

    voteDown: function(callback) {
      makeRequest('down', callback);
    }
  };

}(window, document));
