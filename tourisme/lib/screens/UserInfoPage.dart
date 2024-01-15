import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class WhatsAppProfile extends StatefulWidget {
  @override
  _WhatsAppProfileState createState() => _WhatsAppProfileState();
}

class _WhatsAppProfileState extends State<WhatsAppProfile> {
  late ImagePicker _imagePicker;
  late PickedFile _pickedImage;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _pickedImage = PickedFile('');
  }

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _pickedImage = pickedFile as PickedFile;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Sélectionner une image'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.photo_library),
                            title: Text('Galerie'),
                            onTap: () {
                              _getImage(ImageSource.gallery);
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.photo_camera),
                            title: Text('Prendre une photo'),
                            onTap: () {
                              _getImage(ImageSource.camera);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _pickedImage.path.isNotEmpty
                    ? FileImage(File(_pickedImage.path))
                    : null,
                child: _pickedImage.path.isEmpty
                    ? Icon(Icons.add_a_photo, size: 40)
                    : null,
              ),
            ),
            SizedBox(height: 20),
            // ... autres éléments du profil
          ],
        ),
      ),
    );
  }
}

