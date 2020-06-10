import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:snacking_calculator/models/participant_model.dart';
import 'package:snacking_calculator/pages/item.dart';

class ParticipantScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  void addParticipant(context, callback) {
    String input = _controller.text.trim();
    if (input.length == 0) {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('Mohon maaf'),
              content: Text('Nama partisipan tidak boleh kosong'),
              actions: [
                CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ],
            );
          });
      return;
    }

    callback(input);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Daftar Partisipan')),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Consumer<ParticipantModel>(
              builder: (context, participants, child) {
            return Column(children: [
              ParticipantsList(
                  participants: participants.items,
                  onDelete: participants.delete),
              CupertinoTextField(
                  controller: _controller,
                  placeholder: 'Tambah partisipan',
                  onSubmitted: (text) {
                    addParticipant(context, participants.add);
                  }),
              CupertinoButton(
                  // TODO consider whether this is optional
                  child: Text('Tambah'),
                  onPressed: () {
                    addParticipant(context, participants.add);
                  }),
              CupertinoButton(
                child: Text('Selanjutnya'),
                onPressed: () {
                  Navigator.of(context)
                      .push(CupertinoPageRoute(builder: (context) {
                    return ItemScreen();
                  }));
                },
              ),
            ]);
          }),
        ),
      ),
    );
  }
}

class ParticipantsList extends StatelessWidget {
  final List<String> participants;
  final Function(int) onDelete;

  ParticipantsList(
      {Key key, @required this.participants, @required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (participants.length == 0) return Text('Belum ada partisipan');

    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: participants.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Expanded(
                child: Text(participants[index]),
              ),
              CupertinoButton(
                  child: Text('apus'),
                  onPressed: () {
                    onDelete(index);
                  })
            ],
          );
        });
  }
}
