var setup = false;

function postUpdate() {
    if (transitioning) {
        titleText.offset.set(278, 2);
        if (!setup) {
            new FlxTimer().start(1, (_) -> goToMainMenu(false));
            setup = true;
        }
    }
}