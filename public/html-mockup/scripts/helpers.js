

// modal hide and show

var Modal = function modalConstructor(name) {
	// grab backDrop el
	this.backDrop = document.querySelector('.' + name + '-modal');

	// hide when .modal-backdrop but not .modal is clicked
	this.backDrop.addEventListener('click', this.hide.bind(this));
	var modal = this.backDrop.querySelector('.modal');
	modal.addEventListener('click', function(event) {
		event.stopPropagation();
	});

	// hide when .close is clicked
	var closeBtn = this.backDrop.querySelector('.close');
	closeBtn.addEventListener('click', this.hide.bind(this));
};

Modal.prototype.show = function showModal() {
	this.backDrop.classList.add('active');
};
Modal.prototype.hide = function hideModal() {
	this.backDrop.classList.remove('active');
};

