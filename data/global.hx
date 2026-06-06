import lime.graphics.Image;

function postStateSwitch() {
    window.setIcon(Image.fromBytes(Assets.getBytes("assets/images/titleicon/icon.ico")));
}

public static function onCreateStars(object) {
    //trace(Type.getClassName(Type.getClass(object)));

    var starBGs: Array<FlxSprite> = [];
    var starFGs: Array<FlxSprite> = [];

    for (i in 0...3) {
        var starBG = new FlxSprite(i * FlxG.width, 0);
        starBG.antialiasing = true;
        starBG.scrollFactor.set(0, 0);
        starBG.loadGraphic(Paths.image('menus/common/starBG'));
        starBG.setGraphicSize(FlxG.width, FlxG.height);
        starBG.updateHitbox();
        starBGs.push(starBG);
        object.add(starBG);
    }

    for (i in 0...3) {
        var starFG = new FlxSprite(i * FlxG.width, 0);
        starFG.antialiasing = true;
        starFG.scrollFactor.set(0, 0);
        starFG.loadGraphic(Paths.image('menus/common/starFG'));
        starFG.setGraphicSize(FlxG.width, FlxG.height);
        starFG.updateHitbox();
        starFGs.push(starFG);
        object.add(starFG);
    }

    return [starBGs, starFGs];
}

private var time;

public static function onUpdateStars(in: Array<Array<FlxSprite>>, elapsed) {
    time += elapsed;

    var starBGs = in[0];
    var starFGs = in[1];

    if (time%100 == 0) {
        for (i in starBGs) {
            i.x -= 0.075;

            if (i.x <= -FlxG.width) {
                i.x += FlxG.width * starBGs.length;
            }
        }
        for (i in starFGs) {
            i.x -= 0.1;

            if (i.x <= -FlxG.width) {
                i.x += FlxG.width * starFGs.length;
            }
        }
    }
}

public static function anyJustPressed() {
    var isDowns = FlxG.keys.getIsDown();
    for (i in isDowns) {
        if (i.justPressed) {
            return true;
        }
    }

    return false;
}