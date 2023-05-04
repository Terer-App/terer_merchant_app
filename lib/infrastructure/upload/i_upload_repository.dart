import 'package:dartz/dartz.dart';

import 'dart:io';
import 'package:file_picker/file_picker.dart';

import '../../domain/upload/upload_repository.dart';

class IUploadFileRepository extends UploadFileRepository {
  @override
  Future<Either<String, File>> selectImageFile(
      {List<String> validExtensions = const ['png', 'jpg', 'jpeg']}) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
      // allowedExtensions: validExtensions,
    );

    if (result == null) return left('No File Selected');

    final path = result.files.single.path;

    final File file = File(path!);

    return right(file);
  }
}
