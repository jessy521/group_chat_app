import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatefulWidget {
  final String message;
  final String sender;
  final bool sentByMe;
  const MessageTile(
      {Key? key,
      required this.message,
      required this.sender,
      required this.sentByMe})
      : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: 4,
            bottom: 4,
            left: widget.sentByMe ? 0 : 24,
            right: widget.sentByMe ? 24 : 0),
        alignment:
            widget.sentByMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: widget.sentByMe
              ? const EdgeInsets.only(left: 30)
              : const EdgeInsets.only(right: 30),
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 17, right: 17),
          decoration: BoxDecoration(
            borderRadius: widget.sentByMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))
                : const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
            color: widget.sentByMe
                ? Theme.of(context).primaryColor
                : Colors.grey[700],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.sender.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 13, color: Colors.white),
              )
            ],
          ),
        ));
  }
}