

// better modulo function
function mod(n) {
    return ((this%n)+n)%n;
}



// DOM helpers

// Get elements by CSS selector:
function qs(selector, scope) {
    return (scope || document).querySelector(selector);
}

function qsa(selector, scope) {
    return (scope || document).querySelectorAll(selector);
}


// Add and remove event listeners:
function on(target, type, callback, useCapture) {
    target.addEventListener(type, callback, !!useCapture);
}

function off(target, type, callback, useCapture) {
    target.removeEventListener(type, callback, !!useCapture);
}



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
    var $closeBtns = $(this.backDrop).find('.close');
    $closeBtns.click(this.hide.bind(this));
};

Modal.prototype.show = function showModal() {
    this.backDrop.classList.add('active');
};
Modal.prototype.hide = function hideModal() {
    this.backDrop.classList.remove('active');
};



// timer button

var Timer = function timerConstructor(button, seconds) {
    this.seconds = seconds;
    this.timer = null;
    this.button = button;
    this.button.textContent = this.getElapsed();

    var t = this;
    button.addEventListener('click', function() {
        t[t.timer === null ? 'start' : 'stop']();
    });
};

Timer.prototype.getElapsed = function getElapsed() {
    var s = this.seconds;
    var m = Math[s < 0 ? 'ceil' : 'floor'](s / 60);
    s = s % 60;
    return m + 'm ' + s + 's';
};

Timer.prototype.start = function startTimer() {
    this.updateColor();
    var t = this;
    function decrement() {
        t.seconds--;
        t.button.textContent = t.getElapsed();
        t.timer = setTimeout(decrement, 1000);
        t.updateColor();
    }
    t.timer = setTimeout(decrement, 1000);
};

Timer.prototype.stop = function stopTimer() {
    if (this.timer === null) return;
    clearTimeout(this.timer);
    this.timer = null;
    this.button.style.color = 'black';
};

Timer.prototype.updateColor = function updateColor() {
    this.button.style.color = this.seconds < 0 ? 'red' : 'green';
}

Timer.prototype.reset = function reset(newSeconds) {
    this.stop();
    this.seconds = newSeconds;
    this.button.textContent = this.getElapsed();
}