import flixel.text.FlxTextBorderStyle;

function create(event) {
    event.options = ["Resume", "Restart Song", "Change Options", "Exit to menu"];
}

function postCreate() {
    for (label in [levelInfo, levelDifficulty, deathCounter, multiplayerText]) {
        if (label == null) continue;
        FlxTween.cancelTweensOf(label);
    }

    levelInfo.visible = true;
    levelInfo.alpha = 1;
    levelInfo.antialiasing = true;

    artistChartInfo = new FunkinText(20, 15, 0, "Composer: " + (PlayState.SONG.meta.customValues?.composer ?? "null"), 24, false);

    for (k=>label in [levelInfo, artistChartInfo]) {
        if (label == levelInfo) {
            label.font = Paths.font("liberbold.ttf");
        } else {
            label.font = Paths.font("liber.ttf");
        }
        label.size = 24;
        label.antialiasing = true;

        label.borderColor = FlxColor.BLACK;
        label.borderStyle = FlxTextBorderStyle.OUTLINE_FAST;

        label.scrollFactor.set();
        label.x = FlxG.width - (label.width + 20);
        label.y = 15 + (k * 30);
    }

    add(artistChartInfo);
}