//region camera movement on note hit
// me when i make code better!!
for (c in strumLines.members[curCameraTarget].characters) {
      if (c == null || !c.visible) continue;
      var cpos = c.getCameraPosition();
      camFollow.setPosition(cpos.x, cpos.y);
}

var rate = 25;

var canMove = false;
function update(elapsed) {
      for (char in strumLines.members[curCameraTarget].characters) {
            if (char == null || !char.visible) continue;
            canMove = StringTools.startsWith(char.getAnimName(), "sing");
            if (!canMove) {
                  var cpos = char.getCameraPosition();
                  camFollow.setPosition(cpos.x, cpos.y);
                  continue;
            }
            break;
      }
}

function onNoteHit(e) moveCameraOnNotes(e.character, e.direction);

function moveCameraOnNotes(character, noteDirection) {
      if (!canMove) return;
      canMove = false;
      var _charPos = character.getCameraPosition();
      switch (noteDirection % 4) {
            case 0: camFollow.setPosition(_charPos.x - rate, _charPos.y);
            case 1: camFollow.setPosition(_charPos.x, _charPos.y + rate);
            case 2: camFollow.setPosition(_charPos.x, _charPos.y - rate);
            case 3: camFollow.setPosition(_charPos.x + rate, _charPos.y);

      }
}

function onCameraMove(e) e.cancel();
//endregion