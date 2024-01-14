import 'package:colorify/backend/io/archiver.dart';
import 'package:vector_math/vector_math.dart';

Vector3 blockAreaSize = Vector3(0, 0, 0);

String getScript({
  required GeneratorType type,
  required int lastFileIndex,
  required bool useStruct,
  required Vector3 blockAreaSize,
}) {
  final List<String> commands = [];

  if (!useStruct) {
    for (int i = 0; i <= lastFileIndex; i++) {
      commands.add('    w.runCommand("function output$i");');
    }
  }

  return '''

import * as Minecraft from '@minecraft/server';

const w = Minecraft.world;

w.beforeEvents.chatSend.subscribe((ev) => {
  const [sender, message] = [ev.sender, ev.message];
  
  if (!sender.isOp()) return;
  if (!message.startsWith('\$')) return;

  if (${!useStruct} && message == '\$p') {
${commands.join('\n')}
  } else if ($useStruct && message == '\$b') {
    Minecraft.system.run(() => {
      sender.runCommand('tickingarea add ~ ~ ~ ~${blockAreaSize.x - 1} ~${blockAreaSize.y - 1} ~${blockAreaSize.z - 1} colorify');
      sender.runCommand('structure load colorify:output ~ ~ ~');
      Minecraft.system.runTimeout(() => {
        sender.dimension.runCommand('tickingarea remove colorify');
      }, 40);
      sender.sendMessage('>> Auto-generation task successfully executed');
    });
  } else {
    sender.sendMessage('>> Invalid command');
  }
})

''';
}
