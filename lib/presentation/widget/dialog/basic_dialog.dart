import 'package:flutter/material.dart';
import '../../../core/utils/const.dart';
import '../../../styles/styles.dart';
import '../component/animated_button.dart';
import '../component/common_button.dart';

class BasicDialog extends StatefulWidget {
  const BasicDialog({
    super.key,
    this.title,
    this.description,
    this.textAccept,
    this.textCancel,
    this.top,
    this.bottom,
    this.inputEnabled = false,
    this.validator,
  });

  final String? title;
  final String? description;
  final String? textCancel;
  final String? textAccept;
  final Widget? top;
  final Widget? bottom;
  final bool inputEnabled;
  final String? Function(String? text)? validator;

  @override
  State<BasicDialog> createState() => _BasicDialogState();
}

class _BasicDialogState extends State<BasicDialog> {
  final TextEditingController responseController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          right: 12,
                        ),
                        child: AnimatedButton(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.black87,
                            size: 30,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (widget.top != null) widget.top!,
                            if (widget.title != null)
                              Text(
                                widget.title!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            if (widget.description != null)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 8,
                                ),
                                child: Text(
                                  widget.description!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            if (widget.bottom != null) widget.bottom!,
                            const SizedBox(height: 10),
                            if (widget.inputEnabled) wInput(),
                            Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              runAlignment: WrapAlignment.center,
                              spacing: 12,
                              runSpacing: 8,
                              children: [
                                if (widget.textCancel != null)
                                  CommonButton(
                                    text: widget.textCancel!,
                                    borderRadius: BorderRadius.circular(45),
                                    onTap: () {
                                      final response = widget.inputEnabled
                                          ? responseController.text
                                          : false;
                                      Navigator.of(context).pop(response);
                                    },
                                    percentScreen: 0.33,
                                    backgroundColor: kPrimaryColor,
                                  ),
                                if (widget.textAccept != null)
                                  CommonButton(
                                    text: widget.textAccept!,
                                    borderRadius: BorderRadius.circular(45),
                                    onTap: () {
                                      final response = widget.inputEnabled
                                          ? responseController.text
                                          : true;
                                      Navigator.of(context).pop(response);
                                    },
                                    percentScreen: 0.33,
                                    textColor: Colors.white,
                                    backgroundColor: kPrimaryColor,
                                  ),
                              ],
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget wInput() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 36.0,
        right: 36,
        bottom: 10,
      ),
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: responseController,
          decoration: Styles.inputText().copyWith(
            hintText: "Texto",
          ),
          autofocus: true,
          textAlign: TextAlign.center,
          style: const TextStyle(
          ),
          validator: widget.validator,
        ),
      ),
    );
  }
}
