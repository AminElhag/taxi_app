import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';

enum DocumentStatus {
  upload,
  uploading,
  uploaded,
}

class DocumentRow extends StatefulWidget {
  const DocumentRow({
    super.key,
    required this.obj,
    required this.onPressed,
    required this.onInfo,
    required this.onUpload,
    required this.onAction,
    required this.status,
  });

  final Map obj;
  final VoidCallback onPressed, onInfo, onUpload, onAction;
  final DocumentStatus status;

  @override
  State<DocumentRow> createState() => _DocumentRowState();
}

class _DocumentRowState extends State<DocumentRow> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          InkWell(
            onTap: widget.onPressed,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.obj['name'] as String? ?? "",
                                style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              const SizedBox(width: 4),
                              InkWell(
                                onTap: widget.onInfo,
                                child: Icon(Icons.info_outline, size: 16,
                                  color: TColor.secondary,),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                      text: widget.obj['detail'] as String? ??
                                          "",
                                      style: TextStyle(
                                          color: TColor.secondaryText,
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis
                                      ),
                                    ),
                                ),
                              ),
                              const SizedBox(width: 6,),
                              if (widget.status == DocumentStatus.uploaded)
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.check,
                                      size: 22,
                                      color: TColor.secondary,
                                    ),
                                    InkWell(
                                      onTap: widget.onAction,
                                      child: Icon(Icons.more_vert, size: 22,
                                        color: TColor.secondary,),
                                    )
                                  ],
                                )
                              else
                                if (widget.status == DocumentStatus.uploading)
                                  SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: CircularProgressIndicator(
                                      value: 0.3,
                                      color: TColor.primary,
                                      backgroundColor: TColor.placeholder,
                                    ),
                                  )
                                else
                                  if (widget.status == DocumentStatus.upload)
                                    TextButton(
                                      onPressed: widget.onUpload,
                                      child: Text(
                                        "UPLOAD",
                                        style: TextStyle(
                                            color: TColor.secondaryText,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
