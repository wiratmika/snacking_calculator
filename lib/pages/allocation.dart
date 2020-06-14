import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:snacking_calculator/models/allocation_model.dart';
import 'package:snacking_calculator/models/participant_model.dart';
import 'package:snacking_calculator/widgets.dart';

class AllocationScreen extends StatelessWidget {
  void showParticipantModal(BuildContext context, int index, String itemName,
      List<String> participants, Function(int, String) onSelect) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: Text('Pilih partisipan'),
            message: Text('Siapa yang membeli $itemName?'),
            actions: participants
                .map((e) => CupertinoActionSheetAction(
                      child: Text(e),
                      onPressed: () {
                        onSelect(index, e);
                        Navigator.of(context).pop();
                      },
                    ))
                .toList(),
            cancelButton: CupertinoActionSheetAction(
              child: Text('Batal'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultWrapper('Pembagian',
        Consumer2<AllocationModel, ParticipantModel>(
            builder: (context, allocations, participants, child) {
      return Column(children: <Widget>[
        AllocationList(allocations.allocations, (index) {
          showParticipantModal(context, index, allocations.getItemName(index),
              participants.items, allocations.allocate);
        }),
        NavigationButtonSet('/summary', allocations.isAllAllocated())
      ]);
    }));
  }
}

class AllocationList extends StatelessWidget {
  final List<Allocation> allocations;
  final Function(int) onSelectParticipant;

  AllocationList(this.allocations, this.onSelectParticipant);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: allocations.length,
        itemBuilder: (BuildContext context, int index) {
          Allocation allocation = allocations[index];
          String participantName =
              allocation.participantName ?? 'Pilih partisipan...';
          return Row(
            children: [
              Expanded(
                child: Text(allocation.itemName),
              ),
              CupertinoButton(
                  child: Text(participantName),
                  onPressed: () => onSelectParticipant(index)),
            ],
          );
        });
  }
}
