//Modal controller $uibModalInstance -- controls new room modal
//cp 3

(function() {
    function ModalCtrl(Room, $uibModalInstance) {
      this.cancel = function() {
        $uibModalInstance.dismiss('canceled');
      };

      this.submit = function() {
        Room.add(this.newRoom.name);
        $uibModalInstance.close('submitted');
      };
    }

    angular
        .module('blocChat')
        .controller('ModalCtrl', ['Room', '$uibModalInstance', ModalCtrl]);
})();
