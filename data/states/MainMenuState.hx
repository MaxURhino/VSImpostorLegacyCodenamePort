import funkin.ui.FunkinText;
import flixel.text.FlxTextBorderStyle;
import haxe.io.Path;
import flixel.effects.FlxFlicker;
import funkin.options.OptionsMenu;
import funkin.backend.MusicBeatState;
var o;
var texts:Array<Dynamic> = [];
var images:Array<FlxSprite> = [];

var textGroups:FlxTypedGroup;

var out:Array<Array<FlxSprite>> = [];

var glow:FlxSprite;
var vignette:FlxSprite;

var time: Float;

function create() {
    //optionShit = ["story mode", "freeplay", "cosmicube", "options", "awards"];
    //o = optionShit;
}

function postCreate() {
    members[1].destroy(); //CamFollow
    remove(members[1]);
    members[4].destroy(); //Text
    remove(members[4]);
    magenta.destroy();
    remove(magenta);

    remove(bg);

    for (i in menuItems) {
        i.visible = false;
        i.alpha = 0;
        i.destroy();
    }

    optionShit = ["story mode", "freeplay", "cosmicube", "options", "awards"];
    var iconMap = ["story mode" => "Red and Green"];
    o = optionShit;
    
    out = onCreateStars(this);

    var tablet = new FlxSprite(0, 0);
    tablet.antialiasing = true;
    tablet.frames = Paths.getSparrowAtlas("menus/mainmenu/new buttons and stuff");

    tablet.animation.addByPrefix("main", "tablet instance 1", 24, false);
    tablet.animation.play("main");
    tablet.animation.curAnim.curFrame = 0;
    tablet.animation.stop();
    tablet.scrollFactor.set(0, 0);
    tablet.scale.set(0.67, 0.67);
    tablet.updateHitbox();
    tablet.screenCenter(FlxAxes.X);
    tablet.y = tablet.height - 20;

    add(tablet);

    glow = new FlxSprite(0, 0);
    glow.antialiasing = true;
    glow.scrollFactor.set(0, 0);
    glow.loadGraphic(Paths.image('menus/mainmenu/glow'));
    glow.setGraphicSize(FlxG.width, FlxG.height);
    glow.updateHitbox();
    add(glow);

    var logo = new FlxSprite(0, 0);
    logo.antialiasing = true;
    logo.scrollFactor.set(0, 0);
    logo.frames = Paths.getSparrowAtlas('menus/titlescreen/logo');

    logo.animation.addByPrefix("bump", "logo bumpin", 24, false);
    logo.animation.play("bump");
    logo.animation.curAnim.curFrame = 0;
    logo.animation.stop();

    logo.scale.set(0.5, 0.5);
    logo.updateHitbox();
    logo.x = logo.width + 10;

    add(logo);

    vignette = new FlxSprite(0, 0);
    vignette.antialiasing = true;
    vignette.scrollFactor.set(0, 0);
    vignette.loadGraphic(Paths.image('menus/mainmenu/vignette'));
    vignette.setGraphicSize(FlxG.width, FlxG.height);
    vignette.updateHitbox();
    add(vignette);

    textGroups = new FlxTypedGroup();
    add(textGroups);

    var sub = 0;

    for (i3 in 0...o.length) {
        var i = o.length - i3 - 1;

        var string = upper(o[i]);

        var size = 30;

        var x = 0;
        var buttonx = 0;

        var button_prefix = "";

        if (o[i] == "options" || o[i] == "awards") {
            button_prefix = "small_";
            sub += 1;
            size = 20;
            if (o[i] == "options") {
                x = -195;
            } else {
                buttonx = 190;
            }
        }

        var i2 = i3 - sub;

        var button = new FlxSprite((FlxG.width/2) - 275 + buttonx, FlxG.height - 215 - (i2 * 70));
        button.antialiasing = true;
        button.scrollFactor.set(0, 0);
        button.scale.set(0.675, 0.675);
        button.frames = tablet.frames;

        button.animation.addByPrefix("idle",     "Big button instance 10000", 24, false);
        button.animation.addByPrefix("hovered",  "Big button instance 10001", 24, false);
        button.animation.addByPrefix("selected", "Big button instance 10002", 24, false);

        button.animation.addByPrefix("small_idle",     "Small Button instance 10000", 24, false);
        button.animation.addByPrefix("small_hovered",  "Small Button instance 10001", 24, false);
        button.animation.addByPrefix("small_selected", "Small Button instance 10002", 24, false);
        button.animation.play(button_prefix + "idle");

        add(button);

        var text = new FunkinText(0, FlxG.height - 185 - (i2 * 70), 0, string, size);
        text.borderStyle = FlxTextBorderStyle.NONE;
        text.alignment = "right";
        text.antialiasing = true;
        text.scrollFactor.set();
        text.color = FlxColor.fromInt(0xFF0F332F);
        text.x = FlxG.width - 470 - text.width + x;

        add(text);

        text.ID = i;
        textGroups.add(text);

        texts.insert(0, {
            button: button,
            button_prefix: button_prefix,
            text: text,
            icon: null,
            t: 0
        });
    }

    versionShit = new FunkinText(0, FlxG.height - 4, 0, 'VS Impostor Legacy 1.0.0');
    versionShit.scrollFactor.set();
    versionShit.x = FlxG.width - 10 - versionShit.width;
    versionShit.y -= versionShit.height;
    add(versionShit);
}

var shouldTheShitBeOnRightOrNotFuckThis = false;

function update(elapsed) {
    onUpdateStars(out, elapsed);

    if (controls.ACCEPT) {
        selectItem();
    }

    if (controls.UP_P) {
        if (curSelected == 4) {
            changeItem(-2);
        } else {
            changeItem(-1);
        }
    }
    if (controls.DOWN_P) {
        if (shouldTheShitBeOnRightOrNotFuckThis && curSelected == 2) {
            changeItem(2);
        }
        else if (curSelected != 3) {
            changeItem(1);
        }
    }
    if (controls.LEFT_P)
        if (curSelected == 4) {
            changeItem(-1);
            shouldTheShitBeOnRightOrNotFuckThis = false;
        }
    if (controls.RIGHT_P)
        if (curSelected == 3) {
            changeItem(1);
            shouldTheShitBeOnRightOrNotFuckThis = true;
        }
}

function postUpdate(elapsed:Float) {
    time += elapsed;
    for(m in menuItems)
        m.x -= FlxG.width * 0.2;

    if (!selectedSomethin) {
        for (i in 0...texts.length) {
            var t = texts[i];
            t.t = lerp(t.t, (curSelected == i ? 1 : 0), 0.5);
            t.button.animation.play(t.button_prefix + "idle");
        }
        texts[curSelected].button.animation.play(texts[curSelected].button_prefix + "hovered");
    }/* else {
        texts[curSelected].text.x -= 0.1;

        textGroups.forEach(function(text:FunkinText) {
            if (text.ID != curSelected)
            {
                text.x += 1 / text.x + 2;
                text.alpha -= 0.02;
            }
        });
    }*/
}

function changeItem(huh:Int = 0) {
    curSelected += huh;
    if (curSelected < 0) {
        curSelected = 0;
    } else if (curSelected > texts.length - 1) {
        curSelected = texts.length - 1;
    }


    FlxG.sound.play(Paths.sound('menu/scroll'), 0.7);
}

function upper(str:String) {
    var c = str.split(" ");
    for(i in 0...c.length)
        c[i] = c[i].substr(0, 1).toUpperCase() + c[i].substr(1);
    return c.join(" ");
}

function selectItem() {
    selectedSomethin = true;
    var daChoice = "";
    if (!(curSelected > o.length))
        daChoice = o[curSelected];
    var sound = FlxG.sound.play(Paths.sound('menu/confirm'), 1);
    var duration = sound.length;
    FlxG.camera.flash(FlxColor.WHITE, duration/1000);
    new FlxTimer().start(duration/1000, function(tmr:FlxTimer) {
        switch (daChoice)
        {
            case 'story mode':
                FlxG.switchState(new StoryMenuState());
                trace("Story Menu Selected");
            case 'freeplay':
                FlxG.switchState(new FreeplayState());
                trace("Freeplay Menu Selected");
            case 'cosmicube':
                // TODO: add body
                selectedSomethin = false;
            case 'options':
                FlxG.switchState(new OptionsMenu());
                trace("Options Menu Selected");
            case 'awards':
                // TODO: add body
                selectedSomethin = false;
            case 'back':
                FlxG.switchState(new TitleState());
                trace("Back Selected");
            default:
                trace("Not implemented yet");
        }
    });



}

//TURN OFF OLD FUNCTION
function onSelectItem(event)
{
    event.cancelled = true;
}
function onChangeItem(event)
{
    event.cancelled = true;
}
    