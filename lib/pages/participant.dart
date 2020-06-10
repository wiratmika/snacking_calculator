import 'package:flutter/cupertino.dart';

class ParticipantScreen extends StatefulWidget {
  @override
  _ParticipantScreenState createState() => _ParticipantScreenState();
}

class _ParticipantScreenState extends State<ParticipantScreen> {
  final List<String> participants = [];
  final TextEditingController _controller = TextEditingController();

  void addParticipant() {
    String input = _controller.text.trim();
    if (input.length == 0) {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('Maaf!'),
              content: Text('Masih kosong boque!'),
              actions: [
                CupertinoDialogAction(
                    child: Text('fahim'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ],
            );
          });
      return;
    }

    setState(() {
      participants.add(input);
      _controller.clear();
    });
  }

  void deleteParticipant(index) {
    setState(() {
      participants.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar:
            CupertinoNavigationBar(middle: Text('Daftar Partisipan')),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ParticipantsList(
                    participants: participants, onDelete: deleteParticipant),
                CupertinoTextField(
                    controller: _controller,
                    placeholder: 'Tambah partisipan',
                    onSubmitted: (text) {
                      addParticipant();
                    }),
                CupertinoButton(
                  // TODO consider whether this is optional
                  child: Text('Tambah'),
                  onPressed: addParticipant,
                ),
                CupertinoButton(
                  child: Text('Selanjutnya'),
                  onPressed: () {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (context) {
                      return ItemScreen();
                    }));
                  },
                ),
              ],
            ),
          ),
        ));
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

// TODO: move to separate page
class ItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('Daftar Jajanan')),
        child: Center(child: Text('Ulala')));
  }
}
