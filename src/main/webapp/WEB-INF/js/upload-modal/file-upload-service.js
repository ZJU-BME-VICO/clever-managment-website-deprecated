angular.module('clever.management.services.fileUpload', []).service('fileUploadService', ['$http', 'COMMIT_SEQUENCE_URL', 'ARCHETYPE_UPLOAD_URL',
function($http, COMMIT_SEQUENCE_URL, ARCHETYPE_UPLOAD_URL) {
	this.uploadSingleFileToUrl = function(file, commitSequence, overwriteChange) {
		file.status = 'UPLOADING';
		var formData = new FormData();
		formData.append('file', file.file);
		formData.append('commitSequenceId', commitSequence.id);
		formData.append('overwriteChange', overwriteChange);
		$http.post(ARCHETYPE_UPLOAD_URL, formData, {
			transformRequest : angular.identity,
			headers : {
				'Content-Type' : undefined
			}
		}).success(function(result) {
			file.status = result.fileStatus;
		}).error(function() {
			file.status = 'FAILED';
			console.log("Upload archetype failed.");
		});
	};

	this.getCommitSequence = function() {
		return $http.get(COMMIT_SEQUENCE_URL).then(function(response) {
			return response.data;
		});
	};
}]);
