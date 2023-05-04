import 'dart:io';

import 'package:dartz/dartz.dart';

abstract class UploadFileRepository {
  Future<Either<String, File>> selectImageFile({List<String> validExtensions});
}
