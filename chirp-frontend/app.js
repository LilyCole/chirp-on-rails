var app = angular.module("chirpApp", ["ngRoute"]);

app.config(function($routeProvider) {
  $routeProvider
    .when("/chirps", {
      templateUrl: "templates/chirp-list.html",
      controller: "ChirpsController",
      controllerAs: "chirpsCtrl"
    })
    .otherwise({
      redirectTo: "/chirps"
    })
});

app.controller("ChirpsController", function($http) {

  var vm = this;

  $http({
  method: 'GET',
  url: 'http://localhost:3000/chirps',
    }).success(function(response) {
        vm.chirps = response;
        console.log(vm.chirps);
    }).error(function(response) {
        alert("Error getting chirps");
    });

  vm.submitChirp = function(event) {
    event.preventDefault();
    $http({
      method: 'POST',
      url: 'http://localhost:3000/users',
      data: {
          user: vm.chirp
        }
      }).success(function(newChirp) {
          vm.chirps.push(newChirp);
          vm.chirp = {};
          $("#add-chirp-modal").modal("hide");
      }).error(function(response) {
          alert("Error saving chirp");
      });
  }
  
});