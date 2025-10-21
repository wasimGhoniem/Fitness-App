import 'package:image_picker/image_picker.dart';

abstract interface class ImagePick {
  Future<dynamic> pickImage({ImageSource? imageSource});
}

class FromImagePickerPackage implements ImagePick {
  FromImagePickerPackage({ImagePicker? picker})
    : imagePicker = picker ?? ImagePicker();

  final ImagePicker imagePicker;
  @override
  Future<XFile?> pickImage({ImageSource? imageSource}) async {
    return await imagePicker.pickImage(source: imageSource!);
  }
}

